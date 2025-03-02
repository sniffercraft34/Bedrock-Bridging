# Remove blocks
execute as @a at @s unless entity @s[x_rotation=60..90] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 air replace structure_void

# Place blocks
execute as @a[scores={bedrock_bridging=2},x_rotation=60..90] at @s unless block ~ ~-1 ~ #bedrock_bridging:air if block ^ ^-2 ^1 #bedrock_bridging:non_ground run fill ~ ~-1 ~-1 ~ ~-1 ~1 structure_void replace air
execute as @a[scores={bedrock_bridging=2},x_rotation=60..90] at @s unless block ~ ~-1 ~ #bedrock_bridging:air if block ^ ^-2 ^1 #bedrock_bridging:non_ground run fill ~1 ~-1 ~ ~-1 ~-1 ~ structure_void replace air

# Enable the trigger command
scoreboard players enable @a bedrock_bridging

# Show the message and toggle
tellraw @a[scores={bedrock_bridging=3}] [{"text":"Bedrock Bridging: "},{"text":"OFF","color":"red"}]
tellraw @a[scores={bedrock_bridging=0}] [{"text":"Bedrock Bridging: "},{"text":"ON","color":"green"}]

# Toggle between ON (2) and OFF (1)
scoreboard players set @a[scores={bedrock_bridging=0}] bedrock_bridging 2
scoreboard players set @a[scores={bedrock_bridging=3}] bedrock_bridging 1

# Wrap invalid scores
scoreboard players set @a[scores={bedrock_bridging=3..}] bedrock_bridging 1

