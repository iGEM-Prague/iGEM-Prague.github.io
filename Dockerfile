FROM jekyll/jekyll:4.2.2

# install dependencies
WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
RUN bundle install

# copy rest of the files
COPY . .

CMD ["jekyll", "serve", "--livereload", "--force_polling"]
