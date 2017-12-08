require 'urbanairship'


module Urbanairship
  module Devices
    class ChannelInfo
      include Urbanairship::Common
      include Urbanairship::Loggable
      attr_writer :client

      def initialize(client: required('client'))
        @client = client
      end

      def lookup(uuid: required('uuid'))
        response = @client.send_request(
          method: 'GET',
          url: CHANNEL_URL + uuid
        )
        logger.info("Retrieved channel information for #{uuid}")
        response['body']['channel']
      end
    end

    class ChannelList < Urbanairship::Common::PageIterator
      def initialize(client: required('client'))
        super(client: client)
        @next_page = CHANNEL_URL
        @data_attribute = 'channels'
      end
    end

    class Feedback
      include Urbanairship::Common
      include Urbanairship::Loggable

      def initialize(client: required('client'))
        @client = client
      end

      def device_token(since: required('device token'))
        url = DT_FEEDBACK_URL + '?since=' + since
        get_feedback(url: url)
      end

      def apid(since: required('since'))
        url = APID_FEEDBACK_URL + '?since=' + since
        get_feedback(url: url)
      end

      def get_feedback(url: required('url'))
        response = @client.send_request(
            method: 'GET',
            url: url
        )
        logger.info("Requested feedback at url #{url}")
        response
      end
    end

    class DeviceToken
      include Urbanairship::Common
      include Urbanairship::Loggable

      def initialize(client: required('client'))
        @client = client
      end

      def lookup(token: required('token'))
        fail ArgumentError, 'token needs to be a string' unless token.is_a? String

        resp = @client.send_request(
          method: 'GET',
          url: DEVICE_TOKEN_URL + token
        )
        logger.info("Looking up info on device token #{token}")
        resp
      end
    end

    class DeviceTokenList < Urbanairship::Common::PageIterator
      include Urbanairship::Common
      include Urbanairship::Loggable

      def initialize(client: required('client'))
        super(client: client)
        @next_page = DEVICE_TOKEN_URL
        @data_attribute = 'device_tokens'
      end

      def count
        resp = @client.send_request(
          method: 'GET',
          url: DEVICE_TOKEN_URL + 'count/'
        )
        logger.info("Retrieved count of Device Token List.")
        resp
      end
    end

    class APID
      include Urbanairship::Common
      include Urbanairship::Loggable

      def initialize(client: required('client'))
        @client = client
      end

      def lookup(apid: required('apid'))
        fail ArgumentError, 'apid needs to be a string' unless apid.is_a? String

        resp = @client.send_request(
          method: 'GET',
          url: APID_URL + apid
        )
        logger.info("Retrieved info on apid #{apid}")
        resp
      end
    end

    class APIDList < Urbanairship::Common::PageIterator
      def initialize(client: required('client'))
        super(client: client)
        @next_page = APID_URL
        @data_attribute = 'apids'
      end
    end
  end
end