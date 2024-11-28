# Schedule the loop every tick
schedule function bedrock_bridging:main 1t append

# Remove blocks
execute as @a at @s unless entity @s[x_rotation=55..75] run fill ~3 ~3 ~3 ~-3 ~-3 ~-3 air replace structure_void

# Place blocks
execute as @a[scores={bedrock_bridging=-1},x_rotation=55..75] at @s unless block ~ ~-1 ~ #bedrock_bridging:air run fill ~ ~-1 ~-1 ~ ~-1 ~1 structure_void replace air
execute as @a[scores={bedrock_bridging=-1},x_rotation=55..75] at @s unless block ~ ~-1 ~ #bedrock_bridging:air run fill ~1 ~-1 ~ ~-1 ~-1 ~ structure_void replace air

# Toggle
scoreboard objectives add bedrock_bridging trigger
scoreboard players enable @a bedrock_bridging
tellraw @a[scores={bedrock_bridging=1}] [{"text":"Bedrock Bridging: "},{"text":"ON","color":"green"}]
tellraw @a[scores={bedrock_bridging=0}] [{"text":"Bedrock Bridging: "},{"text":"OFF","color":"red"}]
scoreboard players set @a[scores={bedrock_bridging=1}] bedrock_bridging -1
scoreboard players set @a[scores={bedrock_bridging=0}] bedrock_bridging 2
scoreboard players set @a[scores={bedrock_bridging=3}] bedrock_bridging 1
