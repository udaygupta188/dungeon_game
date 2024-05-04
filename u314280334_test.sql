-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 03, 2024 at 09:29 PM
-- Server version: 10.11.7-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u314280334_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `diary`
--

CREATE TABLE `diary` (
  `id` int(11) NOT NULL,
  `text` text CHARACTER SET utf8mb3 COLLATE utf8mb3_latvian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diary`
--

INSERT INTO `diary` (`id`, `text`) VALUES
(1, 'I guess I can’t have everything. Where would I put it?'),
(2, 'Ran with scissors. Nearly died.'),
(3, 'Sold everything except my soul. The trader didn’t want it, even when I tried to throw it in for free.'),
(4, 'Great One, I remember very little of last night.'),
(5, 'How the heck am I writing this, with my body lying several feet away from my head and all…'),
(6, '‘Watch where you tread!’ the monster said. It hit my head; I may have bled. I turned and fled. My face is red, but I’m not dead.'),
(7, 'It’s embarrassing how silly some of the things I used to write are!'),
(8, 'Sat on a rock to have lunch, but was stunned by a sudden roar from a Goblin.'),
(9, 'I give a fake gold coin to trader.'),
(10, 'I had sudden feeling something is bad.'),
(11, 'I get worm feeling from heaven. Is it something more powerful?'),
(12, 'I cant believe i saved that much money.'),
(13, 'Forget our hope of ever seeing Heaven!'),
(14, 'Feigned a few ailments to spend more time with the cute healer.'),
(15, 'I took a quiet and refreshing bath.'),
(16, 'Used the pet door when entering Dreamland to avoid the “entrance fee” the guards charge at the main gate.'),
(17, 'Threw a coin down a well. Quickly fled when it was thrown back.'),
(18, 'I\'ve just realized that with great power comes great risk of getting yourself killed. Heading back to town.'),
(19, 'Sucked all of the alcohol wipes dry while the healer wasn\'t looking. Instantly felt much better.'),
(20, 'The trader wanted to charge me an arm and a leg.'),
(21, 'Nasty Goblin twins just hided in bushes!'),
(22, 'Can i just stop using healing potions?'),
(23, 'The Brain Slugs Farm is the ideal spot for a holiday, if you want it to be your last one.'),
(24, 'I think someone is talking to me...'),
(25, 'My life was saved again!'),
(26, 'Heard a loud rumble in the distance.'),
(27, 'I tried to sneak in Dwarfs cave.'),
(28, 'My healer tried fire ball magic. Don\'t look good.'),
(29, 'Someone in Town told you can die from magic.'),
(30, 'It\'s been a while since anything bad has happened.'),
(31, 'I pick things up very quickly. Then put them down just as fast.'),
(32, 'It swore things would be different next time.'),
(33, 'Strange words floated by in a puff of smoke: “You\'re doing great! I\'m proud of you.”'),
(34, 'I just saw a Dragon! I knew it! They are real.'),
(35, 'I can see a dark forest in distance.'),
(36, 'Three cyclops just smashed a massive fish!'),
(37, 'The Daemon snatched a coffin nail from me and swallowed it whole.'),
(38, 'After losing in a fair fight, the Old Shaman resigned to the totem and sacrificed itself to the Gods.'),
(39, 'I feel so lazy today!'),
(40, 'Graveyard sweet home!'),
(41, 'Beautiful bird songs healing my soul.'),
(42, 'Its time for adventure! On my way to Dragons nest.'),
(43, 'Persuaded the trader to buy junk from me for a good price.'),
(44, 'I\'m not sure anymore if i can join Wizards guild.'),
(45, 'Nice staff or a sword? What to pick?'),
(46, 'From Dreamland to tavern is my way.'),
(47, 'Tried lighting a bonfire but none of my magic scrolls were working.'),
(48, 'Some mad Dwarfs are looking for me.'),
(49, 'Any chance to find a Troll in forest?'),
(50, 'I really hate spending my gold coins.'),
(51, 'Found a piece of a map with a marked spot among the wreckage left after the battle. Maybe I should check it out.'),
(52, 'Goblins have the best meat! I\'m really hungry.'),
(53, 'Priest offers me to teach a light magic.'),
(54, 'The woods are lovely, dark, and deep. Ooh, sounds scary. I think I\'ll stay on the path, then.'),
(55, 'It\'s all fun and games until somebody loses an eye.'),
(56, 'Found the body of a dead Adventurer by the side of the road.'),
(57, 'I think someone is hiding behind bushes.'),
(58, 'The chicken suddenly lost interest in chasing me and crept back to where we first met.'),
(59, 'Wasn\'t so good idea to drink fire potion.'),
(60, 'Singe says on the left is Dwarven Hills!'),
(61, 'In Elf\'s town i find curved my name on the wall.'),
(62, 'Interesting where i can get a horse? '),
(63, 'Lets drink red potion...green...and orange to.'),
(64, 'Other adventurer just passed me.'),
(65, 'Night was pretty bad.'),
(66, 'So lovely day! I feel happiness. '),
(67, 'Grey Wizard was spotted in distance. Should i be worried?'),
(68, 'I cant stand the Trolls! Always make a trouble.'),
(69, 'After long sleep its time to move.'),
(70, 'I need a new equipment. Heading to towns direction.'),
(71, 'Dreamland is strange place.'),
(72, 'I was refused to enter Hobbits Hat. '),
(73, 'It wasn\'t a easy task, but city wall need restoration. '),
(74, 'My head feels like it\'s bursting with knowledge and wisdom.'),
(75, 'Followed the road less traveled.'),
(76, 'Saw a shady trader by the road.'),
(77, 'From now on, i shall completely devote myself to my quests.'),
(78, 'The voices in my head telling me to do thinks.'),
(79, 'Came to a sign reading \"The point of no return\".'),
(80, 'Tried to let my fist do the talking.'),
(81, 'I hope no one will kick me out of Tavern.'),
(82, 'Sitting here in the warmth of Elf city and watching my level grow with no risk of death is simply wonderful. '),
(83, 'I lost from staring in the map.'),
(84, 'Was watching Wizard and Knight battle.'),
(85, 'I need to find Adventurer guild!'),
(86, 'Castle guards are scary, i think i pass this time.'),
(87, 'Find a couple gold coins in my pocket.'),
(88, 'Dragon is flying over Dreamland. What a miracle.'),
(89, 'Is it even worth it to wash myself in river?'),
(90, 'Someone hit me in the head from behind. Watch your steps!'),
(91, 'Blacksmith is near, i wanna sell my stuff.'),
(92, 'I saw a evil Dragon.'),
(93, 'It is the last moment to heal myself up.'),
(94, 'I just drank stone skin potion. I cant move.'),
(95, 'It is hard risk to take i told Goblin.'),
(96, 'Someone just threw rock at me.'),
(97, 'I wish i could be immortal. And big swing came to me.'),
(98, 'I heard silence whispers in the wind.'),
(99, 'I just lost my shoe in swamp!');

-- --------------------------------------------------------

--
-- Table structure for table `diaryinventory`
--

CREATE TABLE `diaryinventory` (
  `diaryinventoryID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `diary_1` int(11) NOT NULL DEFAULT 0,
  `diary_2` int(11) NOT NULL DEFAULT 0,
  `diary_3` int(11) NOT NULL DEFAULT 0,
  `diary_4` int(11) NOT NULL DEFAULT 0,
  `diary_5` int(11) NOT NULL DEFAULT 0,
  `diary_6` int(11) NOT NULL DEFAULT 0,
  `diary_7` int(11) NOT NULL DEFAULT 0,
  `diary_8` int(11) NOT NULL DEFAULT 0,
  `diary_9` int(11) NOT NULL DEFAULT 0,
  `diary_10` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `diaryinventory`
--

INSERT INTO `diaryinventory` (`diaryinventoryID`, `userID`, `diary_1`, `diary_2`, `diary_3`, `diary_4`, `diary_5`, `diary_6`, `diary_7`, `diary_8`, `diary_9`, `diary_10`) VALUES
(46, 114, 89, 67, 11, 27, 44, 89, 31, 39, 75, 16),
(47, 115, 10, 32, 29, 49, 30, 15, 1, 26, 99, 1),
(48, 116, 92, 90, 5, 22, 92, 21, 39, 84, 58, 10),
(49, 117, 30, 10, 70, 38, 7, 83, 52, 65, 25, 71),
(50, 118, 23, 85, 43, 66, 97, 77, 99, 69, 80, 60),
(51, 119, 19, 1, 82, 47, 96, 48, 85, 72, 95, 78),
(52, 120, 52, 26, 24, 35, 90, 26, 95, 85, 67, 68),
(53, 121, 62, 66, 72, 14, 77, 54, 49, 10, 62, 70),
(54, 122, 25, 99, 31, 32, 61, 70, 71, 4, 22, 24),
(55, 123, 27, 55, 44, 79, 58, 27, 88, 89, 90, 14),
(56, 124, 1, 13, 75, 30, 3, 6, 83, 61, 46, 41),
(57, 125, 71, 59, 78, 98, 5, 58, 38, 40, 85, 20),
(58, 126, 34, 27, 22, 61, 19, 94, 80, 19, 60, 4),
(59, 127, 6, 64, 91, 57, 57, 30, 10, 9, 48, 44),
(60, 135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `parts` text NOT NULL,
  `att` int(11) NOT NULL,
  `def` int(11) NOT NULL,
  `luc` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `gold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `parts`, `att`, `def`, `luc`, `hp`, `gold`) VALUES
(1, 'Magic hat', 'head', 2, 1, 0, 2, 17),
(2, 'Old robe', 'body', 0, 3, 0, 2, 22),
(3, 'Gose leather boots', 'foot', 0, 2, -1, -1, 15),
(4, 'Club', 'Weapon', 1, 1, 0, 1, 45),
(5, 'Black helmet', 'head', 2, 0, 1, 2, 22),
(6, 'Armor of purity', 'body', 0, 1, 0, 5, 15),
(7, 'Iron basket', 'head', 0, 3, 0, 5, 30),
(8, 'All-terrain sandals', 'foot', 0, 0, 1, 3, 17),
(9, 'Unicorn\'s horn', 'Weapon', 2, 0, 0, 2, 8),
(10, 'Ankles of refraction', 'foot', 0, 4, 1, 3, 32),
(11, 'Leather armour', 'body', 0, 2, 0, 0, 22),
(12, 'wooden basket', 'head', 0, 0, 1, -1, 10),
(13, 'Alchemist\'s robe', 'body', 1, 2, 1, 5, 38),
(14, 'Vorpal sword', 'Weapon', 1, 0, 0, -1, 50),
(15, 'Cardboard box', 'head', 2, 1, 2, 3, 45),
(16, 'Bathroom slippers', 'foot', 0, 1, 0, -1, 50),
(17, 'Leather jacket', 'body', 1, 0, 0, 0, 55),
(18, 'Carnival mask', 'head', 2, 1, 1, 1, 75),
(19, 'Cucumber', 'Weapon', 0, 1, 0, 0, 48),
(20, 'Goblins vest', 'body', 0, -1, 1, 0, 69),
(21, 'Black galoshes', 'foot', 0, 3, 2, 1, 76),
(22, 'Roman chest plate', 'body', 0, 0, 0, -1, 89),
(23, 'Ceremonial cap', 'head', 1, 2, 2, 1, 110),
(24, 'Plastic fork', 'Weapon', 0, 4, 0, 5, 99),
(25, 'Clogs of stealth', 'foot', 0, 0, 2, 5, 56),
(26, 'Crystal diadem', 'head', 4, 0, 3, 0, 120),
(27, 'Druids cloak', 'body', 2, 0, 4, 6, 150),
(28, 'Spear of justice', 'weapon', 1, 1, 1, 4, 40),
(29, 'Cubic feet', 'foot', 4, 2, 3, 0, 116),
(30, 'Bone hat', 'head', 3, 1, 0, 2, 145),
(31, 'Dirty socks', 'foot', 2, 3, 2, 6, 155),
(32, 'Hunters coat', 'body', 0, 5, 2, 4, 170),
(33, 'Double eye patch', 'head', 0, 3, 3, -1, 139),
(34, 'Glass stuff', 'weapon', 2, 2, 0, -1, 170),
(35, 'Hunter\'s boots', 'foot', 3, 1, 4, 1, 176),
(36, 'Dirty sketchers', 'foot', 0, 4, 1, 2, 210),
(37, 'Underpants', 'head', 2, 0, 4, 1, 220),
(38, 'Magic wand', 'weapon', 0, 0, 2, 1, 230),
(39, 'Mithril coat', 'body', 0, 2, 6, 2, 240),
(40, 'Data mining headlamp', 'head', 1, 1, 7, 3, 275),
(41, 'Bone armour', 'body', 0, 5, 1, 0, 211),
(42, 'Dwarven iron mail', 'body', 1, 1, 1, 1, 265),
(43, 'Evil wings', 'body', 1, 1, 2, 4, 55),
(44, 'Toilet lid', 'head', 0, 0, 1, 4, 554),
(45, 'Plastic bag', 'head', 2, 2, 1, 2, 154),
(46, 'Beer bottle', 'weapon', 1, 0, 0, 6, 35),
(47, 'Wooden stick', 'weapon', 1, 0, 0, 5, 54),
(48, 'Quilted vest', 'body', 0, 2, 0, 2, 47),
(49, 'Fisherman\'s boots', 'foot', 0, 10, 0, 2, 59),
(50, 'Hellfire boots', 'foot', 1, 0, 0, 1, 84),
(51, 'Epic beard', 'head', 2, 0, 0, 5, 87),
(52, 'Bull\'s horn', 'weapon', 0, 2, 0, 4, 54),
(53, 'Kevlar battle socks', 'foot', 0, 0, 2, 4, 55),
(54, 'Tunic of hate', 'body', 3, 0, 0, 3, 53),
(55, 'Snow shoes', 'foot', 0, 3, 0, 2, 76),
(56, 'Fists of fury', 'weapon', 1, 0, 3, 1, 46),
(57, 'Lightspeed sneakers', 'foot', 1, 0, 0, 1, 85),
(58, 'Sharpened tooth brush', 'weapon', 1, 1, -4, 3, 88),
(59, 'One sliper', 'foot', 0, 0, 5, 0, 97),
(60, 'Ogre\'s toothpick', 'weapon', 1, 0, 0, 0, 65),
(61, 'Executioner\'s mask', 'head', 1, 0, 0, 3, 88),
(62, 'Old felt boots', 'foot', 1, 0, 0, 6, 84),
(63, 'Paper machete', 'weapon', 0, 2, 0, 6, 54),
(64, 'Old sandals', 'foot', 0, 2, 0, 1, 54),
(65, 'Piece maker', 'weapon', 0, 2, 0, 2, 58),
(66, 'Elfs chestguard', 'body', 1, 0, 0, 4, 64),
(67, 'Experience cap', 'head', 0, 0, 3, 3, 44),
(68, 'Skeletal armour', 'body', 0, 0, 3, 1, 98),
(69, 'Vest of barriers', 'body', 0, 3, 3, 3, 175),
(70, 'Pair of winged sandals', 'foot', 0, 1, 3, 4, 186),
(71, 'Peasant\'s best shoes', 'foot', 0, 3, 0, 2, 78),
(72, 'Pink slip', 'weapon', 0, 3, 0, 2, 78),
(73, 'Iron shoes', 'foot', 4, 0, 0, 6, 54),
(74, 'Pirate\'s hook', 'weapon', 2, 4, 0, 5, 100),
(75, 'Face paint', 'head', 0, 3, 5, -1, 174),
(76, 'Dead ork boots', 'foot', 1, 2, 3, 4, 165),
(77, 'Dragon silk', 'body', 2, 4, 0, 3, 245),
(78, 'Iron sword', 'weapon', 4, 3, 0, 5, 250),
(79, 'Random axe of kindness', 'weapon', 5, 4, 0, 2, 315),
(80, 'Wizards stuff', 'weapon', 6, 2, 0, 2, 300),
(81, 'Two handed axe', 'weapon', 5, 0, 5, 3, 287),
(82, 'Fancy monocle', 'head', 5, 2, 2, 2, 347),
(83, 'Chainboots', 'foot', 2, 5, 1, -1, 356),
(84, 'Frame of mind', 'head', 0, 7, 0, 3, 314),
(85, 'Garments of hell', 'body', 2, 4, 3, 3, 265),
(86, 'Flying boots', 'foot', 1, 4, 4, -1, 342),
(87, 'Little honesty stick', 'weapon', 6, 0, 0, 5, 358),
(88, 'Red crowbar', 'weapon', 6, 0, 1, -1, 360),
(89, 'Hard shoes', 'foot', 2, 6, 2, 0, 395),
(90, 'Gentleman\'s top hat', 'head', 3, 4, 2, -1, 315),
(91, 'Goggles of holy vision', 'head', 0, 3, 0, 4, 165),
(92, 'White wizard robe', 'body', 2, 3, 0, 6, 263),
(93, 'Halo of a fallen angel', 'head', 0, 0, 7, 0, 195),
(94, 'Tunic of justice', 'body', 0, 5, 1, -1, 174),
(95, 'Brick', 'weapon', 5, 2, 0, 2, 316),
(96, 'Woollen socks', 'foot', 0, 3, 0, 5, 115),
(97, 'Straw hat', 'head', 3, 2, 3, 0, 345),
(98, 'Leather boots', 'foot', 3, 4, 0, 6, 323),
(99, 'Helm of clear thoughts', 'head', 0, 7, 2, 4, 450),
(100, 'Voodoo armour', 'body', 1, 8, 1, -1, 420),
(101, 'Rusty crowbar', 'weapon', 8, 5, 3, 3, 460),
(102, 'Heavy dwarf boots', 'foot', 2, 1, 6, 5, 465),
(103, 'Blood knife', 'weapon', 5, 4, 2, 5, 500),
(104, 'Walking stick', 'weapon', 1, 1, 1, 4, 75),
(105, 'Self-cutting axe', 'weapon', 1, 0, 0, 5, 50),
(106, 'Sharp stick', 'weapon', 1, 0, 0, -1, 47),
(107, 'Sword of irony', 'weapon', 0, 0, 2, 5, 33),
(108, 'Helm of second thoughts', 'head', 0, 2, 0, 0, 27),
(109, 'Hockey mask', 'head', 0, 0, 1, 0, 27),
(110, 'Hood of insane monk', 'head', 1, 1, 0, 2, 30),
(111, 'Cardboard box', 'head', 1, 2, -3, 3, 23),
(112, 'Halloween mask', 'head', 0, 1, 0, 4, 24),
(113, 'Twilight\'s vest of auras', 'body', 0, 2, 0, -1, 26),
(114, 'Saint cloak', 'body', 0, 0, 3, 3, 34),
(115, 'Wrinkled orc shirt', 'body', 1, 1, 0, 5, 33),
(116, 'Goblins robe', 'body', 0, 2, 0, 1, 35),
(117, 'Elven high heels', 'foot', 1, 2, 0, 2, 44),
(118, 'Sandals of time', 'foot', 0, 0, 1, 0, 25),
(119, 'Skeleton\'s greaves', 'foot', 1, 1, 1, 2, 45),
(120, 'Sneakers of suspicion', 'foot', 0, 0, 3, 1, 77),
(121, 'Shiny sword', 'weapon', 2, 0, 0, 3, 37),
(122, 'Golf club', 'weapon', 1, 1, 0, 4, 50),
(123, 'Heavy dwarf iron plate', 'body', 0, 2, 1, 6, 55),
(124, 'Armour of frozen', 'body', 1, 3, 0, 3, 57),
(125, 'Boots of thunder', 'foot', 0, 2, 0, 5, 56),
(126, 'Swamp waders', 'foot', 0, 2, 1, 2, 66),
(127, 'Elegant elf armour', 'body', 1, 2, 1, 0, 34),
(128, 'Titan\'s boots', 'foot', 1, 1, 3, 0, 67),
(129, 'Nokia 3310', 'weapon', 2, 0, 0, 4, 66),
(130, 'Rusty pipe', 'weapon', 1, 0, 1, -1, 71),
(131, 'Wooden swamp protector', 'body', 0, 0, 2, 1, 32),
(132, 'Squirrel fur slipers ', 'foot', 1, 1, 1, 1, 33),
(133, 'Justice bone', 'weapon', 1, 2, -2, 1, 100),
(134, 'Stuff with dragon teeth', 'weapon', 4, -1, -2, 6, 115),
(135, 'Board with nail', 'weapon', -1, 1, 3, 2, 89),
(136, 'Cats poo in string', 'weapon', 3, -6, 1, 2, 94),
(137, 'Orkish axe', 'weapon', 3, 1, -3, 1, 125),
(138, 'Viking helmet', 'head', 0, 3, 2, 1, 150),
(139, 'Elf crown', 'head', 1, 1, 4, 4, 173),
(140, 'Crown of branches', 'head', -2, 2, 2, 1, 123),
(141, 'Folded metal bucket', 'head', -1, -1, 2, 6, 63),
(142, 'Eternal robes of mists', 'body', 2, 5, 2, 0, 167),
(143, 'Vest of faded powers', 'body', -1, 1, -4, 4, 43),
(144, 'Iron shirt', 'body', 0, 6, -1, 4, 173),
(145, 'Elf war mail', 'body', 0, 3, 0, 0, 99),
(146, 'Aladdin shoes', 'foot', 1, 1, 2, -1, 101),
(147, 'Leather boots with laces', 'foot', 1, 2, 2, 6, 125),
(148, 'Achilles heel', 'foot', 1, 2, 3, 5, 121),
(149, 'Waders of The Lost Ark', 'foot', 2, 3, 2, -1, 150),
(150, 'Corruption shoes', 'foot', 3, 3, 3, 5, 186),
(151, 'Boots of defence', 'foot', 2, -2, 3, 5, 134),
(152, 'Battle shovel', 'weapon', 3, 1, 3, 3, 159),
(153, 'Stinky sock', 'weapon', 6, -3, -3, 6, 200),
(154, 'Rotten apple', 'weapon', 2, 2, -4, 4, 148),
(155, 'Broken glass', 'weapon', 3, 4, -8, 5, 210),
(156, 'Halfplate', 'body', 0, 3, 0, 5, 144),
(157, 'Bronze chainmail', 'body', 2, 2, 3, 4, 181),
(158, 'Reaper robe', 'body', 1, 4, 0, 3, 87),
(159, 'Vampire armour', 'body', 1, 1, -2, 5, 116),
(160, 'Horns of a dilemma', 'head', -1, 2, 1, 0, 93),
(161, 'Humming beard', 'head', 1, 4, 3, 1, 165),
(162, 'Hazmat suit', 'head', 1, -1, 3, 5, 122),
(163, 'Sword of darkness', 'weapon', 3, 3, 3, 5, 200),
(164, 'Sword of light', 'weapon', 4, 4, 4, 1, 210),
(165, 'Dwarwen bread', 'weapon', 1, 5, 5, 1, 250),
(166, 'Beautiful coral', 'weapon', 6, -2, -2, 0, 201),
(167, 'Fairy\'s battle axe', 'weapon', 6, 2, -10, 2, 214),
(168, 'Ice pack', 'head', 2, 2, 2, 3, 222),
(169, 'Iron crown', 'head', 0, 0, -3, 5, 116),
(170, 'Bronze mask', 'head', -1, 4, -1, 5, 203),
(171, 'Mad scientist\'s goggles', 'head', 3, 3, 4, 5, 219),
(172, 'Wizard robe', 'body', 1, 6, 3, 3, 279),
(173, 'Angel wings', 'body', 4, 4, 6, 4, 300),
(174, 'Wizard Robe', 'body', 4, 7, -12, -1, 273),
(175, 'Stone slipers', 'foot', 6, -4, -4, 0, 288),
(176, 'Blacksmith doughters boots', 'foot', 4, 4, 4, 1, 266),
(177, 'Deadly sin boots', 'foot', 4, 2, -6, 0, 233),
(178, 'White slippers', 'foot', 2, 1, 4, -1, 247),
(179, 'Fork of truth', 'weapon', 4, 2, 1, 1, 301),
(180, 'Fallen Angel knife', 'weapon', 7, -5, 3, 0, 310),
(181, 'Half-brick in a sock', 'weapon', 5, 2, 1, 2, 330),
(182, 'Hobbit\'s hammer', 'weapon', 3, 3, 5, 3, 350),
(183, 'Mask of a rabbit', 'head', 3, 6, -3, 3, 315),
(184, 'Mirrored helmet', 'head', 3, 1, 4, 6, 345),
(185, 'Mirthful gas mask', 'head', 1, 4, 1, 1, 333),
(186, 'Orc leather armour', 'body', 3, 4, 5, 4, 376),
(187, 'Bone armour', 'body', -1, 4, -2, 3, 365),
(188, 'Firelord platemail', 'body', 2, 4, 6, 6, 399),
(189, 'Donator robe', 'body', -3, -1, -4, 1, 257),
(190, 'Moon walkers', 'foot', 2, 2, 3, 2, 340),
(191, 'Bare foot', 'foot', 2, 2, 3, -1, 361),
(192, 'Iron fist', 'weapon', 3, 3, 5, 2, 350),
(193, 'Icethrower', 'weapon', 6, 2, 4, 4, 333),
(194, 'Tears in the jar', 'weapon', 3, -4, 6, 4, 377),
(195, 'Wooden leg', 'weapon', 6, -2, -2, 6, 299),
(196, 'Grey hat', 'head', 1, 3, 3, 2, 215),
(197, 'Mithril gas mask', 'head', 4, 4, 4, 3, 362),
(198, 'Broken Angel crown', 'head', 2, 4, 2, 6, 343),
(199, 'Neon nimbus', 'head', 1, -3, 6, 2, 210),
(200, 'Bone dust armour', 'body', 3, 6, 6, 5, 400),
(201, 'Witch robe', 'body', 2, 5, 3, 0, 376),
(202, 'Monk robe', 'body', 5, 5, 5, -1, 399),
(203, 'Hard leather armour', 'body', 1, 7, 2, 2, 316),
(204, 'Yeti slippers', 'foot', 2, 2, 5, 5, 333),
(205, 'Widder-shins', 'foot', 4, 6, 8, 3, 421),
(206, 'Brown shoes', 'foot', 3, 5, -2, 2, 441),
(207, 'Light of Angels', 'foot', 6, 6, 6, 6, 464),
(208, 'Goblins army boots', 'foot', -2, -2, 4, 6, 299),
(209, 'Judgement hammer', 'weapon', 5, 6, 9, 4, 434),
(210, 'Knotty stick', 'weapon', 7, 7, 7, 1, 215),
(211, 'Mace of amnesia', 'weapon', 9, 3, 9, 5, 279),
(212, 'Mind blower', 'weapon', -1, 12, -2, -1, 371),
(213, 'Mourning star', 'weapon', 6, 7, 4, 5, 400),
(214, 'Nerd\'s glasses', 'head', 7, 3, 7, 4, 411),
(215, 'Odin\'s beard', 'head', 8, 8, 8, 5, 467),
(216, 'Pair of cool sunglasses', 'head', 4, 12, 5, 4, 217),
(217, 'Pair of monocles', 'head', 7, 8, 8, -1, 402),
(218, 'Silver-steel armour', 'body', 4, 3, 11, 6, 276),
(219, 'Heka robe', 'body', 9, 9, 1, 2, 372),
(220, 'Shaman robe', 'body', 6, 3, 10, 4, 354),
(221, 'Phoenix platemail', 'body', 5, 7, 6, 3, 417),
(222, 'Dragon eggshells', 'foot', 3, 9, -2, 6, 311),
(223, 'Rusty metal boots', 'foot', -3, -4, 4, 2, 202),
(224, 'Rubber highboots', 'foot', 6, 3, 9, -1, 333),
(225, 'Red shoes', 'foot', 6, 8, -4, 4, 444),
(226, 'Anti-goliath sling', 'weapon', 3, 3, 6, 0, 311),
(227, 'Automatic slingshot', 'weapon', 2, -6, 7, 4, 178),
(228, 'Acid rock', 'weapon', 4, 1, 6, 4, 222),
(229, 'Axe of evil', 'weapon', 3, 3, 3, 4, 111),
(230, 'Pirate\'s eye patch', 'head', 2, 1, 3, 0, 211),
(231, 'Polar ice cap', 'head', 4, -3, 4, 4, 239),
(232, 'Birds nest', 'head', 2, 4, 4, 6, 121),
(233, 'Folded newspaper', 'head', 4, 3, 3, 2, 187),
(234, 'Quasidevil\'s horns', 'head', 2, 2, 4, 1, 210),
(235, 'Druid robe', 'body', 6, 2, 6, 2, 211),
(236, 'Straw chest', 'body', 2, 3, 4, -1, 222),
(237, 'Worker Elf chestplate', 'body', 4, 1, 1, 3, 100),
(238, 'Villager jacket ', 'body', 3, -2, 1, 2, 98),
(239, 'Rangers\' high boots', 'foot', 2, 1, 5, 4, 157),
(240, 'Radioactive slippers', 'foot', 2, 3, 5, 2, 115),
(241, 'Pre-socked sandals', 'foot', 3, 2, 4, 0, 214),
(242, 'Psychotic brakes', 'foot', 7, 7, 7, 5, 350),
(243, 'Mighty war club', 'weapon', 6, 3, 4, -1, 186),
(244, 'Ram helmet', 'head', 3, 7, 1, 0, 248),
(245, 'Stalker\'s armour', 'body', 2, 2, 1, 1, 111),
(246, 'Tunic of voices', 'body', 2, 3, 3, 2, 155),
(247, 'Old orkish armour', 'body', 2, 1, 3, 4, 155),
(248, 'Kings shirt', 'body', 1, 3, 3, 5, 178),
(249, 'Plate-mail flip flops', 'foot', 2, 1, 3, 6, 210),
(250, 'Platformer shoes', 'foot', 2, 4, 1, 6, 213),
(251, 'Plumsoles', 'foot', 2, 2, 3, 6, 234),
(252, 'Pixie\'s shoes', 'foot', 3, 3, 4, -1, 276),
(253, 'Banana gun', 'weapon', 3, 0, 1, 2, 276),
(254, 'Rosted chicken leg', 'weapon', 3, 3, 4, 0, 300),
(255, 'Stone dagger', 'weapon', 4, -1, -2, 3, 169),
(256, 'Table knife', 'weapon', 6, 2, 3, -1, 347),
(257, 'Two-handled chopper', 'weapon', 2, 3, 2, 4, 210),
(258, 'Anti-mosquito hat', 'head', 2, 3, 1, 5, 200),
(259, 'Breathing mask', 'head', 3, 4, 1, 3, 144),
(260, 'Chain helmet', 'head', 2, 2, 4, 3, 314),
(261, 'Dragon hornes', 'head', 4, 4, 4, 0, 362),
(262, 'Angel crown', 'head', 2, 3, 6, 3, 315),
(263, 'Arrowproof vest', 'body', 2, 6, 1, 0, 347),
(264, 'Black light armour', 'body', 3, 3, 2, 4, 202),
(265, 'Silk cowl', 'body', 3, -2, 2, 0, 142),
(266, 'Athlete\'s feet', 'foot', 3, 2, 2, 3, 203),
(267, 'Red brick with tape', 'foot', 2, 3, 1, 1, 205),
(268, 'Atomic high boots', 'foot', 2, 4, 1, 4, 301),
(269, 'Chainmail', 'body', 3, 3, 3, 1, 312),
(270, 'Wizards grey robe', 'body', 1, 2, 3, 2, 371),
(271, 'Basilisk\'s foot', 'foot', 3, 2, 4, 1, 309),
(272, 'Boots of all evil', 'foot', 1, 3, 2, 4, 341),
(273, 'Scythe of righteousness', 'weapon', 4, 4, 4, 0, 213),
(274, 'Sock with soap inside', 'weapon', -3, 2, 4, 0, 300),
(275, 'Piece of firewood', 'weapon', 2, 1, 3, 2, 316),
(276, 'Iron cup', 'weapon', 3, 2, 3, 6, 129),
(277, 'Lucky slipper', 'weapon', 3, -4, 2, 2, 217),
(278, 'Rolled up newspaper', 'weapon', 2, 1, 3, -1, 311),
(279, 'Gummy Stab', 'weapon', 3, 4, 2, 4, 356),
(280, 'Crown molding', 'head', 3, -5, 2, 6, 271),
(281, 'Crypto-mining helmet', 'head', 3, 1, 3, 0, 217),
(282, 'Dark matter hat', 'head', 4, 2, 4, 0, 388),
(283, 'Deja view glasses', 'head', 4, 1, 5, 1, 344),
(284, 'Donkey head mask', 'head', 3, 4, 2, -1, 199),
(285, 'Shiny knight wings', 'head', 2, 3, 3, 5, 327),
(286, 'Fairie Armor', 'body', 2, -2, 4, 2, 351),
(287, 'Iron chainmail', 'body', 4, 4, 4, 0, 350),
(288, 'Breastplate', 'body', 3, 3, 2, 6, 312),
(289, 'Rangers shroud', 'body', 3, 4, 2, 4, 312),
(290, 'Scouts mail', 'body', 3, 4, 2, 6, 378),
(291, 'Scale mail', 'body', 3, 3, 3, 4, 400),
(292, 'Hauberk of luck', 'body', 3, 4, 3, 3, 405),
(293, 'Elven jackboots', 'foot', 4, 3, 4, 1, 415),
(294, 'Electric heel', 'foot', 5, -5, 10, -1, 461),
(295, 'Feet of strength', 'foot', 6, 6, 7, 0, 451),
(296, 'Kings club', 'weapon', 3, 3, 4, -1, 217),
(297, 'Steel sledgehammer', 'weapon', 5, 2, 6, -1, 300),
(298, 'Dung fork', 'weapon', 7, 3, 5, 0, 367),
(299, 'Samurai sword', 'weapon', 3, 4, 2, -1, 344),
(300, 'Voodoo mask', 'head', 5, 6, 9, 6, 431),
(301, 'Battle mage mask', 'head', 5, -6, 12, 1, 477),
(302, 'Veil of justice', 'head', 4, 4, 5, 2, 451),
(303, 'Iron mask', 'head', 3, 6, 3, 6, 399),
(304, 'Mouth guard', 'head', -5, 4, 7, 4, 310),
(305, 'Empty pumpkin', 'head', 3, 4, 2, 1, 215),
(306, 'Cursed garments', 'body', 4, 6, 3, 1, 366),
(307, 'Defiler of blood', 'body', 3, 6, 3, 3, 345),
(308, 'Silk raiment', 'body', 4, 4, 3, 1, 455),
(309, 'High socks of luck', 'foot', 3, 4, 3, 2, 320),
(310, 'Army boots', 'foot', 4, 3, 4, 4, 387),
(311, 'Troll nails', 'foot', 4, 3, 8, 4, 481),
(312, 'Old slipers', 'foot', 2, 2, 2, 4, 282),
(313, 'Nuclear-powered boots', 'foot', 5, -2, -3, 1, 210);

-- --------------------------------------------------------

--
-- Table structure for table `equipment_inventory`
--

CREATE TABLE `equipment_inventory` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `Head` int(11) DEFAULT NULL,
  `Body` int(11) DEFAULT NULL,
  `Foot` int(11) DEFAULT NULL,
  `weapon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment_inventory`
--

INSERT INTO `equipment_inventory` (`id`, `userID`, `Head`, `Body`, `Foot`, `weapon`) VALUES
(53, 114, 110, 17, 55, 257),
(54, 115, 5, 158, 21, 28),
(55, 116, 108, 131, 16, 167),
(56, 117, 304, 238, 3, 38),
(57, 118, 51, 246, 21, 179),
(58, 119, 305, 237, 3, 137),
(59, 120, 12, 66, 239, 14),
(60, 121, 1, 6, 125, 133),
(61, 122, 110, 113, 8, 4),
(62, 123, 171, 127, 117, 129),
(63, 124, 198, 114, 70, 228),
(64, 125, 110, 6, 53, 72),
(65, 126, 196, 48, 120, 181),
(66, 127, 197, 113, 53, 105),
(67, 135, NULL, NULL, NULL, NULL),
(68, 136, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `InventoryID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Item1` int(11) DEFAULT NULL,
  `Item2` int(11) DEFAULT NULL,
  `Item3` int(11) DEFAULT NULL,
  `Item4` int(11) DEFAULT NULL,
  `Item5` int(11) DEFAULT NULL,
  `Item6` int(11) DEFAULT NULL,
  `Item7` int(11) DEFAULT NULL,
  `Item8` int(11) DEFAULT NULL,
  `Item9` int(11) DEFAULT NULL,
  `Item10` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`InventoryID`, `UserID`, `Item1`, `Item2`, `Item3`, `Item4`, `Item5`, `Item6`, `Item7`, `Item8`, `Item9`, `Item10`) VALUES
(15, 120, 21, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 119, 24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 118, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 114, 35, 6, 19, 23, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 116, 25, 3, 3, 30, 14, 5, 13, 10, 17, 7),
(12, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 121, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 122, 2, 23, 27, 20, 24, NULL, NULL, NULL, NULL, NULL),
(18, 123, 18, 19, 15, 34, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 124, 18, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 125, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 126, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 127, 5, 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ItemID` int(11) NOT NULL,
  `ItemName` varchar(255) NOT NULL,
  `GoldValue` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ItemID`, `ItemName`, `GoldValue`) VALUES
(1, 'Tomato', 3),
(2, 'Carrot', 2),
(3, 'Banana', 4),
(4, 'Pillow', 10),
(5, 'Sock', 1),
(6, 'Spoon', 5),
(7, 'Cupcake', 8),
(8, 'Cookie', 6),
(9, 'Button', 2),
(10, 'Feather', 3),
(11, 'Pebble', 1),
(12, 'Crayon', 4),
(13, 'Ribbon', 3),
(14, 'Jellybean', 2),
(15, 'Pancake', 7),
(16, 'Marshmallow', 2),
(17, 'Pinecone', 1),
(18, 'Popcorn', 3),
(19, 'Bubble', 1),
(20, 'Pencil', 5),
(21, 'Old fish', 3),
(22, 'Raspberry', 5),
(23, 'Caws bell', 10),
(24, 'Old mans finger', 15),
(25, 'Letter', 4),
(26, 'Newspaper', 11),
(27, 'Silver coin', 20),
(28, 'One shoe', 5),
(29, 'Chicken egg', 8),
(30, 'Oak tree leaf', 2),
(31, 'Book', 10),
(32, 'Wizards stick', 17),
(33, 'Brown winter hat', 9),
(34, 'Elfs teeth', 11),
(35, 'Dragon drop', 12);

-- --------------------------------------------------------

--
-- Table structure for table `level_exp`
--

CREATE TABLE `level_exp` (
  `level_id` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `minexp` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `level_exp`
--

INSERT INTO `level_exp` (`level_id`, `level`, `minexp`) VALUES
(1, 1, 1),
(2, 2, 20),
(3, 3, 30),
(4, 4, 40),
(5, 5, 50),
(6, 6, 60),
(7, 7, 70),
(8, 8, 80),
(9, 9, 90),
(10, 10, 100),
(11, 11, 110),
(12, 12, 120),
(13, 13, 130),
(14, 14, 140),
(15, 15, 150),
(16, 16, 160),
(17, 17, 170),
(18, 18, 180),
(19, 19, 190),
(20, 20, 200),
(21, 21, 210),
(22, 22, 220),
(23, 23, 230),
(24, 24, 240),
(25, 25, 250),
(26, 26, 260),
(27, 27, 270),
(28, 28, 280),
(29, 29, 290),
(30, 30, 300),
(31, 31, 310),
(32, 32, 320),
(33, 33, 330),
(34, 34, 340),
(35, 35, 350),
(36, 36, 360),
(37, 37, 370),
(38, 38, 380),
(39, 39, 390),
(40, 40, 400),
(41, 41, 410),
(42, 42, 420),
(43, 43, 430),
(44, 44, 440),
(45, 45, 450),
(46, 46, 460),
(47, 47, 470),
(48, 48, 480),
(49, 49, 490),
(50, 50, 500),
(51, 51, 510),
(52, 52, 520),
(53, 53, 530),
(54, 54, 540),
(55, 55, 550),
(56, 56, 560),
(57, 57, 570),
(58, 58, 580),
(59, 59, 590),
(60, 60, 600),
(61, 61, 610),
(62, 62, 620),
(63, 63, 630),
(64, 64, 640),
(65, 65, 650),
(66, 66, 660),
(67, 67, 670),
(68, 68, 680),
(69, 69, 690),
(70, 70, 700),
(71, 71, 710),
(72, 72, 720),
(73, 73, 730),
(74, 74, 740),
(75, 75, 750),
(76, 76, 760),
(77, 77, 770),
(78, 78, 780),
(79, 79, 790),
(80, 80, 800),
(81, 81, 810),
(82, 82, 820),
(83, 83, 830),
(84, 84, 840),
(85, 85, 850),
(86, 86, 860),
(87, 87, 870),
(88, 88, 880),
(89, 89, 890),
(90, 90, 900),
(91, 91, 910),
(92, 92, 920),
(93, 93, 930),
(94, 94, 940),
(95, 95, 950),
(96, 96, 960),
(97, 97, 970),
(98, 98, 980);

-- --------------------------------------------------------

--
-- Table structure for table `map`
--

CREATE TABLE `map` (
  `map_no` int(11) NOT NULL,
  `place` text NOT NULL,
  `ShopPresence` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `map`
--

INSERT INTO `map` (`map_no`, `place`, `ShopPresence`) VALUES
(1, 'The edge of the cliff', 1),
(2, 'Dwarven mines', 1),
(3, 'Dark woods', 0),
(4, 'City of Dwarves', 1),
(5, 'Goblins nest', 1),
(6, 'Nowhere', 1),
(7, 'Magic park', 0),
(8, 'Mushroom city', 0),
(9, 'Orc village', 1),
(10, 'The forgotten lake', 0),
(11, 'Old town', 0),
(12, 'Watchtower', 1),
(13, 'Elven tree', 0),
(14, 'Witch swamp', 0),
(15, 'Magic city', 0),
(16, 'Tavern of strong', 0),
(17, 'Edge of Eagle cliff', 1);

-- --------------------------------------------------------

--
-- Table structure for table `monsters`
--

CREATE TABLE `monsters` (
  `Monster_ID` int(11) NOT NULL,
  `Name` text NOT NULL,
  `Attack` int(11) NOT NULL,
  `Defence` int(11) NOT NULL,
  `Luck` int(11) NOT NULL,
  `HP` int(11) NOT NULL,
  `gold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `monsters`
--

INSERT INTO `monsters` (`Monster_ID`, `Name`, `Attack`, `Defence`, `Luck`, `HP`, `gold`) VALUES
(1, 'Old Goblin', 5, 5, 2, 5, 70),
(2, 'Ancient Demon', 10, 5, 3, 12, 100),
(3, 'Arctic Firebird', 5, 4, 3, 6, 50),
(4, 'Ark Enemy', 15, 3, 4, 5, 80),
(5, 'Artsy Fox', 10, 9, 3, 10, 30),
(6, 'Bad Hobbit', 10, 5, 3, 25, 50),
(7, 'Bagstabber', 6, 6, 3, 30, 45),
(8, 'Little Fairy', 4, 15, 6, 25, 90),
(9, 'Bald Eagle', 9, 6, 3, 27, 75),
(10, 'Chupacabra', 9, 15, 4, 40, 65),
(11, 'Soul Collector', 6, 9, 15, 32, 32),
(12, 'Angel of Death', 12, 8, 2, 125, 41),
(13, 'White mouse', 3, 5, 1, 39, 100),
(14, 'Arabic Knight', 5, 2, 5, 45, 35),
(15, 'Little Dog', 5, 7, 3, 11, 30),
(16, 'Skeleton Knight', 1, 4, 3, 22, 45),
(17, 'Unknown Warrior', 14, 9, 6, 60, 50),
(18, 'Dirt Devil', 9, 4, 6, 42, 73),
(19, 'Evil Minion', 9, 1, 2, 10, 43),
(20, 'False God', 6, 6, 8, 7, 89),
(21, 'Fallen Angel', 10, 12, 10, 125, 150),
(22, 'Fangless Vampire', 22, 6, 4, 34, 100),
(23, 'Ice Hydra', 8, 4, 8, 50, 67),
(24, 'Hysteric Cleric', 16, 9, 10, 30, 125),
(25, 'Illuminaughty Agent', 5, 7, 8, 25, 34),
(26, 'Killer Rabbit', 7, 7, 7, 0, 56),
(27, 'Angry Dwarf', 3, 6, 10, 0, 77),
(28, 'Milestone Golem', 6, 10, 5, 0, 23),
(29, 'Old Town Rogue', 11, 11, 3, 0, 89),
(30, 'Orc Bishop', 7, 7, 14, 0, 100),
(31, 'Elf Bowman', 12, 12, 10, 0, 133),
(32, 'Evil Man', 9, 9, 9, 0, 109),
(33, 'Black Death', 8, 7, 10, 0, 117),
(34, 'Rat Swarm', 8, 15, 4, 0, 150),
(35, 'Poltergeist', 12, 6, 11, 0, 92),
(36, 'Pumpkinhead', 3, 3, 15, 0, 71),
(37, 'Giant Cyclope', 6, 1, 2, 0, 32),
(38, 'Goblin Shaman', 15, 1, 1, 0, 44),
(39, 'Sea Troll', 8, 3, 4, 0, 45),
(40, 'Soul Eater', 7, 7, 8, 0, 76),
(41, 'Castle Guard', 6, 5, 6, 0, 77),
(42, 'Farmer', 5, 7, 5, 0, 51),
(43, 'Villager', 6, 11, 12, 35, 7),
(44, 'Cave worm', 15, 15, 15, 40, 20),
(45, 'Vampire bat', 4, 10, 5, 100, 40),
(46, 'Giant fly', 12, 25, 5, 65, 35),
(47, 'Holey Ghost', 3, 25, 20, 47, 33),
(48, 'Centaure', 10, 10, 30, 50, 17),
(49, 'Metal Slug', 17, 28, 10, 77, 45),
(50, 'One Armed Bandit', 15, 45, 40, 120, 70),
(51, 'Green Hydra', 25, 20, 40, 50, 65);

-- --------------------------------------------------------

--
-- Table structure for table `monsters_quotes`
--

CREATE TABLE `monsters_quotes` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `monsters_quotes`
--

INSERT INTO `monsters_quotes` (`id`, `text`) VALUES
(1, 'You get hit!'),
(2, 'Start losing patience.'),
(3, 'Hard hit on back.'),
(4, 'Opponent kick your ass.'),
(5, 'Get pushed from back.'),
(6, 'Massive strike in your chest.'),
(7, 'Get hit in ribs.'),
(8, 'You get demoralised.'),
(9, 'Club swings in your face.'),
(10, 'You get bitten in arm.'),
(11, 'Opponent boosting himself with war scream.'),
(12, 'Hair pull.');

-- --------------------------------------------------------

--
-- Table structure for table `quests`
--

CREATE TABLE `quests` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quests`
--

INSERT INTO `quests` (`id`, `text`) VALUES
(1, 'Accurately predict doomsday'),
(2, 'Annoy the graveyard keeper.'),
(3, 'Answer nature\'s call'),
(4, 'Back up the diary to a storm cloud'),
(5, 'Babysit a stellar nursery'),
(6, 'Calculate the interest rate on borrowed time'),
(7, 'Capture the flag'),
(8, 'Dance with the devil in the pale moonlight'),
(9, 'Clean up the mess made during the previous quest'),
(10, 'Deliver some sour gnomish beer to the dark elves'),
(11, 'Exercise the right to be lazy'),
(12, 'Exorcise a ghost writer'),
(13, 'Find a reason to finish this quest'),
(14, 'Get a dead man to tell a tale'),
(15, 'Get a stable job working with horses.'),
(16, 'Help a villager find her sheep'),
(17, 'Ignore sight, sound and smell, and navigate solely by taste'),
(18, 'Join in fellowship with some ringleaders.'),
(19, 'Kill a dragon barehanded'),
(20, 'Kill two birds with one stone'),
(21, 'Laugh in the face of danger until it cries.'),
(22, 'Learn some magic from the wizards of the coast.'),
(23, 'Make a myth a legend'),
(24, 'Force a time to wait'),
(25, 'Defend your loot from attackers.'),
(26, 'Pick up chicken broth from market'),
(27, 'Raise a family of dust bunnies'),
(28, 'Raid a ghost town.'),
(29, 'Take a day off.'),
(30, 'Rescue goblins dog.'),
(31, 'Learn some magic.');

-- --------------------------------------------------------

--
-- Table structure for table `side_quests`
--

CREATE TABLE `side_quests` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `side_quests`
--

INSERT INTO `side_quests` (`id`, `text`) VALUES
(1, 'Nikni lūrēt visiem virsū!'),
(2, 'Izņemt naudu no bankomāta'),
(3, 'Izcīnīt gultas vietu.'),
(4, 'Atrast kur patrenēties.'),
(5, 'Uzvārīt olas tejkanā.'),
(6, 'Aptīrīt omiti.'),
(7, 'Aiziet uz pastu.'),
(8, 'Nosargāt māju no uzbrucējiem.'),
(9, 'Ielavīties atpakaļ vecajā mājā.'),
(10, 'Nospert naudu.'),
(11, 'Pagulēt blakus vecenei.'),
(12, 'Izkasīt apenes ar kredītkarti.'),
(13, 'Paprasīt resnajai vai viņa rij pārāk daudz burgerus.'),
(14, 'Nolikt kluci.'),
(15, 'Izveidot Golēmu'),
(16, 'Pasūtīt Troli dirst'),
(17, 'Paēst zemenes kaimiņa dārzā'),
(18, 'Nozagt gurķi'),
(19, 'Atrast jaunu čomu'),
(20, 'Nomazgāties dīķī'),
(21, 'Piegādāt cepumus.'),
(22, 'Iztriept 10 aliņus'),
(23, 'Iegūt ūdeni no akas.'),
(24, 'Izsist naudu no ubaga.'),
(25, 'Pālī izplurkstēt noslēpumu.'),
(26, 'Saliet rievā eļļū.'),
(27, 'Novilkt velvienu dienu.'),
(28, 'Pieradināt goblinu ēst no rokas.'),
(29, 'Padirsties ar Orkiem.'),
(30, 'Uzprasīties uz problēmām.'),
(31, 'Iemācīties vicināties ar nūju.');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type` varchar(11) NOT NULL,
  `gold` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `description`, `type`, `gold`) VALUES
(1, 'Acid tears', 'Crying makes you stronger.', 'attack', 20),
(2, 'Frost bite', 'You look pretty disgusting.', 'defence', 10),
(3, 'Bloody itch', 'Mmmmm, this is a nasty one. This is one of the worst.', 'attack', 15),
(4, 'Mosquito roar', 'You taunt yourself up.', 'defence', 40),
(5, 'Dove of peace', 'The dove of peace is a misunderstood skill and is often taken for granted', 'luck', 11),
(6, 'Sober view', 'You finally stopped drinking and get hp.', 'hp', 16),
(7, 'Evil eye', 'You have protection against magic.', 'hp', 26),
(8, 'Dragon pout', 'The Dragon Pout is a skill in which the hero first takes a particularly uncouth strike to his lower abdomen', 'attack', 25),
(9, 'Explosive character', 'You feel sick after Orks village', 'attack', 23),
(10, 'Palm of the panda', 'You have strong willpower and extra fat.', 'defence', 23),
(11, 'Fake smile', 'The Fake smile skill is one of many heroes will attempt to use while visiting the various shops', 'attack', 34),
(12, 'Bad breath', 'Most likely you gonna get what you want fast.', 'luck', 26),
(13, 'Exhaust of the dragon', 'Luck of Dragon', 'luck', 27),
(14, 'Elbow bite', 'Just do it.', 'hp', 34),
(15, 'Chakra bending', 'You want extra benefits in trading.', 'trade', 31),
(16, 'Cash whistle', 'Whistle and get gold.', 'trade', 31),
(17, 'Brainstorm', 'Maybe you will be lucky.', 'trade', 20),
(18, 'Flying bird', 'You trading tactics', 'trade', 19),
(19, 'Full throttle', 'Excuse me?', 'trade', 16),
(20, 'Cry of horror', 'You need a nice scream in forest', 'hp', 14),
(21, 'Powerful sneeze', 'You are pretty safe around.', 'defence', 13),
(22, 'Dwarfs charm', 'You have a extra hair.', 'luck', 10);

-- --------------------------------------------------------

--
-- Table structure for table `skill_inventory`
--

CREATE TABLE `skill_inventory` (
  `id` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `Skill1ID` int(11) DEFAULT NULL,
  `Skill1Level` int(11) DEFAULT NULL,
  `Skill2ID` int(11) DEFAULT NULL,
  `Skill2Level` int(11) DEFAULT NULL,
  `Skill3ID` int(11) DEFAULT NULL,
  `Skill3Level` int(11) DEFAULT NULL,
  `Skill4ID` int(11) DEFAULT NULL,
  `Skill4Level` int(11) DEFAULT NULL,
  `Skill5ID` int(11) DEFAULT NULL,
  `Skill5Level` int(11) DEFAULT NULL,
  `Skill6ID` int(11) DEFAULT NULL,
  `Skill6Level` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill_inventory`
--

INSERT INTO `skill_inventory` (`id`, `userID`, `Skill1ID`, `Skill1Level`, `Skill2ID`, `Skill2Level`, `Skill3ID`, `Skill3Level`, `Skill4ID`, `Skill4Level`, `Skill5ID`, `Skill5Level`, `Skill6ID`, `Skill6Level`) VALUES
(48, 120, 20, 2, 1, 1, 22, 1, 3, 1, 19, 1, 2, 1),
(47, 119, 6, 1, 22, 1, 9, 1, 21, 2, 12, 1, 18, 1),
(46, 118, 16, 2, 9, 2, 21, 1, 18, 1, 22, 1, 2, 1),
(42, 114, 2, 1, 4, 2, 10, 1, 1, 1, 21, 1, 18, 1),
(43, 115, 12, 1, 22, 1, 13, 1, 14, 1, 17, 2, 3, 1),
(44, 116, 13, 1, 10, 1, 15, 1, 20, 3, 19, 2, 21, 1),
(45, 117, 17, 1, 1, 1, 19, 1, 7, 1, 22, 2, 13, 1),
(49, 121, 13, 1, 2, 3, 5, 1, 15, 1, 6, 1, 10, 2),
(50, 122, 1, 2, 4, 2, 15, 1, 3, 3, 2, 1, 13, 1),
(51, 123, 14, 1, 6, 2, 4, 1, 22, 1, 17, 1, 13, 1),
(52, 124, 8, 2, 17, 1, 21, 1, 7, 1, 6, 1, 2, 1),
(53, 125, 20, 1, 17, 1, 10, 1, 8, 1, 13, 1, 6, 1),
(54, 126, 5, 1, 6, 2, 17, 1, 4, 1, 11, 1, 18, 1),
(55, 127, 12, 1, 22, 1, 6, 1, 14, 1, 3, 1, 17, 1),
(56, 135, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `created_at` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `exp_n` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `attack` int(11) NOT NULL,
  `defence` int(11) NOT NULL,
  `luck` int(11) NOT NULL,
  `hp` int(11) NOT NULL,
  `c_hp` int(11) NOT NULL,
  `user_location` int(11) NOT NULL,
  `monster` int(11) NOT NULL DEFAULT -1,
  `quote_id` varchar(5) NOT NULL,
  `quest` int(11) NOT NULL DEFAULT 0,
  `side_q` int(11) NOT NULL DEFAULT 0,
  `win` int(11) NOT NULL,
  `lose` int(11) NOT NULL,
  `motto` varchar(25) NOT NULL DEFAULT '...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `email`, `created_at`, `gold`, `exp`, `exp_n`, `level`, `attack`, `defence`, `luck`, `hp`, `c_hp`, `user_location`, `monster`, `quote_id`, `quest`, `side_q`, `win`, `lose`, `motto`) VALUES
(114, 'Rebecca6', 'Isaac0211', 'reneebabbitts@gmail.com', 1698837768, 124, 5852, 990, 98, 61, 71, 36, 73, 73, 10, -1, 'U:5', 14, 0, 266, 5, '...'),
(115, 'The Brain', 'MVAgustaF4RR', '19blgt68@gmail.com', 1698869839, 274, 5853, 990, 98, 85, 71, 70, 70, 71, 2, -1, 'U:9', 4, 0, 271, 9, 'Go for it!'),
(116, 'Victoria Lim', 'AmazinGg2023*', 'victoriakimlim230302@gmail.com', 1699622026, 29, 5851, 990, 98, 55, 33, 44, 71, 71, 7, -1, 'U:9', 23, 0, 219, 8, '...'),
(117, 'Grimza16', 'Arturs27025809', 'paulis922@inbox.lv', 1700318807, 83, 5854, 990, 98, 43, 42, 53, 56, 63, 4, -1, 'U:6', 11, 0, 219, 7, '...'),
(118, 'EdgarsPo', 'Vista11!', 'r@r.lv', 1700489202, 706, 5852, 990, 98, 44, 41, 53, 55, 55, 5, -1, 'U:13', 26, 2, 187, 6, 'Palestine :)'),
(119, 'Amanda', 'Amandaj_777', 'tavaamanda2005@gmail.com', 1700506300, 133, 5853, 990, 98, 46, 38, 45, 47, 53, 1, -1, 'U:10', 13, 0, 205, 8, '...'),
(120, 'Switch777', 'as123123', 'Switch777@inbox.lv', 1700563597, 140, 5853, 990, 98, 43, 44, 34, 67, 71, 8, -1, 'U:2', 17, 0, 181, 4, '...'),
(121, 'Danpower ', 'betlemesmaja1', 'ddrigots@gmail.com', 1701022673, 242, 5851, 990, 98, 37, 39, 44, 44, 44, 6, -1, 'U:11', 10, 0, 155, 9, 'degunu augšā'),
(122, 'Dzh1nkss', 'Klawsuniewa33', 'darzux@inbox.lv', 1701026608, 235, 5851, 990, 98, 45, 34, 33, 54, 54, 3, -1, 'U:11', 15, 0, 162, 8, 'You only live once'),
(123, 'blaaam', 'passwords', 'demo@demo.lv', 1701113673, 29, 5853, 990, 98, 31, 36, 28, 65, 65, 13, -1, 'U:7', 18, 0, 148, 7, 'YOLO'),
(124, 'Miley Ray Montana', 'Minkavello120?', 'emma.beerze@gmail.com', 1701352274, 522, 5851, 990, 98, 34, 38, 42, 55, 55, 15, -1, 'U:12', 21, 0, 133, 7, '...'),
(125, 'sazzad123', 'sazzad123', 'sazzadmannan16@gmail.com', 1701519114, 168, 5852, 990, 98, 26, 27, 22, 60, 60, 17, -1, 'U:9', 19, 0, 90, 5, '...'),
(126, 'nezale11', 'Nazis123', 'nezale11@gmail.com', 1701553218, 388, 5852, 990, 98, 29, 24, 46, 53, 54, 9, -1, 'U:3', 6, 0, 107, 1, 'Dzīvo un plīvo'),
(127, 'rai_jalpa', 'rai_is101112', 'sumeetrai901@gmail.com', 1701594542, 96, 5854, 990, 98, 29, 38, 41, 44, 44, 14, -1, 'U:4', 8, 0, 91, 2, '...'),
(135, 'gregs', 'Kola11', 'vccv@gfgf.com', 1714771295, 100, 10, 20, 1, 6, 4, 6, 15, 15, 12, -1, '', 0, 0, 0, 0, '...'),
(136, 'Parbaude', 'Kola11', 'vccv@gfgf.com', 1714771475, 100, 10, 20, 1, 4, 5, 5, 15, 15, 5, -1, '', 0, 0, 0, 0, '...');

-- --------------------------------------------------------

--
-- Table structure for table `users_quotes`
--

CREATE TABLE `users_quotes` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_quotes`
--

INSERT INTO `users_quotes` (`id`, `text`) VALUES
(1, 'You try to hit hard.'),
(2, 'Defend yourself.'),
(3, 'A battle cry for a surge of power.'),
(4, 'Low kick.'),
(5, 'Sneaky hit in balls.'),
(6, 'Blowing sand in face.'),
(7, 'Stun your opponent with elbow.'),
(8, 'You try to run and fall over.'),
(9, 'Massive big swing.'),
(10, 'You hug your opponent.'),
(11, 'Use your tactical skills.'),
(12, 'Jump and kick.'),
(13, 'Use your eagle stance.'),
(14, 'Buff yourself with roar.'),
(15, 'Magical punch.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `diary`
--
ALTER TABLE `diary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `diaryinventory`
--
ALTER TABLE `diaryinventory`
  ADD PRIMARY KEY (`diaryinventoryID`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_inventory`
--
ALTER TABLE `equipment_inventory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`InventoryID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `level_exp`
--
ALTER TABLE `level_exp`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`map_no`);

--
-- Indexes for table `monsters`
--
ALTER TABLE `monsters`
  ADD PRIMARY KEY (`Monster_ID`);

--
-- Indexes for table `monsters_quotes`
--
ALTER TABLE `monsters_quotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `side_quests`
--
ALTER TABLE `side_quests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `skill_inventory`
--
ALTER TABLE `skill_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users_quotes`
--
ALTER TABLE `users_quotes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diary`
--
ALTER TABLE `diary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `diaryinventory`
--
ALTER TABLE `diaryinventory`
  MODIFY `diaryinventoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `equipment_inventory`
--
ALTER TABLE `equipment_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `InventoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `level_exp`
--
ALTER TABLE `level_exp`
  MODIFY `level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `quests`
--
ALTER TABLE `quests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `side_quests`
--
ALTER TABLE `side_quests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `skill_inventory`
--
ALTER TABLE `skill_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT for table `users_quotes`
--
ALTER TABLE `users_quotes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
