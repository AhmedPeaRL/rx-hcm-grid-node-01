#!/usr/bin/env ruby
# RX-HCM Cluster Generator · Node-01
# Version: 1.1 — Stable

require "json"
require "securerandom"
require "time"

# -------------------------------------------------------------------
# 1. SAFE TIMESTAMP HANDLER (no iso8601 runtime errors)
# -------------------------------------------------------------------
def safe_iso_time
  begin
    Time.now.utc.iso8601
  rescue
    Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
  end
end

# -------------------------------------------------------------------
# 2. READ SEEDS FROM /streams/*.txt
# -------------------------------------------------------------------
stream_files = Dir.glob("streams/*.txt").sort

if stream_files.empty?
  puts "No stream batches found in /streams/. Aborting."
  exit 1
end

seeds = stream_files.map do |f|
  {
    file: File.basename(f),
    lines: File.readlines(f, chomp: true).count
  }
end

# -------------------------------------------------------------------
# 3. CLUSTER BUILDING ENGINE (8 clusters default)
# -------------------------------------------------------------------
CLUSTER_COUNT = 8

clusters = (1..CLUSTER_COUNT).map do |i|
  {
    id: "cluster-#{i.to_s.rjust(2, '0')}",
    generated_at: safe_iso_time,
    vector: SecureRandom.hex(32),
    seed_links: seeds.sample(3) # كل Cluster مربوط بـ 3 seeds عشوائية
  }
end

# -------------------------------------------------------------------
# 4. FINAL CLUSTER DOCUMENT
# -------------------------------------------------------------------
cluster_doc = {
  node: "rx-hcm-grid-node-01",
  generated_at: safe_iso_time,
  cluster_count: CLUSTER_COUNT,
  seeds: seeds,
  clusters: clusters
}

# -------------------------------------------------------------------
# 5. OUTPUT → /clusters/cluster-map.json (auto-created if missing)
# -------------------------------------------------------------------
output_dir = "clusters"
Dir.mkdir(output_dir) unless Dir.exist?(output_dir)

output_path = File.join(output_dir, "cluster-map.json")
File.write(output_path, JSON.pretty_generate(cluster_doc))

puts "Cluster map generated → #{output_path}"
puts "Done."
