path = require 'path'

{BufferedProcess, CompositeDisposable, project} = require 'atom'

module.exports =
  config:
    valePath:
      type: 'string'
      title: 'Path to your vale installation'
      default: 'vale'

    lintOnFly:
      type: 'boolean'
      title: 'Run linter after each edit (not only after saving)'
      default: true

    grammarScopes:
      type: 'array'
      title: 'List of scopes for languages vale will lint'
      default: [
        'source.gfm'
        'gfm.restructuredtext'
        'source.asciidoc'
        'text.md'
        'text.git-commit'
        'text.plain'
        'text.plain.null-grammar'
        'text.restructuredtext'
        'text.bibtex'
        'text.tex.latex'
        'text.tex.latex.beamer'
        'text.log.latex'
        'text.tex.latex.memoir'
        'text.tex'
      ]

  activate: =>
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.config.observe 'atomic-vale.valePath',
        (valePath) =>
          @valePath = valePath

    @subscriptions.add atom.config.observe 'atomic-vale.lintOnFly',
      (lintOnFly) =>
        @lintOnFly = lintOnFly

    @subscriptions.add atom.config.observe 'atomic-vale.grammarScopes',
      (grammarScopes) =>
        @grammarScopes = grammarScopes

  deactivate: =>
      @subscriptions.dispose()

  provideLinter: =>
    provider =
      name: 'vale'

      grammarScopes: @grammarScopes

      scope: 'file'

      lintOnFly: @lintOnFly

      lint: (textEditor) =>
        filePath = textEditor.getPath()
        inputText = textEditor.getText()
        fileExtension = path.extname(filePath)
        fileDirectory = path.dirname(filePath)
        output = ''

        runLinter = (resolve) =>
          onError = ({error,handle}) =>
            atom.notifications.addError "Error running #{@valePath}",
              detail: "#{error.message}"
              dismissable: true
            handle()
            return []

          lintProcess = new BufferedProcess
            command: @valePath

            args: ["--ext=#{fileExtension}", '--output=JSON', "'#{inputText}'"],

            options: {
              cwd: fileDirectory
            }

            stdout: (data) =>
              output += data

            exit: (code) =>
              if output.length <= 3 # if empty object
                output = "{\"stdin#{fileExtension}\":[]}"

              feedback = JSON.parse(output)["stdin#{fileExtension}"] or
                JSON.parse(output)['stdinunknown']
              messages = []
              for message in feedback
                atomMessageLine = message.Line - 1
                atomMessageRow = message.Span[0] - 1
                isDuplicate = messages.some (existingMessage) =>
                    existingMessage.range[0][0] == atomMessageLine and
                    existingMessage.range[0][1] == atomMessageRow
                if not isDuplicate
                  messages.push
                    type: if message.Severity == 'suggestion' then 'info' else message.Severity
                    text: message.Message
                    filePath: filePath
                    range: [
                      [atomMessageLine, atomMessageRow]
                      [atomMessageLine, message.Span[1]]
                    ]

              resolve messages

          lintProcess.onWillThrowError ({error, handle}) => onError

        return new Promise (resolve, reject) =>
          runLinter(resolve)
