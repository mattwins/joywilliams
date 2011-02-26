# Force checking of /opt path for OS X macports binaries

if (File.exist?('/opt/local/bin/identify'))
  Paperclip.options[:command_path] = '/opt/local/bin'
end

# Monkeypatch to get thumbnails working by allowing proper chaining

class Paperclip::Attachment
  def callback(which)
    # For some reason this inverts the boolean value result and halts
    # the processing chain for no apparent reason. result is typically nil
    # unless user-defined callbacks have been defined.
    instance.run_callbacks(which, @queued_for_write){ |result, obj| result }
  end
end
