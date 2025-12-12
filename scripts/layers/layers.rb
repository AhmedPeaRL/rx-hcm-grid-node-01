#!/usr/bin/env ruby
require "json"

# === Layer Engine Config ===
LAYER_COUNT = 3             # ثلاث طبقات فوق الـ 8 clusters
SEED = Time.now.to_i % 997 # ثابت تخميني لعدم تكرار النتائج
srand(SEED)

# === Input: cluster-map.json must exist ===
cluster_map = JSON.parse(File.read("cluster_map.json"))
clusters = cluster_map["clusters"]

timestamp = Time.now.utc.iso8601
layer_blocks = []

# === Helper: compute resonance score between clusters ===
def resonance(a, b)
  base = ((a["weight"] + b["weight"]) / 2.0)
  entropy_factor = ((a["entropy"] + b["entropy"]) / 2.0)
  link_variation = rand * 0.3 + 0.85
  (base * entropy_factor * link_variation).round(6)
end

# === Build layers ===
(1..LAYER_COUNT).each do |layer_id|
  connections = []

  clusters.combination(2).each do |a, b|
    r = resonance(a, b)
    next if r < 0.15

    connections << {
      "pair" => "#{a["label"]}-#{b["label"]}",
      "resonance" => r,
      "layer" => layer_id
    }
  end

  layer_blocks << {
    "layer_id" => layer_id,
    "generated_at" => timestamp,
    "connections" => connections.sample(rand(4..12))
  }
end

# === Output file ===
output = {
  "generated_at" => timestamp,
  "layers" => layer_blocks
}

File.write("layer-map.json", JSON.pretty_generate(output))

puts "Generated layer-map.json with #{LAYER_COUNT} layers."
