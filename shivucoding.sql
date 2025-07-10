-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2025 at 09:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shivucoding`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `Sno` int(50) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`Sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '+915848484555', 'first post', '2025-05-30 15:38:40', 'firstpost@gmail.com'),
(2, 'MyName', '6585414152', 'It is OK!', NULL, 'myname@gmail.com'),
(3, 'MyName', '6585414152', 'It is OK!', '2025-05-30 16:26:44', 'myname@gmail.com'),
(4, 'MyName', '6585414152', 'It is OK!', '2025-05-31 09:11:37', 'myname@gmail.com'),
(6, 'OMshri', '+918888888888', 'TI\'s OK', '2025-05-31 10:28:33', 'OM@gmail.com'),
(18, 'Shivshankar', '7777777777', '', '2025-06-02 21:39:59', 'Shivhsnkar@gmail.com'),
(19, 'Shivshankar', '7777777777', '', '2025-06-02 21:41:56', 'Shivhsnkar@gmail.com'),
(20, 'Shivshankar', '7777777777', '', '2025-06-02 21:45:56', 'Shivhsnkar@gmail.com'),
(21, 'MYNameslakhan', '8888888888', 'Hi my name\'s lakhan you are blogs best', '2025-06-04 11:55:28', 'lakhan@gmail.com'),
(22, 'MYNameslakhan', '8888888888', 'Hi my name\'s lakhan you are blogs best', '2025-06-04 11:59:33', 'lakhan@gmail.com'),
(23, 'MYNameslakhan', '8888888888', 'Hi my name\'s lakhan you are blogs best', '2025-06-04 12:01:06', 'lakhan@gmail.com'),
(24, 'name', '25648112355', 'hi', '2025-06-04 12:09:48', 'name@gmail.com'),
(25, 'name', '25648112355', 'hi', '2025-06-04 12:10:00', 'name@gmail.com'),
(26, 'harryblog', '2548457850', 'hi hello to get', '2025-06-04 12:17:48', 'harry@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Green Geometry of the Hills', 'Where nature meets symmetry on tea-scented slopes', 'green-geometry-tea-hills', 'From a distance, the hill looks like it\'s been handwoven — a perfect quilt of green, stitched together by time, rain, and human care. These are tea gardens, sculpted into patterns so precise they seem unnatural, yet somehow they blend seamlessly with the wild. Tall sentinel trees rise gently above the cropped bushes, catching wind that smells of earth and leaf. This landscape speaks of quiet labor, early misty mornings, and the eternal rhythm between man and nature. On such slopes, the ordinary becomes poetic — and the hillside hums with a green heartbeat.', 'post1.img', '2025-06-02 23:52:52'),
(2, 'Drifting Through Green Dreams', 'Life slows down where water whispers and palms lean close', 'Drifting_Through', 'The boat doesn\'t rush — it drifts, like a thought remembered too late. Along the silent backwaters of Kerala, life happens in gentle motions: a fisherman casts his net in rhythm with the wind, birds skim the surface like skipped stones, and palms lean over as if listening to the stories the current carries. The houseboat — part cottage, part cradle — floats past floating hyacinths and stilted huts, carrying dreams wrapped in coconut-fringed mornings. There are no horns here, no deadlines — only the quiet ballet of nature and tradition. A journey not across distance, but into stillness.', 'post2.img', '2025-05-31 17:16:01'),
(3, 'The Watcher of the Cliffs', ' One quiet guardian above the clouds, lost in green silence', 'mountain-monkey-cliff', 'High above the valleys, where the air thins and the winds sing, a lone monkey sits on the edge of the world. It isn’t just a moment — it’s a metaphor. Surrounded by endless waves of mountain green and skies brushed with mist, this little sentinel seems to hold the secrets of the forest in his silence. He does not climb for food or shelter today — he climbs for perspective. Here, nature speaks softly, and only those who sit still enough can hear it. Perhaps that’s the wisdom of the wild: to pause, look out, and simply be.', 'post3.img', '2025-06-02 16:13:23'),
(4, 'Stone Stillness', ' In a world carved by time, silence becomes sacred', 'meditation-in-hampi-rocky', 'The rocks here are not just stones — they are storytellers. Formed over millions of years and sun-baked into smooth monoliths, they stretch across the horizon like a forgotten kingdom. Amidst them sits a figure in quiet meditation, unmoved by the vastness around. The golden light of dusk touches both skin and stone alike, blending the human moment with the eternal stillness of the land. In Hampi’s open silence, thoughts don’t echo — they dissolve. It’s not just nature — it’s a temple without walls, and peace without ritual.', 'post4.img', '2025-06-02 16:18:08'),
(5, 'Whispers of the Tide', 'Where waves meet the soul and silence speaks in salt', 'sunset-beach-nature', 'The shoreline curves like a gentle sigh beneath the evening sky. Each wave whispers secrets to the sand, retreating just as softly as it came. The sun sinks behind the silhouette of trees, casting silver and amber over the water’s skin. There are no crowds here—only the quiet hum of nature’s rhythm. The sea doesn’t crash, it calls. And in that call, the heart finds what the mind didn’t know it was seeking: stillness, clarity, peace.', 'post5.img', '2025-06-02 19:26:17'),
(6, 'The Roar Beneath the Canopy', 'A waterfall’s thunderous grace in the arms of the wild', 'waterfall-nature-power-serenity', 'Cascading with primal force, the waterfall splits the silence of the forest. Water rushes down the ancient rocks like silver ribbons unraveling from the clouds. The roar is not just sound—it’s a pulse, a reminder that nature breathes with power and poise. Mist kisses the leaves, creating a shimmering veil of purity. Standing here, every breath is deeper, every thought lighter. This isn’t just a view—it’s a cleansing, a communion with the timeless energy of the earth.', 'post6.img', '2025-06-02 19:49:20'),
(7, 'Whispers of the Hills', 'Where green carpets meet the breath of the sky', 'lush-hills-stormy-sky-mountain-serenity', 'The horizon folds gently into waves of green hills, each one a brushstroke in nature’s grand canvas. Above them, the sky churns with rolling clouds, casting beams of light that pierce the mist like divine threads. The air is heavy with the scent of rain and earth. In this moment, the world holds its breath. This is a place where thoughts slow down, where the silence between the breezes says more than words ever could. A perfect harmony of shadow and shine—this is where solitude blooms.', 'post7.img', '2025-06-02 19:56:19'),
(8, 'A Glimpse Through Heaven’s Window', 'When the earth whispers from beyond the clouds', 'valley-view-clouds-mountain-top-escape', 'From this height, the world below looks like a painted dream—green patchworks stretching across the valley floor, veiled occasionally by passing clouds. The peaks peek through the mist, standing like ancient sentinels watching over a timeless land. There’s a surreal stillness in this altitude, where the clouds drift around you and silence wraps everything in calm. It\'s not just a view; it\'s a perspective—one that makes everyday worries dissolve into the blue beyond.', 'post8.img', '2025-06-02 20:03:02'),
(9, 'Where the Mountains Meet the Water', 'A lake cradled in the arms of giants', 'mountain-lake-tranquility-escape', 'Nestled between lush hills and towering peaks, this mountain lake feels like a hidden gem whispered only to the wind. The water reflects the moody skies and the quiet strength of the mountains above, while the surrounding greenery hums with life. The palm tree leaning in adds a tropical grace to this highland sanctuary. It’s the kind of place that doesn’t demand your attention but rewards your stillness—with peace, reflection, and the kind of silence that speaks volumes.', 'post9.img', '2025-06-02 20:09:23'),
(10, 'Whispers of the Arabian Sea', 'Where the sun kisses the waves and the palms tell stories of tranquility.', 'whispers-arabian-sea-beach-sunset', 'Tucked away from the chaos of the world lies a hidden gem along India’s western coastline, where nature paints its masterpiece every evening. As the golden sun dips gently into the Arabian Sea, its warm hues dance across the waves, casting a soft glow over untouched sands and swaying palms.\r\n\r\nThis beach, cradled by lush green cliffs and scattered black rocks, offers more than just a view — it offers silence, solitude, and soul-refreshing beauty. Ideal for contemplative walks, sunset photography, or simply soaking in the salty breeze, this coastal paradise remains one of the region\'s best-kept secrets.\r\n\r\nWhether you\'re a nature lover, a romantic soul, or a seeker of peaceful escapes, this beach promises a moment of magic — a whisper from the sea, calling you back to calm.', 'post10.img', '2025-06-02 20:20:37'),
(13, 'The Divine Tapestry of Srirangam', 'Where devotion meets the divine in a riot of colors and carvings', 'srirangam-temple-divine-colors', 'Standing as a magnificent testament to Dravidian architecture and spiritual legacy, the Srirangam Ranganathaswamy Temple is one of India’s largest and most revered temple complexes. Every inch of its vibrant gopurams (towering gateways) is adorned with meticulously painted sculptures depicting deities, mythical beings, and epics from Hindu lore.\r\n\r\nLocated on an island formed by the Kaveri River, this temple is not just a place of worship but a living monument of devotion, heritage, and artistic brilliance. The towering Rajagopuram, soaring over 230 feet, marks the skyline and welcomes millions of pilgrims each year.\r\n\r\nVisitors are enveloped in an aura of timelessness — where chants echo through ancient corridors and the scent of camphor and jasmine fills the air. Whether you\'re a pilgrim or an admirer of ancient art, Srirangam offers a sacred experience unlike any other.', 'post11.img', '2025-06-02 23:54:12'),
(14, 'Majesty in Stone: The Meenakshi Temple of Madurai', 'A divine dance of devotion and architecture beneath the southern skies.', 'meenakshi-temple-madurai-divine-architecture', 'Rising like a mystical fortress in the heart of Madurai, the Meenakshi Amman Temple is one of India’s most iconic spiritual landmarks. With its towering gopurams adorned with thousands of vivid sculptures — gods, goddesses, celestial beings, and mythical creatures — this temple is an explosion of color, culture, and craftsmanship.\r\n\r\nDedicated to Goddess Meenakshi (a form of Parvati) and Lord Sundareswarar (Shiva), this temple is not just a place of worship but a thriving center of Tamil heritage. The sprawling complex spans 14 majestic gopurams, each narrating epic stories through stone, with the tallest soaring to over 170 feet.\r\n\r\nAs the golden rays of dawn touch its spires and the chants rise with the temple bells, visitors are transported into a realm where faith and art merge seamlessly. Whether you\'re marveling at the celestial carvings or walking the thousand-pillared halls, Meenakshi Temple offers a divine experience steeped in over two millennia of history.', 'post12.img', '2025-06-03 00:14:36');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `Sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
