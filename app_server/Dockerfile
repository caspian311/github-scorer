FROM ruby:2.3

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
      mysql-client \
      nodejs \
      && rm -fR /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle install
COPY . .

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

ENV DATABASE_HOST github-scorer-db
ENV DATABASE_USERNAME root
ENV DATABASE_PASSWORD root
ENV DATABASE_DATABASE github-scorer

ENV SECRET_KEY_BASE f81feed8c535d2837843d10d7b1c326489f0f7d1e3c28d9363bb3bfbabe94cc21f944bdb6b5209b5867e5ea70c70db0f22287afbf1895fe4f4da06e10277c431

RUN bundle exec rake assets:precompile 

EXPOSE 3000


CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

