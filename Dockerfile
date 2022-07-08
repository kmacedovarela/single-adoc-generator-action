FROM ruby:2.6-stretch

LABEL "com.github.actions.name"="Asciidoc single page generator"
LABEL "com.github.actions.description"="Allows generating a single adoc file with content included in included partials, tags, etc."
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="purple"

WORKDIR /runner/action

COPY Gemfile* ./

COPY run.rb ./

RUN gem install bundler

RUN mkdir -p /runner/action

RUN bundle install --retry 3

ENV BUNDLE_GEMFILE /runner/action/Gemfile

RUN chmod +x /runner/action/run.rb

ENTRYPOINT ["ruby", "/runner/action/run.rb"]

