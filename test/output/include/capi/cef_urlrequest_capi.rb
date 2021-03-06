# Generated by ffi-gen. Please do not change this file by hand.

require 'ffi'

module CEF
  extend FFI::Library
  ffi_lib 'cef'
  
  def self.attach_function(name, *_)
    begin; super; rescue FFI::NotFoundError => e
      (class << self; self; end).class_eval { define_method(name) { |*_| raise e } }
    end
  end
  
  # (Not documented)
  class Request < FFI::Struct
    layout :dummy, :char
  end
  
  # (Not documented)
  class Response < FFI::Struct
    layout :dummy, :char
  end
  
  # Structure used to make a URL request. URL requests are not associated with a
  # browser instance so no cef_client_t callbacks will be executed. URL requests
  # can be created on any valid CEF thread in either the browser or render
  # process. Once created the functions of the URL request object must be
  # accessed on the same thread that created it.
  # 
  # = Fields:
  # :base ::
  #   (unknown) Base structure.
  # :get_request ::
  #   (FFI::Pointer(*)) Returns the request object used to create this URL request. The returned
  #   object is read-only and should not be modified.
  # :get_client ::
  #   (FFI::Pointer(*)) Returns the client.
  # :get_request_status ::
  #   (FFI::Pointer(*)) Returns the request status.
  # :get_request_error ::
  #   (FFI::Pointer(*)) Returns the request error if status is UR_CANCELED or UR_FAILED, or 0
  #   otherwise.
  # :get_response ::
  #   (FFI::Pointer(*)) Returns the response, or NULL if no response information is available.
  #   Response information will only be available after the upload has completed.
  #   The returned object is read-only and should not be modified.
  # :cancel ::
  #   (FFI::Pointer(*)) Cancel the request.
  class Urlrequest < FFI::Struct
    layout :base, :char,
           :get_request, :pointer,
           :get_client, :pointer,
           :get_request_status, :pointer,
           :get_request_error, :pointer,
           :get_response, :pointer,
           :cancel, :pointer
  end
  
  # Create a new URL request. Only GET, POST, HEAD, DELETE and PUT request
  # functions are supported. The |request| object will be marked as read-only
  # after calling this function.
  # 
  # @method urlrequest_create(request, client)
  # @param [Request] request 
  # @param [FFI::Pointer(*UrlrequestClient)] client 
  # @return [Urlrequest] 
  # @scope class
  attach_function :urlrequest_create, :cef_urlrequest_create, [Request, :pointer], Urlrequest
  
  # Structure that should be implemented by the cef_urlrequest_t client. The
  # functions of this structure will be called on the same thread that created
  # the request.
  # 
  # = Fields:
  # :base ::
  #   (unknown) Base structure.
  # :on_request_complete ::
  #   (FFI::Pointer(*)) Notifies the client that the request has completed. Use the
  #   cef_urlrequest_t::GetRequestStatus function to determine if the request was
  #   successful or not.
  # :on_upload_progress ::
  #   (FFI::Pointer(*)) Notifies the client of upload progress. |current| denotes the number of
  #   bytes sent so far and |total| is the total size of uploading data (or -1 if
  #   chunked upload is enabled). This function will only be called if the
  #   UR_FLAG_REPORT_UPLOAD_PROGRESS flag is set on the request.
  # :on_download_progress ::
  #   (FFI::Pointer(*)) Notifies the client of download progress. |current| denotes the number of
  #   bytes received up to the call and |total| is the expected total size of the
  #   response (or -1 if not determined).
  # :on_download_data ::
  #   (FFI::Pointer(*)) Called when some part of the response is read. |data| contains the current
  #   bytes received since the last call. This function will not be called if the
  #   UR_FLAG_NO_DOWNLOAD_DATA flag is set on the request.
  class UrlrequestClient < FFI::Struct
    layout :base, :char,
           :on_request_complete, :pointer,
           :on_upload_progress, :pointer,
           :on_download_progress, :pointer,
           :on_download_data, :pointer
  end
  
end
