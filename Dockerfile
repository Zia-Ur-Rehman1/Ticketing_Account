FROM ruby:3.2.0

RUN apt-get update && apt-get install -y
RUN apt-get install nano -y

WORKDIR /app
COPY Gemfile Gemfile.lock ./

EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]