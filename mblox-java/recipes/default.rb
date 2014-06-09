src_filepath = "#{Chef::Config['file_cache_path']}"
src_filename = "#{node['mblox-java']['s3_file']}"
s3_source  = "#{node['mblox-java']['s3_path']}#{src_filename}"
dst_path     = "#{node['mblox-java']['destination']}"

log "message" do
  message "==>>> mblox-java: fetching package #{s3_source} to install"
  level :info
end

bash 'extract_mblox-java' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    wget "#{s3_source}"
    rpm -i "#{src_filename}"
  EOH
end

log "message" do
  message "==>>> mblox-java: Installed "
  level :info
end
