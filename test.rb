# frozen_string_literal: true

require 'simplecov'

::SimpleCov.command_name 'Brutal test suite'
::SimpleCov.start

require './lib/brutal/scaffold'

# ------------------------------------------------------------------------------

actual = begin
  ::Brutal::Scaffold.new("# frozen_string_literal: true", '"Hello " + "%{string}"', *"%{subject}.length", **{:string=>["Alice", "Bob"]})
end

raise if actual.blank_line != "\n# ------------------------------------------------------------------------------\n\n"
raise if actual.context_names != [:string]
raise if actual.test_params != [["Alice"], ["Bob"]]
raise if actual.to_s != "# frozen_string_literal: true\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Alice\"\nend\n\nraise if actual.length != 11\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Bob\"\nend\n\nraise if actual.length != 9\n"

# ------------------------------------------------------------------------------

actual = begin
  ::Brutal::Scaffold.new("# frozen_string_literal: true", '"Hello " + "%{string}"', *"%{subject}.to_s", **{:string=>["Alice", "Bob"]})
end

raise if actual.blank_line != "\n# ------------------------------------------------------------------------------\n\n"
raise if actual.context_names != [:string]
raise if actual.test_params != [["Alice"], ["Bob"]]
raise if actual.to_s != "# frozen_string_literal: true\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Alice\"\nend\n\nraise if actual.to_s != \"Hello Alice\"\n\n# ------------------------------------------------------------------------------\n\nactual = begin\n  \"Hello \" + \"Bob\"\nend\n\nraise if actual.to_s != \"Hello Bob\"\n"
