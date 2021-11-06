execute store result score @s TEMP run data get entity @s data.resultCost
execute as @a[predicate=cartoonish:nbt/on_ground_1,predicate=cartoonish:nbt/shift,distance=..0.5] if score @s ct_lvl >= @e[sort=nearest,limit=1,type=marker,tag=ct_enchant] TEMP run tag @s add ct_pop_result
execute unless entity @p[distance=..0.5,tag=ct_pop_result] as @a[predicate=cartoonish:nbt/on_ground_1,distance=..0.5] if score @s ct_lvl >= @e[sort=nearest,limit=1,type=marker,tag=ct_enchant] TEMP run title @s actionbar [{"text":"Cost ","color":"green","bold": true},{"score":{"objective":"TEMP","name":"@e[sort=nearest,limit=1,type=marker,tag=ct_enchant]"}},{"text":" levels"}]
execute unless entity @p[distance=..0.5,tag=ct_pop_result] as @a[predicate=cartoonish:nbt/on_ground_1,distance=..0.5] unless score @s ct_lvl >= @e[sort=nearest,limit=1,type=marker,tag=ct_enchant] TEMP run title @s actionbar [{"text":"Cost ","color":"red","bold": true},{"score":{"objective":"TEMP","name":"@e[sort=nearest,limit=1,type=marker,tag=ct_enchant]"}},{"text":" levels"}]

execute if entity @p[distance=..0.5,tag=ct_pop_result] run function cartoonish:enchant/reward/result/item