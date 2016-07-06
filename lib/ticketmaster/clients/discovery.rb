module Ticketmaster
  class Client
    module Discovery
      def search_events(options={})
        options[:version] ||= 'v2'
        options[:params] ||= {}

        request  = Request.new("discovery/#{options[:version]}/events", options[:params], self)
        response = request.get
        Result.search(response, request, 'events')
      end

      def get_event(id, options={})
        options[:version] ||= 'v2'

        request  = Request.new("discovery/#{options[:version]}/events/#{id}", {}, self)
        response = request.get
        Result.create(response, request, 'Ticketmaster::Event')
      end

      def get_event_images(id, options={})
        options[:version] ||= 'v2'

        request  = Request.new("discovery/#{options[:version]}/events/#{id}/images", {}, self)
        response = request.get
        Result.array(response['images'], request, 'Ticketmaster::Image')
      end

      def search_attractions(options={})
        options[:version] ||= 'v2'
        options[:params] ||= {}

        request  = Request.new("discovery/#{options[:version]}/attractions", options[:params], self)
        response = request.get
        Result.search(response, request, 'attractions')
      end

      def get_attraction(id, options={})
        options[:version] ||= 'v2'

        request  = Request.new("discovery/#{options[:version]}/attractions/#{id}", {}, self)
        response = request.get
        Result.create(response, request, 'Ticketmaster::Attraction')
      end

      def search_classifications(options={})
        options[:version] ||= 'v2'
        options[:params] ||= {}

        request  = Request.new("discovery/#{options[:version]}/classifications", options[:params], self)
        response = request.get
        Result.search(response, request, 'classifications')
      end

      def get_classification(id, type, options={})
        options[:version] ||= 'v2'

        request  = Request.new("discovery/#{options[:version]}/#{type}/#{id}", {}, self)
        response = request.get
        Result.create(response, request, 'Ticketmaster::Classification')
      end

      def search_venues(options={})
        options[:version] ||= 'v2'
        options[:params] ||= {}

        request  = Request.new("discovery/#{options[:version]}/venues", options[:params], self)
        response = request.get
        Result.search(response, request, 'venues')
      end

      def get_venue(id, options={})
        options[:version] ||= 'v2'

        request  = Request.new("discovery/#{options[:version]}/venues/#{id}", {}, self)
        response = request.get
        Result.create(response, request, 'Ticketmaster::Venue')
      end

      def get_legacy_event(id, options={})
        options[:version] ||= 'v2'

        request  = Request.new("discovery/#{options[:version]}/events/legacy/#{id}", {}, self)
        response = request.get
        Result.create(response, request, 'Ticketmaster::Event')
      end
    end
  end
end
