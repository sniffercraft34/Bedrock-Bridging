# Schedule the loop every 5 ticks
schedule function bedrock_bridging:main 5t append

# Remove blocks
execute as @a at @s unless entity @s[x_rotation=55..75] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 air replace structure_void

# Place blocks
execute as @a[scores={bedrock_bridging=-1},x_rotation=65..75] at @s unless block ~ ~-1 ~ #bedrock_bridging:air if block ~ ~-2 ~1 #bedrock_bridging:non_ground run fill ~ ~-1 ~-1 ~ ~-1 ~1 structure_void replace air
execute as @a[scores={bedrock_bridging=-1},x_rotation=65..75] at @s unless block ~ ~-1 ~ #bedrock_bridging:air if block ~1 ~-2 ~ #bedrock_bridging:non_ground run fill ~1 ~-1 ~ ~-1 ~-1 ~ structure_void replace air

# Toggle
scoreboard players enable @a bedrock_bridging
tellraw @a[scores={bedrock_bridging=1}] [{"text":"Bedrock Bridging: "},{"text":"ON","color":"green"}]
tellraw @a[scores={bedrock_bridging=0}] [{"text":"Bedrock Bridging: "},{"text":"OFF","color":"red"}]
scoreboard players set @a[scores={bedrock_bridging=1}] bedrock_bridging -1
scoreboard players set @a[scores={bedrock_bridging=0}] bedrock_bridging 2
scoreboard players set @a[scores={bedrock_bridging=3}] bedrock_bridging 1
