#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "fileutils"
require "optparse"
require "time"   # ← FIX: ensures Time#iso8601 is available in GitHub Actions

#
# RX-HCM GRID NODE — Cluster Engine Generator (Stable Build)
# ----------------------------------------------------------
# Guarantees:
#   - Always writes: ./clusters/cluster-map.json
#   - Normalizes ALL paths regardless of runner execution directory
#   - Creates folder if missing
#   - Fails loudly if anything unexpected happens
#

# ----------------------------------------------------------
# Resolve project root (forcefully)
# ----------------------------------------------------------
PROJECT_ROOT = File.expand_path(File.join(__dir__, ".."))
CLUSTERS_DIR = File.join(PROJECT_ROOT, "clusters")
CLUSTER_MAP  = File.join(CLUSTERS_DIR, "cluster-map.json")

# ----------------------------------------------------------
# Parse arguments
# ----------------------------------------------------------
options = { k: 4 }
OptionParser.new do |opt|
  opt.on("--k N", Integer, "Number of clusters") { |v| options[:k] = v }
end.parse!

k = options[:k].to_i
abort("Invalid cluster count!") if k <= 0

# ----------------------------------------------------------
# Ensure target directory exists
# ----------------------------------------------------------
FileUtils.mkdir_p(CLUSTERS_DIR)

# ----------------------------------------------------------
# Generate cluster data
# ----------------------------------------------------------
clusters = Array.new(k) do |i|
  {
    id: i + 1,
    label: "C-#{i + 1}",
    weight: (rand * 1.0).round(5),
    entropy: (rand * 0.5 + 0.5).round(5),
    timestamp: Time.now.utc.iso8601  # ← NOW SAFE
  }
end

cluster_map = {
  generated_at: Time.now.utc.iso8601,
  engine: "Dynamic C-Engine",
  cluster_count: k,
  clusters: clusters
}

# ----------------------------------------------------------
# Write JSON (forced absolute path)
# ----------------------------------------------------------
begin
  File.open(CLUSTER_MAP, "w") do |f|
    f.write(JSON.pretty_generate(cluster_map))
  end
rescue => e
  abort("ERROR writing cluster-map.json → #{e.message}")
end

# ----------------------------------------------------------
# Verify file exists
# ----------------------------------------------------------
unless File.exist?(CLUSTER_MAP)
  abort("Cluster map failed to save. Expected at: #{CLUSTER_MAP}")
end

puts "Cluster map generated → #{CLUSTER_MAP}"
puts "Done."
