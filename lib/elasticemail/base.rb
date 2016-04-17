module Elasticemail

  class ElasticemailSettingsMissingError < StandardError; end

  module Base
    class Response
      def initialize(resp)
        @resp = JSON(resp.body)
      end

      def body
        @resp
      end

      def success?
        @resp['success']
      end

      def fail?
        !success?
      end

      def error
        @resp['error']
      end

      def data
        @resp['data']
      end
    end

    def perform
      params           = build_params
      params[:api_key] = api_key

      Timeout::timeout(Elasticemail.settings[:timeout]) do
        @response =  session.get do |request|
                        request.path   = [version, path].join('/')
                        request.params = params
                      end
        last_response
      end
    end

    def last_response
      Response.new(@response)
    end

    def build_params
      {}.tap do |params|
        mapping.each do |k,v|
          next unless value = public_send(k)
          params[v] = value
        end
      end
    end

    def assign_attrinbutes(params)
      raise(StandardError, "Attributes needs to be a hash") unless params === Hash
      params.each do |k,v|
        public_send("#{k}=",v)
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

    def api_key
      raise ElasticemailSettingsMissingError, 'You must provide a ELASTIC_EMAIL_API_KEY' unless Elasticemail.settings[:api_key]
      Elasticemail.settings[:api_key]
    end

    def host
      raise ElasticemailSettingsMissingError, 'You must provide a ELASTIC_EMAIL_HOST_KEY' unless Elasticemail.settings[:host]
      Elasticemail.settings[:host]
    end

    def version
      raise ElasticemailSettingsMissingError, 'You must provide a ELASTIC_EMAIL_HOST_KEY' unless Elasticemail.settings[:version]
      Elasticemail.settings[:version]
    end
  end
end
