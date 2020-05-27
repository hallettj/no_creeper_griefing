# No Creeper Griefing

This is a [datapack][] for Minecraft Java Edition.
When the pack is loaded creeper explosions will not destroy blocks -
but explosions will still harm players and mobs.
Download the pack from the [releases][] page.

[datapack]: https://minecraft.gamepedia.com/Data_pack
[releases]: https://github.com/hallettj/no_creeper_griefing/releases/latest

![creeper](https://user-images.githubusercontent.com/9622/83075733-530f0380-a042-11ea-8d25-f9fd9ae2e0d2.png)

The pack works by temporarily disabling the [`mobGriefing`][mobGriefing] game
rule whenever a player gets close enough to a creeper to cause it to explode.
`mobGriefing` remains disabled until the same player is at least 26 blocks away
from any creeper to ensure that the creeper that got close either has already
exploded,
or is not going to explode before `mobGriefing` is switched back on.

[mobGriefing]: https://gaming.stackexchange.com/questions/308246/what-does-turning-off-mob-griefing-actually-do/308257

The advantage of disabling `mobGriefing` temporarily vs permanently is that
`mobGriefing` affects many other game features besides creeper explosions. For
example villagers cannot breed while `mobGriefing` is disabled because they
cannot pick up food.

**This datapack will override your `/gamerule mobGriefing` commands**. If you
want to disable `mobGriefing` permanently you will need to disable this
datapack.
