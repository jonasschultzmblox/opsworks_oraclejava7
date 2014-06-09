src_filepath = "#{Chef::Config['file_cache_path']}"
src_filename = "#{node['mblox_java']['s3_file']}"
s3_source  = "#{node['mblox_java']['s3_path']}#{src_filename}"
dst_path     = "#{node['mblox_java']['destination']}"

log "message" do
  message "==>>> mblox_java: fetching package #{s3_source} to install"
  level :info
end

bash 'extract_mblox_java' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    wget "#{s3_source}"
    rpm -i "#{src_filename}"
  EOH
end

log "message" do
  message "==>>> mblox_java: Installed "
  level :info
end
