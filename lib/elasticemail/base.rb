module Elasticemail

  class ElasticemailSettingsMissingError < StandardError; end

  module Base

    class ResponseJson
      def initialize(response)
        @raw_response = response
        @json = if response_json?
                  JSON(@raw_response.body)
                else
                  {'data' =>  @raw_response.body}
                end
      end

      def body
        @json
      end

      def success?
        @json['success']
      end

      def fail?
        !success?
      end

      def error
        @json['error']
      end

      def data
        @json['data']
      end

      def response_json?
        @raw_response.headers["content-type"].to_s =~ /json/
      end
    end


    def perform
      params = build_params
      params["apikey"] ||= _api_key

      Timeout::timeout(Elasticemail.settings[:timeout]) do
        @response =  session.get do |request|
                        request.path   = [version, path].join('/')
                        request.params = params
                      end
        last_response
      end
    end

    def last_response
      ResponseJson.new(@response)
    end

    def build_params
      {}.tap do |params|
        mapping.each do |k,v|
          next unless value = public_send(k)
          params[v] = value
        end
      end
    end

    def session
      @session ||= Faraday.new(url: "#{Elasticemail.settings[:host]}")
    end

    def path
      @path || raise(NotImplementedError, 'path is required')
    end

    def mapping
      raise(NotImplementedError, 'mapping is required')
    end

    def host
      raise ElasticemailSettingsMissingError, 'You must provide a ELASTIC_EMAIL_HOST_KEY' unless Elasticemail.settings[:host]
      Elasticemail.settings[:host]
    end

    def version
      raise ElasticemailSettingsMissingError, 'You must provide a ELASTIC_EMAIL_HOST_KEY' unless Elasticemail.settings[:version]
      Elasticemail.settings[:version]
    end

    private
    def _api_key
      raise ElasticemailSettingsMissingError, 'You must provide a ELASTIC_EMAIL_API_KEY' unless Elasticemail.settings[:api_key]
      Elasticemail.settings[:api_key]
    end
  end
end
