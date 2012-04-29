require "spec_helper"
require "heroku_log_parser/parser"

describe HerokuLogParser::Parser do

  subject { HerokuLogParser::Parser.parse(line) }

  shared_examples_for "parser" do
    it { should be_json_eql(json) }
  end

  context "heroku[router]" do
    let(:line) { "2012-04-29T15:57:54+00:00 heroku[router]: GET www.foo.com/autocomplete/schools?q=Colegio+American dyno=web.4 queue=0 wait=0ms service=17ms status=200 bytes=496" }
    let(:json) {
      {
        timestamp:  "2012-04-29T15:57:54+00:00",
        source: "heroku",
        process: "router",
        message: "GET www.foo.com/autocomplete/schools?q=Colegio+American dyno=web.4 queue=0 wait=0ms service=17ms status=200 bytes=496"
      }.to_json
    }

    it_behaves_like "parser"
  end

  context "heroku[nginx]" do
    let(:line) { %(2012-04-29T15:57:55+00:00 heroku[nginx]: 85.49.160.142 - - [29/Apr/2012:15:57:55 +0000] "GET /autocomplete/schools?q=Colegio+Am HTTP/1.1" 200 454 "http://www.foo.com/candidate/edit" "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.162 Safari/535.19" www.foo.com) }
    let(:json) {
      {
        timestamp:  "2012-04-29T15:57:55+00:00",
        source: "heroku",
        process: "nginx",
        message: %(85.49.160.142 - - [29/Apr/2012:15:57:55 +0000] "GET /autocomplete/schools?q=Colegio+Am HTTP/1.1" 200 454 "http://www.foo.com/candidate/edit" "Mozilla/5.0 (Windows NT 6.0) AppleWebKit/535.19 (KHTML, like Gecko) Chrome/18.0.1025.162 Safari/535.19" www.foo.com)
      }.to_json
    }

    it_behaves_like "parser"
  end

  context "heroku[process.X]" do
    let(:line) { %(2012-04-29T15:57:50+00:00 heroku[web.4]: Error R14 (Memory quota exceeded)) }
    let(:json) {
      {
        timestamp:  "2012-04-29T15:57:50+00:00",
        source: "heroku",
        process: "web.4",
        message: "Error R14 (Memory quota exceeded)" 
      }.to_json
    }

    it_behaves_like "parser"
  end
end
