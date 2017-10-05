FROM ruby:2.3

RUN mkdir -p /demo
# ADD print-file.rb /demo/
ADD shrug.rb /demo/
ADD config.yml /demo/

# ENTRYPOINT ["env-wrapper.sh"]
# CMD ["ruby", "/demo/print-file.rb"]
CMD ["ruby", "/demo/shrug.rb"]
