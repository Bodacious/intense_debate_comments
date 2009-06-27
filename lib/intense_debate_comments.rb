module IntenseDebateComments
  module ViewHelpers
    
    # call this method in your view to add comments to obj
    def id_comments(obj, options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:acct_no, :url, :title)
      # options[:acct_no] takes priority over ID_ACCT_NO
      options[:acct_no] = acct_no unless options[:acct_no]
      raise ArgumentError, "You must specify an IntenseDebate account number", options if options[:acct_no].nil?
      raise "Intense Debate account no. doesn't look valid" unless options[:acct_no] =~ /[\w]{32}/ # => ensure the account no is valid
      options[:url].is_a?(String) # => ensure the url is a string
      options[:title].is_a?(String) # => ensure the url is a string
      concat_line "<script type=\"text/javascript\">"
      concat_line "  var idcomments_acct = '#{ options[:acct_no] }';"
      concat_line "  var idcomments_post_id = '#{ obj.id }';"
      concat_line "  var idcomments_post_url #{ "='%s'" % options[:url] unless options[:url].nil? };"
      concat_line "  var idcomments_post_title #{ "='%s'" % options[:title] unless options[:title].nil? };"
      concat_line "</script>"
      concat_line "<span id='IDCommentsPostTitle' style='display:none'></span>\n"
      concat_line "<script type='text/javascript' src='http://www.intensedebate.com/js/genericCommentWrapperV2.js'></script>\n"
      nil
    end

    # call this method in your view to add a comments counter and a link to obj
    def id_comments_link(obj, options = {})
      options.symbolize_keys!
      options.assert_valid_keys(:acct_no, :url)
      # options[:acct_no] takes priority over ID_ACCT_NO
      options[:acct_no] = acct_no unless options[:acct_no]
      raise ArgumentError, "You must specify an IntenseDebate account number", options if options[:acct_no].nil?
      raise "Intense Debate account no. doesn't look valid" unless options[:acct_no] =~ /[\w]{32}/ # => ensure the account no is valid
      options[:url].is_a?(String) # => ensure the url is a string
      options[:title].is_a?(String) # => ensure the url is a string
      concat_line "<script type=\"text/javascript\">"
      concat_line "  var idcomments_acct = '#{ options[:acct_no] }';"
      concat_line "  var idcomments_post_id = '#{ obj.id }';"
      concat_line "  var idcomments_post_url = '#{ options[:url] ? options[:url] : self.send( :"#{obj.class.to_s.underscore}_path", obj ) }';"
      concat_line "</script>"
      concat_line "<script type=\"text/javascript\" src=\"http://www.intensedebate.com/js/genericLinkWrapperV2.js\"></script>"
      nil
    end
    
    # adds a line-break to the end of each concatenated line
    def concat_line(string, unused_binding = nil)
      output_buffer << string + "\n"
    end
    
    
    protected
    
    # fectches the ID_ACCT_NO if not specified in options.
    def acct_no
      raise "Please set ID_ACCT_NO in ApplicationController." unless defined?(ApplicationController::ID_ACCT_NO)
      ApplicationController::ID_ACCT_NO
    end
  end
  
end
