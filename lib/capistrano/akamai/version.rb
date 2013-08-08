require 'akamai_api'

module Capistrano
  module Akamai
    VERSION = '0.0.1'

    def self.extend(configuration)
      configuration.load do
        Capistrano::Configuration.instance.load do

          _cset(:akamai_username, ENV['AKAMAI_USERNAME'])
          _cset(:akamai_password, ENV['AKAMAI_PASSWORD'])
          _cset(:akamai_cpcode, ENV['AKAMAI_CPCODE'])
          _cset(:akamai_emails, [''])

          AkamaiApi.config.merge! :auth => [fetch(:akamai_username), fetch(:akamai_password)]

          namespace :akamai do

            namespace :invalidate do

              desc 'Mark the cached content in a cpcode as invalid'
              task :cpcode do
                AkamaiApi::Ccu.invalidate_cpcode fetch(:akamai_cpcode), :email => fetch(:akamai_emails)
              end

            end
          end
        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  Capistrano::Akamai.extend(Capistrano::Configuration.instance)
end

