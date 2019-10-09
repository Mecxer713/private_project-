
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `educave3_gsms`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE `academic_years` (
  `id` int(11) NOT NULL,
  `session_year` varchar(50) CHARACTER SET utf8 NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_running` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academic_years`
--

INSERT INTO `academic_years` (`id`, `session_year`, `start_year`, `end_year`, `note`, `is_running`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'July 2018 - June 2019', 2018, 2019, 'Lorem Ipsum has been the  standard dummy text ever since the 1500s,', 1, 1, '2018-02-08 05:42:55', '2018-06-20 14:42:52', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `ip_address` varchar(20) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `activity` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `deadline` date NOT NULL,
  `note` text CHARACTER SET utf8,
  `assignment` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assignments`
--
--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `custom_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `isbn_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `edition` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `language` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `cover` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `rack_no` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `book_issues`
--

CREATE TABLE `book_issues` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `library_member_id` int(11) NOT NULL COMMENT 'Library member id',
  `book_id` int(11) NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date NOT NULL,
  `is_returned` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `theme` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `top_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sub_title_left` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sub_title_middle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sub_title_right` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `main_text` text CHARACTER SET utf8,
  `footer_left` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `footer_middle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `footer_right` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `background` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `numeric_name` int(11) NOT NULL,
  `monthly_tution_fee` double(10,2) NOT NULL,
  `admission_fee` double(10,2) NOT NULL,
  `exam_fee` double(10,2) NOT NULL,
  `certificate_fee` double(10,2) NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `designations`
--

CREATE TABLE `designations` (
  `id` int(11) NOT NULL,
  `name` varchar(120) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designations`
--

INSERT INTO `designations` (`id`, `name`, `note`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'Office Assistant', 'Lorem Ipsum there are many variations of passages of available', 1, '2017-08-18 12:59:25', '2018-07-14 13:07:28', 0, 1),
(3, 'Marketing', 'Lorem Ipsum comes from sections 1.10.32', 1, '2017-09-21 10:09:15', '2018-02-08 05:50:45', 1, 1),
(4, 'Clark', 'Lorem Ipsum has been the standard dummy text ever since the 1500s,', 1, '2017-09-21 10:09:37', '2018-02-08 05:52:12', 1, 1),
(5, 'Pion', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,', 1, '2017-09-21 10:09:52', '2018-02-08 05:53:00', 1, 1),
(11, 'Accounting', 'Lorem Ipsum there are many variations of passages', 1, '2018-07-14 13:08:06', '2019-02-04 01:07:28', 1, 1),
(7, 'Servent', 'Lorem Ipsum comes from sections', 1, '2017-09-21 10:11:02', '2018-02-08 05:54:51', 1, 1),
(8, 'Librarian', 'Lorem Ipsum is not simply random text.', 1, '2017-09-21 10:11:53', '2018-02-08 05:55:39', 1, 1),
(10, 'Office Management', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', 1, '2018-07-14 13:03:37', '0000-00-00 00:00:00', 1, 0),
(12, 'Office Assistant 2', 'sdsf h fjjjjjjjjjjjjjjj ytdff h', 1, '2019-02-26 19:40:11', '2019-02-26 19:48:45', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `note` text,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `sender_role_id` int(11) NOT NULL,
  `receivers` text CHARACTER SET utf8,
  `academic_year_id` int(11) NOT NULL,
  `email_type` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '1. general, 2. Attendance, 3. Due Fee, 4. Result ',
  `absent_date` date NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `attachment` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `national_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `designation_id` int(11) NOT NULL,
  `salary_grade_id` int(11) DEFAULT NULL,
  `salary_type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `present_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `blood_group` varchar(10) CHARACTER SET utf8 NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dob` date NOT NULL,
  `joining_date` date NOT NULL,
  `resign_date` date DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `resume` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `twitter_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_plus_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `instagram_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pinterest_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `youtube_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `other_info` text,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `user_id`, `national_id`, `designation_id`, `salary_grade_id`, `salary_type`, `name`, `phone`, `present_address`, `permanent_address`, `gender`, `blood_group`, `religion`, `dob`, `joining_date`, `resign_date`, `photo`, `resume`, `facebook_url`, `linkedin_url`, `twitter_url`, `google_plus_url`, `instagram_url`, `pinterest_url`, `youtube_url`, `other_info`, `is_view_on_web`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 1, '11111111115', 9, 1, 'monthly', 'Super Admin', '1234856975', 'dgfdh', 'fghf', 'female', 'b_positive', 'asfsf', '1969-12-01', '1969-12-31', NULL, NULL, NULL, 'https://www.facebook.com/', 'https://www.linkedin.com/', 'https://twitter.com/', 'https://plus.google.com/', 'https://www.instagram.com/', 'https://www.pinterest.com/', 'https://www.youtube.com/', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.e', 0, 1, '0000-00-00 00:00:00', '2019-02-27 15:34:41', 0, 1);

--
-- Table structure for table `employee_attendances`
--

CREATE TABLE `employee_attendances` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `month` varchar(10) CHARACTER SET utf8 NOT NULL,
  `year` varchar(10) CHARACTER SET utf8 NOT NULL,
  `day_1` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_2` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_3` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_4` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_5` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_6` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_7` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_8` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_9` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_10` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_11` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_12` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_13` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_14` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_15` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_16` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_17` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_18` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_19` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_20` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_21` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_22` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_23` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_24` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_25` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_26` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_27` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_28` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_29` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_30` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_31` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `student_type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `event_place` varchar(255) CHARACTER SET utf8 NOT NULL,
  `event_from` date NOT NULL,
  `event_to` date NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `start_date` date NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `exam_attendances`
--

CREATE TABLE `exam_attendances` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `is_attend` varchar(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `total_subject` int(11) NOT NULL,
  `total_mark` int(11) NOT NULL,
  `total_obtain_mark` int(11) NOT NULL,
  `avg_grade_point` float(5,2) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `result_status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `exam_schedules`
--

CREATE TABLE `exam_schedules` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `exam_date` date NOT NULL,
  `start_time` varchar(20) CHARACTER SET utf8 NOT NULL,
  `end_time` varchar(20) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `room_no` varchar(20) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `expenditures`
--

CREATE TABLE `expenditures` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `expenditure_head_id` int(11) NOT NULL,
  `expenditure_type` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expenditure_via` varchar(20) CHARACTER SET utf8 NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `expenditure_heads`
--

CREATE TABLE `expenditure_heads` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `fees_amount`
--

CREATE TABLE `fees_amount` (
  `id` int(11) NOT NULL,
  `income_head_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `fee_amount` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


--
-- Table structure for table `final_results`
--

CREATE TABLE `final_results` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `total_subject` int(11) NOT NULL,
  `total_mark` int(11) NOT NULL,
  `total_obtain_mark` int(11) NOT NULL,
  `avg_grade_point` float(5,2) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `result_status` varchar(50) CHARACTER SET utf8 NOT NULL,
  `merit_rank_in_class` varchar(20) CHARACTER SET utf8 NOT NULL,
  `merit_rank_in_section` varchar(20) CHARACTER SET utf8 NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8,
  `is_view_on_web` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `gallery_images`
--

CREATE TABLE `gallery_images` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `caption` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `point` decimal(10,2) NOT NULL,
  `mark_from` int(11) NOT NULL,
  `mark_to` int(11) NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `gsms_sessions`
--

CREATE TABLE `gsms_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `national_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `relation` varchar(20) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `profession` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `present_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `religion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `other_info` text,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `guardian_feedbacks`
--

CREATE TABLE `guardian_feedbacks` (
  `id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `feedback` text NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `hostels`
--

CREATE TABLE `hostels` (
  `id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8,
  `status` int(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `hostel_members`
--

CREATE TABLE `hostel_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `custom_member_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `income_heads`
--

CREATE TABLE `income_heads` (
  `id` int(11) NOT NULL,
  `head_type` varchar(20) CHARACTER SET utf8 DEFAULT '0' COMMENT 'fee, income, hostel, transport',
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `income_head_id` int(11) NOT NULL,
  `custom_invoice_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `invoice_type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT 'income, fee, hostel, transport',
  `is_applicable_discount` tinyint(1) DEFAULT '0',
  `academic_year_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `month` varchar(20) DEFAULT NULL,
  `gross_amount` double(10,2) NOT NULL,
  `net_amount` double(10,2) NOT NULL,
  `discount` decimal(10,2) NOT NULL,
  `paid_status` varchar(20) NOT NULL DEFAULT 'Unpaid',
  `temp_amount` double(10,2) NOT NULL,
  `date` date NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `label` text COLLATE utf8_unicode_ci,
  `english` longtext COLLATE utf8_unicode_ci,
  `bengali` longtext COLLATE utf8_unicode_ci,
  `spanish` longtext COLLATE utf8_unicode_ci,
  `arabic` longtext COLLATE utf8_unicode_ci,
  `hindi` longtext COLLATE utf8_unicode_ci,
  `urdu` longtext COLLATE utf8_unicode_ci,
  `chinese` longtext COLLATE utf8_unicode_ci,
  `japanese` longtext COLLATE utf8_unicode_ci,
  `portuguese` longtext COLLATE utf8_unicode_ci,
  `russian` longtext COLLATE utf8_unicode_ci,
  `french` longtext COLLATE utf8_unicode_ci,
  `korean` longtext COLLATE utf8_unicode_ci,
  `german` longtext COLLATE utf8_unicode_ci,
  `italian` longtext COLLATE utf8_unicode_ci,
  `thai` longtext COLLATE utf8_unicode_ci,
  `hungarian` longtext COLLATE utf8_unicode_ci,
  `dutch` longtext COLLATE utf8_unicode_ci,
  `latin` longtext COLLATE utf8_unicode_ci,
  `indonesian` longtext COLLATE utf8_unicode_ci,
  `turkish` longtext COLLATE utf8_unicode_ci,
  `greek` longtext COLLATE utf8_unicode_ci,
  `persian` longtext COLLATE utf8_unicode_ci,
  `malay` longtext COLLATE utf8_unicode_ci,
  `telugu` longtext COLLATE utf8_unicode_ci,
  `tamil` longtext COLLATE utf8_unicode_ci,
  `gujarati` longtext COLLATE utf8_unicode_ci,
  `polish` longtext COLLATE utf8_unicode_ci,
  `ukrainian` longtext COLLATE utf8_unicode_ci,
  `panjabi` longtext COLLATE utf8_unicode_ci,
  `romanian` longtext COLLATE utf8_unicode_ci,
  `burmese` longtext COLLATE utf8_unicode_ci,
  `yoruba` longtext COLLATE utf8_unicode_ci,
  `hausa` longtext COLLATE utf8_unicode_ci
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(1, 'add', 'Add', 'যোগ করুন', 'Añadir', 'إضافة', 'जोड़ना', 'شامل کریں', '加', '追加', 'Adicionar', 'Добавить', 'Ajouter', '더하다', 'Hinzufügen', 'Inserisci', 'เพิ่ม', 'hozzáad', 'Toevoegen', 'addere', 'Menambahkan', 'Eklemek', 'Προσθέτω', 'اضافه کردن', 'Tambah', 'చేర్చు', 'கூட்டு', 'ઉમેરો', 'Dodaj', 'Додати', 'ਜੋੜੋ', 'Adăuga', 'ပေါင်း', 'Fi kun', 'Ƙara'),
(2, 'edit', 'Edit', 'সম্পাদনা করুন', 'Editar', 'تصحيح', 'संपादित करें', 'ترمیم', '编辑', '編集', 'Editar', 'редактировать', 'modifier', '편집하다', 'Bearbeiten', 'modificare', 'แก้ไข', 'szerkesztése', 'Bewerk', 'recensere', 'Edit', 'Düzenle', 'Επεξεργασία', 'ویرایش', 'Edit', 'మార్చు', 'தொகு', 'સંપાદિત કરો', 'Edytować', 'Редагувати', 'ਸੰਪਾਦਿਤ ਕਰੋ', 'Editați | ×', 'Edit ကို', 'Ṣatunkọ', 'Shirya'),
(3, 'delete', 'Delete', 'মুছুন', 'Borrar', 'حذف', 'हटाना', 'حذف کریں', '删除', '削除', 'Excluir', 'Удалить', 'effacer', '지우다', 'Löschen', 'Elimina', 'ลบ', 'Töröl', 'Verwijder', 'delere', 'Menghapus', 'silmek', 'Διαγράφω', 'حذف', 'Padam', 'తొలగించు', 'அழி', 'કાઢી નાંખો', 'Kasować', 'Видалити', 'ਮਿਟਾਓ', 'Șterge', 'ဖျက်ပစ်ပါ', 'Paarẹ', 'Share'),
(4, 'view', 'View', 'দেখুন', 'Ver', 'رأي', 'राय', 'دیکھیں', '视图', 'ビュー', 'Visão', 'Посмотреть', 'vue', '전망', 'Aussicht', 'vista', 'ดู', 'Kilátás', 'Uitzicht', 'View', 'Melihat', 'Görünüm', 'Θέα', 'چشم انداز', 'Lihat', 'చూడండి', 'காண்க', 'જુઓ', 'Widok', 'Вид', 'ਵੇਖੋ', 'Vedere', 'ကြည့်ရှုခြင်း', 'Wo', 'Duba'),
(5, 'action', 'Action', 'ক্রিয়া', 'Acción', 'عمل', 'कार्य', 'عمل', '行动', 'アクション', 'Açao', 'действие', 'action', '동작', 'Aktion', 'Azione', 'การกระทำ', 'Akció', 'Actie', 'actum', 'Tindakan', 'Aksiyon', 'Δράση', 'عمل', 'Tindakan', 'యాక్షన్', 'அதிரடி', 'ક્રિયા', 'Akcja', 'Дія', 'ਐਕਸ਼ਨ', 'Acțiune', 'လှုပ်ရှားမှု', 'Ise', 'Action'),
(6, 'status', 'Status', 'অবস্থা', 'Estado', 'الحالة', 'स्थिति', 'حالت', '状态', '状態', 'Status', 'Положение дел', 'statut', '지위', 'Status', 'Stato', 'สถานะ', 'Állapot', 'staat', 'Status', 'Status', 'durum', 'Κατάσταση', 'وضعیت', 'Status', 'స్థితి', 'நிலைமை', 'સ્થિતિ', 'Status', 'Статус', 'ਸਥਿਤੀ', 'stare', 'အဆင့်အတန်း', 'Ipo', 'Matsayi'),
(7, 'select', 'Select', 'নির্বাচন করুন', 'Seleccionar', 'تحديد', 'चुनते हैं', 'منتخب کریں', '选择', '選択', 'Selecione', 'Выбрать', 'sélectionner', '고르다', 'Wählen', 'Selezionare', 'เลือก', 'választ', 'kiezen', 'select', 'Memilih', 'seçmek', 'Επιλέγω', 'انتخاب کنید', 'Pilih', 'ఎంచుకోండి', 'தேர்வு', 'પસંદ કરો', 'Wybierz', 'Виберіть', 'ਚੁਣੋ', 'Selectați', 'ကို Select လုပ်ပါ', 'Yan', 'Zaɓi'),
(8, 'photo', 'Photo', 'ছবি', 'Foto', 'صورة فوتوغرافية', 'तस्वीर', 'تصویر', '照片', '写真', 'foto', 'Фото', 'photo', '사진', 'Foto', 'Foto', 'ภาพถ่าย', 'Fénykép', 'Foto', 'photo', 'Foto', 'Fotoğraf', 'φωτογραφία', 'عکس', 'Foto', 'ఫోటో', 'புகைப்பட', 'ફોટો', 'Zdjęcie', 'Фотографія', 'ਫੋਟੋ', 'Fotografie', 'ဓာတ်ပုံ', 'aworan', 'Hotuna'),
(9, 'upload', 'Upload', 'আপলোড', 'Subir', 'تحميل', 'अपलोड', 'اپ لوڈ کریں', '上传', 'アップロード', 'Envio', 'Загрузить', 'télécharger', '업로드', 'Hochladen', 'Caricare', 'อัปโหลด', 'Feltöltés', 'Uploaden', 'Index', 'Upload', 'Yükleme', 'Μεταφόρτωση', 'بارگذاری', 'Muat naik', 'అప్లోడ్', 'பதிவேற்றம்', 'અપલોડ કરો', 'Przekazać plik', 'Завантажити', 'ਅਪਲੋਡ ਕਰੋ', 'Încărcați', 'လွှတ်တင်ခြင်း', 'Po si', 'Upload'),
(10, 'created', 'Created', 'তৈরীর তারিখ', 'Creado', 'خلقت', 'बनाया था', 'تخلیق', '创建', '作成した', 'Criada', 'созданный', 'créé', '만들어진', 'Erstellt', 'Creato', 'ที่สร้างไว้', 'Alkotó', 'gemaakt', 'creatum', 'Dibuat', 'düzenlendi', 'Δημιουργήθηκε', 'ایجاد شده', 'Dicipta', 'రూపొందించబడింది', 'உருவாக்கப்பட்டது', 'બનાવ્યું', 'Stworzony', 'Створено', 'ਬਣਾਇਆ ਗਿਆ', 'Creată', 'Created', 'Ti ṣẹda', 'An yi'),
(11, 'modified', 'Modified', 'পরিবর্তিত তারিখ', 'Modificado', 'تم التعديل', 'संशोधित', 'ترمیم', '改性', '変更された', 'Modificado', 'модифицированный', 'modifié', '수정 됨', 'Geändert', 'Modificata', 'ดัดแปลง', 'Módosított', 'gewijzigde', 'Modified', 'Diubah', 'Değiştirilmiş', 'Τροποποιήθηκε', 'اصلاح شده', 'Diubah suai', 'సవరించిన', 'திருத்தப்பட்ட', 'સંશોધિત', 'Zmodyfikowany', 'Змінено', 'ਸੰਸ਼ੋਧਿਤ', 'Modificat', 'ပြုပြင်ထားသော', 'Ti yipada', 'An gyara'),
(12, 'manage', 'Manage', 'পরিচালনা করা', 'Gestionar', 'تدبير', 'प्रबंधित', 'انتظام کریں', '管理', '管理', 'Gerir', 'управлять', 'gérer', '꾸리다', 'Verwalten', 'Gestire', 'จัดการ', 'kezel', 'beheren', 'curo', 'Mengelola', 'yönetme', 'Διαχειρίζονται', 'مدیریت کردن', 'Mengurus', 'నిర్వహించడానికి', 'நிர்வகிக்கவும்', 'મેનેજ કરો', 'Zarządzanie', 'Керувати', 'ਪ੍ਰਬੰਧ ਕਰਨਾ, ਕਾਬੂ ਕਰਨਾ', 'Administra', 'စီမံခန့်ခွဲရန်', 'Ṣakoso', 'Sarrafa'),
(13, 'cancel', 'Cancel', 'বাতিল', 'Cancelar', 'إلغاء', 'रद्द करना', 'منسوخ کریں', '取消', 'キャンセル', 'Cancelar', 'Отмена', 'Annuler', '취소', 'Stornieren', 'Annulla', 'ยกเลิก', 'Megszünteti', 'Annuleer', 'Cancel', 'Membatalkan', 'İptal etmek', 'Ματαίωση', 'لغو', 'Batalkan', 'రద్దు', 'ரத்து', 'રદ કરો', 'Anuluj', 'Скасувати', 'ਰੱਦ ਕਰੋ', 'Anulare', 'Cancel', 'Fagilee', 'Cancel'),
(14, 'submit', 'Submit', 'জমা দিন', 'Enviar', 'خضع', 'जमा करें', 'جمع', '提交', '提出する', 'Enviar', 'Отправить', 'soumettre', '제출', 'einreichen', 'Sottoscrivi', 'เสนอ', 'beküldése', 'voorleggen', 'submit', 'Menyerahkan', 'Gönder', 'υποβάλλουν', 'ارسال', 'Hantar', 'సమర్పించండి', 'சமர்ப்பி', 'સબમિટ કરો', 'Zatwierdź', 'Відправити', 'ਜਮ੍ਹਾਂ ਕਰੋ', 'A depune', 'တင်သွင်း', 'Firanṣẹ', 'Sanya'),
(15, 'update', 'Update', 'আপডেট', 'Actualizar', 'تحديث', 'अद्यतन करें', 'اپ ڈیٹ', '更新', '更新', 'Atualizar', 'Обновить', 'mettre à jour', '최신 정보', 'Aktualisieren', 'Aggiornare', 'ปรับปรุง', 'frissítés', 'Bijwerken', 'Update', 'Memperbarui', 'Güncelleştirme', 'Εκσυγχρονίζω', 'به روز رسانی', 'Kemas kini', 'నవీకరణ', 'புதுப்பிக்கப்பட்டது', 'અપડેટ કરો', 'Aktualizacja', 'Оновити', 'ਅੱਪਡੇਟ ਕਰੋ', 'Actualizați', 'Update ကို', 'Imudojuiwọn', 'Sabuntawa'),
(16, 'no_data_found', 'No available data found ', 'কোন তথ্য পাওয়া যায় নি', 'No hay datos disponibles encontrados', 'لم يتم العثور على بيانات متوفرة', 'कोई उपलब्ध डेटा नहीं मिला', 'دستیاب ڈیٹا نہیں ملا', '没有找到可用的数据', '利用可能なデータが見つかりません', 'Não foram encontrados dados disponíveis', 'Нет доступных данных', 'mettre à jour...', '사용할 수있는 데이터가 없습니다.', 'Keine verfügbaren Daten gefunden', 'Nessun dato disponibile trovato', 'ไม่พบข้อมูลที่มีอยู่', 'Nincs elérhető adat', 'Geen beschikbare gegevens gevonden', 'Notitia available non inveni', 'Tidak ditemukan data yang tersedia', 'Mevcut veri bulunamadı', 'Δεν βρέθηκαν διαθέσιμα δεδομένα', 'داده های موجود یافت نشد', 'Tiada data yang terdapat', 'అందుబాటులో ఉన్న డేటా కనుగొనబడలేదు', 'கிடைக்கக்கூடிய தரவுகள் எதுவும் கிடைக்கவில்லை', 'કોઈ ઉપલબ્ધ માહિતી મળી નથી', 'Nie znaleziono żadnych dostępnych danych', 'Не знайдено доступних даних', 'ਕੋਈ ਉਪਲਬਧ ਡੇਟਾ ਨਹੀਂ ਮਿਲਿਆ', 'Nu s-au găsit date disponibile', 'မျှမတွေ့မရရှိနိုင်ပါဒေတာ', 'Ko si data to wa ti o wa', 'Babu samin bayanai da aka samo'),
(17, 'confirm_alert', 'Are you sure you want to delete this', 'আপনি কি ডেটা মুছে ফেলার ব্যাপারে নিশ্চিত?', 'Estás seguro que quieres eliminar esto', 'هل أنت متأكد أنك تريد حذف هذا', 'क्या आप वाकई इसे हटाना चाहते हैं', 'کیا آپ واقعی یہ حذف کرنا چاہتے ہیں', '你确定要删除这个吗', 'これを削除してもよろしいですか？', 'Tem certeza de que deseja excluir isso', 'Вы действительно хотите удалить это', 'vous êtes sûr de vouloir supprimer ce', '이 사진을 삭제 하시겠습니까?', 'Möchtest du das wirklich löschen?', 'Sei sicuro di voler cancellare questo', 'คุณแน่ใจหรือไม่ว่าต้องการลบข้อมูลนี้', 'Biztosan törölni szeretné', 'Weet je zeker dat je dit wilt verwijderen?', 'Esne certus vos volo ut delete is', 'Apa kamu yakin ingin menghapus ini', 'Bunu silmek istediğinizden emin misiniz', 'Είστε βέβαιοι ότι θέλετε να το διαγράψετε', 'آیا مطمئن هستید که می خواهید این را حذف کنید', 'Adakah anda pasti mahu memadam ini', 'మీరు దీన్ని ఖచ్చితంగా తొలగించాలనుకుంటున్నారా', 'இதை நீ நிச்சயமாக நீக்க விரும்புகிறாயா?', 'શું તમે ખરેખર આને કાઢી નાખવા માંગો છો?', 'Czy na pewno chcesz to usunąć?', 'Ви впевнені, що хочете видалити це', 'ਕੀ ਤੁਸੀਂ ਨਿਸ਼ਚਤ ਰੂਪ ਤੋਂ ਇਸ ਨੂੰ ਮਿਟਾਉਣਾ ਚਾਹੁੰਦੇ ਹੋ?', 'Sigur doriți să ștergeți acest lucru', 'သင်ဤပယ်ဖျက်ဖို့လိုတာသေချာ', 'Ṣe o da ọ loju pe o fẹ paarẹ yii', 'Kuna tabbatar kana so ka share wannan'),
(18, 'insert_success', 'Data inserted successfully', 'ডেটা সফলভাবে ঢোকানো হয়েছে', 'Datos insertados con éxito', 'تم إدراج البيانات بنجاح', 'डेटा सफलतापूर्वक डाला गया', 'ڈیٹا کامیابی سے داخل ہوگئی ہے', '数据插入成功', 'データが正常に挿入された', 'Dados inseridos com sucesso', 'Данные успешно вставлены', 'Données insérées avec succès', '데이터가 성공적으로 삽입되었습니다.', 'Daten wurden erfolgreich eingefügt', 'Dati inseriti correttamente', 'แทรกข้อมูลเรียบร้อยแล้ว', 'Az adatok sikeresen be vannak illesztve', 'Gegevens succesvol ingevoegd', 'Data bene insertas', 'Data berhasil dimasukkan', 'Veriler başarıyla eklendi', 'Τα δεδομένα έχουν εισαχθεί με επιτυχία', 'داده ها با موفقیت وارد شدند', 'Data dimasukkan dengan jayanya', 'డేటా విజయవంతంగా చొప్పించబడింది', 'தரவு வெற்றிகரமாக சேர்க்கப்பட்டது', 'ડેટા સફળતાપૂર્વક શામેલ કર્યો', 'Dane wstawione pomyślnie', 'Дані введені успішно', 'ਡਾਟਾ ਸਫਲਤਾਪੂਰਵਕ ਪਾਇਆ ਗਿਆ', 'Datele introduse cu succes', 'အောင်မြင်စွာဖြည့်စွက်ဖို့ဒေတာ', 'Data ti a fi sii ni ifijišẹ', 'Bayanin da aka sanya nasara'),
(19, 'insert_failed', 'Data insert failed. Please try again ', 'ডেটা সন্নিবেশ ব্যর্থ। অনুগ্রহপূর্বক আবার চেষ্টা করুন', 'La inserción de datos falló. Inténtalo de nuevo', 'أخفقت عملية إدراج البيانات. حاول مرة اخرى', 'डेटा डालना विफल हुआ कृपया पुन: प्रयास करें', 'ڈیٹا داخل ناکام ہوگیا. دوبارہ کوشش کریں', '数据插入失败。 请再试一次', 'データの挿入に失敗しました。 もう一度お試しください', 'A inserção de dados falhou. Por favor, tente novamente', 'Ошибка ввода данных. Пожалуйста, попробуйте еще раз', 'Linsertion de données a échoué. Sil vous plaît essayez', '데이터 삽입에 실패했습니다. 다시 시도적으로 업데이트되었습니다.하십시오.', 'Daten einfügen fehlgeschlagen. Bitte versuche es erneut', 'Inserimento dati non riuscito. Per favore riprova', 'แทรกข้อมูลล้มเหลว กรุณาลองอีกครั้ง', 'Az adatbetöltés meghiúsult. Kérlek próbáld újra', 'Gegevensinvoer mislukt. Probeer het opnieuw', 'Data inserta defecit. Quaero, iterum conare', 'Penyisipan data gagal Silahkan coba lagi', 'Veri girişi başarısız oldu. Lütfen tekrar deneyin', 'Η εισαγωγή δεδομένων απέτυχε. ΠΑΡΑΚΑΛΩ προσπαθησε ξανα', 'درج اطلاعات وارد نشد لطفا دوباره تلاش کنید', 'Masukkan data gagal. Sila cuba lagi', 'డేటా చొప్పించడం విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి', 'தரவு செருக முடியவில்லை. தயவு செய்து மீண்டும் முயற்சிக்கவும்', 'ડેટા શામેલ નિષ્ફળ. મહેરબાની કરીને ફરીથી પ્રયતન કરો', 'Nie udało się wstawić danych. Proszę spróbuj ponownie', 'Вставка даних не вдалося. Будь ласка спробуйте ще раз', 'ਡੇਟਾ ਡ੍ਰਟ ਕਰਨ ਵਿੱਚ ਅਸਫਲ. ਮੁੜ ਕੋਸ਼ਿਸ ਕਰੋ ਜੀ', 'Introducerea datelor a eșuat. Vă rugăm să încercați din nou', 'ဒေတာကိုထည့်သွင်းမအောင်မြင်ခဲ့ပေ။ ထပ်ကြိုးစားပါ', 'Asun faili ti kuna. Jọwọ gbiyanju lẹẹkansi', 'Saka bayanai ya kasa. Da fatan a sake gwadawa'),
(20, 'update_success', 'Data updated successfully', 'ডেটা সফলভাবে আপডেট করা হয়েছে', 'Datos actualizados con éxito', 'تم تحديث البيانات بنجاح', 'डेटा सफलतापूर्वक अपडेट किया गया', 'ڈیٹا کامیابی سے اپ ڈیٹ کیا', '数据已成功更新', 'データが正常に更新された', 'Dados atualizados com sucesso', 'Обновлены данные', 'Data updated successfully', '데이터가 성공적으로 업데이트되었습니다..', 'Daten wurden erfolgreich aktualisiert', 'Dati aggiornati con successo', 'อัปเดตข้อมูลเรียบร้อยแล้ว', 'Az adatok sikeresen frissültek', 'Gegevens zijn succesvol bijgewerkt', 'Updated notitia feliciter', 'Data berhasil diperbarui', 'Veri başarıyla güncellendiVeri güncellemesi başarısız oldu. Lütfen tekrar deneyin', 'Τα δεδομένα ενημερώθηκαν με επιτυχία', 'داده ها با موفقیت به روز شد', 'Data dikemas kini berjaya', 'డేటా విజయవంతంగా నవీకరించబడింది', 'தரவு வெற்றிகரமாக புதுப்பிக்கப்பட்டது', 'ડેટા સફળતાપૂર્વક અપડેટ થયો છે', 'Data zaktualizowana pomyślnie', 'Дані оновлено успішно', 'ਡਾਟਾ ਸਫਲਤਾਪੂਰਵਕ ਅਪਡੇਟ ਕੀਤਾ ਗਿਆ', 'Datele au fost actualizate cu succes', 'ဒေတာကိုအောင်မြင်စွာ updated', 'Ti ṣe imudojuiwọn imudojuiwọn ni ifijišẹ', 'An sabunta bayanan da aka sabunta'),
(21, 'update_failed', 'Data update failed. Please try again', 'তথ্য আপডেট ব্যর্থ হয়েছে অনুগ্রহপূর্বক আবার চেষ্টা করুন', 'La actualización de datos falló. Inténtalo de nuevo', 'فشل تحديث البيانات. حاول مرة اخرى', 'डेटा अपडेट विफल हुआ कृपया पुन: प्रयास करें', 'ڈیٹا اپ ڈیٹ ناکام ہوگیا. دوبارہ کوشش کریں', '数据更新失败。 请再试一次', 'データの更新に失敗しました。 もう一度お試しください', 'A atualização de dados falhou. Por favor, tente novamente', 'Ошибка обновления данных. Пожалуйста, попробуйте еще раз', 'La mise à jour des données a Veuillez réessayer', '데이터 업데이트에 실패했습니다. 다시 시도하십시오.', 'Datenaktualisierung fehlgeschlagen. Bitte versuche es erneut', 'Aggiornamento dati fallito. Per favore riprova', 'การอัปเดตข้อมูลล้มเหลว กรุณาลองอีกครั้ง', 'Az adatfrissítés nem sikerült. Kérlek próbáld újra', 'Gegevensupdate mislukt. Probeer het opnieuw', 'Data update defecit. Quaero, iterum conare', 'Pembaruan data gagal Silahkan coba lagi', 'Veri güncellemesi başarısız oldu. Lütfen tekrar deneyin', 'Η ενημέρωση δεδομένων απέτυχε. ΠΑΡΑΚΑΛΩ προσπαθησε ξανα', 'به روز رسانی داده خراب شد لطفا دوباره تلاش کنید', 'Kemas kini data gagal. Sila cuba lagi', 'డేటా నవీకరణ విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి', 'தரவு புதுப்பிப்பு தோல்வியடைந்தது. தயவு செய்து மீண்டும் முயற்சிக்கவும்', 'ડેટા અપડેટ નિષ્ફળ થયું. મહેરબાની કરીને ફરીથી પ્રયતન કરો', 'Aktualizacja danych nie powiodła się. Proszę spróbuj ponownie', 'Не вдалося оновити дані. Будь ласка спробуйте ще раз', 'ਡਾਟਾ ਅਪਡੇਟ ਅਸਫਲ. ਮੁੜ ਕੋਸ਼ਿਸ ਕਰੋ ਜੀ', 'Actualizarea datelor a eșuat. Vă rugăm să încercați din nou', 'ဒေတာကို update ကိုမအောင်မြင်ခဲ့ပေ။ ထပ်ကြိုးစားပါ', 'Imudara data ti kuna. Jọwọ gbiyanju lẹẹkansi', 'Rashin bayanin bayanai ya kasa. Da fatan a sake gwadawa'),
(22, 'delete_success', 'Data deleted successully', 'ডেটা সফলভাবে মোছা হয়েছে', 'Datos borrados con éxito', 'تم حذف البيانات بنجاح', 'डाटा सफलतापूर्वक हटा दिया गया', 'ڈیٹا کامیابی سے خارج ہوگئی ہے', '数据删除成功', 'データが正常に削除された', 'Dados eliminados com sucesso', 'Удалены данные', 'DonnéDonnées supprimées avec succès', '데이터가 성공적으로 삭제되었습니다.', 'Daten wurden erfolgreich gelöscht', 'Dati cancellati con successo', 'ลบข้อมูลสำเร็จแล้ว', 'Az adatok sikeresen törölve', 'Gegevens zijn met succes verwijderd', 'Data delevit feliciter', 'Data berhasil dihapus', 'Veri başarıyla silindi', 'Τα δεδομένα διαγράφηκαν με επιτυχία', 'داده ها با موفقیت حذف شدند', 'Data berjaya dipadam', 'డేటా విజయవంతంగా తొలగించబడింది', 'தரவு வெற்றிகரமாக நீக்கப்பட்டது', 'ડેટા સફળતાપૂર્વક કાઢી નાખ્યો', 'Dane zostały pomyślnie usunięte', 'Дані видалено успішно', 'ਡਾਟਾ ਸਫਲਤਾਪੂਰਵਕ ਮਿਟਾ ਦਿੱਤਾ ਗਿਆ', 'Datele au fost șterse cu succes', 'အောင်မြင်စွာဖျက်ပစ်ဒေတာများ', 'Paarẹ ti paarẹ ni ifijišẹ', 'Bayanan da aka share nasarar'),
(23, 'delete_failed', 'Data delete failed. Please try again', 'ডেটা মুছে ফেলতে ব্যর্থ হয়েছে অনুগ্রহপূর্বক আবার চেষ্টা করুন', 'La eliminación de datos falló. Inténtalo de nuevo', 'أخفق حذف البيانات. حاول مرة اخرى', 'डेटा को विफल करना विफल हुआ कृपया पुन: प्रयास करें', 'ڈیٹا ناکام ہوگیا. دوبارہ کوشش کریں', '数据删除失败。 请再试一次', 'データの削除に失敗しました。 もう一度お試しください', 'A exclusão de dados falhou. Por favor, tente novamente', 'Ошибка удаления данных. Пожалуйста, попробуйте еще раз', 'La suppression des données a échoué. Veuillez réessayer', '데이터를 삭제하지 못했습니다. 다시 시도하십시오.', 'Daten löschen fehlgeschlagen. Bitte versuche es erneut', 'Cancellazione dei dati fallita. Per favore riprova', 'การลบข้อมูลล้มเหลว กรุณาลองอีกครั้ง', 'Az adat törlése nem sikerült. Kérlek próbáld újra', 'Gegevens verwijderen mislukt. Probeer het opnieuw', 'Delete notitia defuit. Quaero, iterum conare', 'Penghapusan data gagal Silahkan coba lagi', 'Veri silinemedi. Lütfen tekrar deneyin', 'Η διαγραφή δεδομένων απέτυχε. ΠΑΡΑΚΑΛΩ προσπαθησε ξανα', 'داده حذف شد لطفا دوباره تلاش کنید', 'Pemadaman data gagal. Sila cuba lagi', 'డేటా తొలగింపు విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి', 'தரவு நீக்கம் தோல்வியடைந்தது. தயவு செய்து மீண்டும் முயற்சிக்கவும்', 'ડેટા કાઢી નાખવામાં નિષ્ફળ. મહેરબાની કરીને ફરીથી પ્રયતન કરો', 'Usuwanie danych nie powiodło się. Proszę spróbuj ponownie', 'Не вдалося видалити дані. Будь ласка спробуйте ще раз', 'ਡਾਟਾ ਮਿਟਾਉਣਾ ਅਸਫਲ. ਮੁੜ ਕੋਸ਼ਿਸ ਕਰੋ ਜੀ', 'Ștergerea datelor a eșuat. Vă rugăm să încercați din nou', 'ဒေတာကိုမအောင်မြင်ပါဖျက်ပစ်ပါမည်။ ထပ်ကြိုးစားပါ', 'Pipadanu data pa. Jọwọ gbiyanju lẹẹkansi', 'Kuskuren bayanai ya kasa. Da fatan a sake gwadawa'),
(24, 'sl_no', '#SL', 'ক্রমিক', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '# એસએલ', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL', '#SL'),
(25, 'find', 'Find', 'খোঁজ করুন', 'Encontrar', 'تجد', 'खोज', 'مل', '找', '検索', 'Encontrar', 'найти', 'Trouver', '발견', 'Finden', 'Trova', 'หา', 'megtalálja', 'Vind', 'Find', 'Menemukan', 'bulmak', 'Εύρημα', 'پیدا کردن', 'Cari', 'కనుగొనండి', 'கண்டுபிடிக்க', 'શોધવા', 'Odnaleźć', 'Знайдіть', 'ਲੱਭੋ', 'Găsi', 'ရှာတွေ့', 'Wa', 'Nemo'),
(26, 'quick_link', 'Quick Link', 'সরাসরি লিঙ্ক', 'Enlace rápido', 'رابط سريع', 'त्वरित लिंक', 'فوری لنک', '快速链接', 'クイックリンク', 'Link rápido', 'Прямая ссылка', 'Lien rapide', '빠른 링크', 'Schneller Link', 'Collegamento veloce', 'ลิงก์ด่วน', 'Gyors link', 'Snelle link', 'Velox Link', 'Tautan Cepat', 'Hızlı link', 'Γρήγορη σύνδεση', 'اتصال سریع', 'Pautan Cepat', 'త్వరిత లింక్', 'விரைவு இணைப்பு', 'ક્વિક લિંક', 'Szybki link', 'Швидка посилання', 'ਤੁਰੰਤ ਲਿੰਕ', 'Legătură rapidă', 'quick Link ကို', 'Ọna asopọ kiakia', 'Quick Link'),
(27, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড', 'Tablero', 'لوحة القيادة', 'डैशबोर्ड', 'ڈیش بورڈ', '仪表板', 'ダッシュボード', 'painel de controle', 'Панель приборов', 'tableau de bord', '데이터를 삭제하지 못했계기반', 'Instrumententafel', 'Cruscotto', 'แผงควบคุม', 'Irányítópult', 'Dashboard', 'ashboardday', 'Dasbor', 'gösterge paneli', 'Ταμπλό', 'داشبورد', 'Papan Pemuka', 'డాష్బోర్డ్', 'டாஷ்போர்டு', 'ડેશબોર્ડ', 'Deska rozdzielcza', 'Панель приладів', 'ਡੈਸ਼ਬੋਰਡ', 'Bord', 'dashboard ကို', 'Dasibodu', 'Dashboard'),
(28, 'list', 'List', 'তালিকা', 'Lista', 'قائمة', 'सूची', 'فہرست', '名单', 'リスト', 'Lista', 'Список', 'liste', '명부', 'Liste', 'Elenco', 'รายการ', 'Lista', 'Lijst', 'album', 'Daftar', 'Liste', 'Λίστα', 'فهرست', 'Senarai', 'జాబితా', 'பட்டியல்', 'યાદી', 'Lista', 'Перелік', 'ਸੂਚੀ', 'Listă', 'စာရင်း', 'Akojọ', 'Jerin'),
(29, 'setting', 'Setting', 'সেটিংস', 'Ajuste', 'ضبط', 'सेटिंग', 'سیٹنگ', '设置', '設定', 'Configuração', 'настройка', 'Sélection', '환경', 'Rahmen', 'Ambientazione', 'การตั้งค่า', 'Beállítás', 'omgeving', 'Occasum', 'pengaturan', 'Ayar', 'Σύνθεση', 'تنظیمات', 'Menetapkan', 'సెట్టింగు', 'அமைப்பை', 'સેટિંગ', 'Oprawa', 'Налаштування', 'ਸੈਟਿੰਗ', 'reglaj', 'setting ကို', 'Eto', 'Saitin'),
(30, 'general', 'General', 'সাধারণ', 'General', 'جنرال لواء', 'सामान्य', 'جنرل', '一般', '一般', 'Geral', 'Генеральная', 'général', '일반', 'Allgemeines', 'Generale', 'ทั่วไป', 'Tábornok', 'Algemeen', 'Generalis', 'Umum', 'Genel', 'Γενικός', 'عمومی', 'Ketua', 'జనరల్', 'பொது', 'જનરલ', 'Generał', 'Генерал', 'ਜਨਰਲ', 'General', 'ယေဘုယျ', 'Gbogbogbo', 'Janar'),
(31, 'payment', 'Payment', 'পেমেন্ট', 'Pago', 'دفع', 'भुगतान', 'ادائیگی', '付款', '支払い', 'Forma de pagamento', 'Оплата', 'Paiement', '지불', 'Zahlung', 'Pagamento', 'การชำระเงิน', 'Fizetés', 'Betaling', 'Payment', 'Pembayaran', 'Ödeme', 'Πληρωμή', 'پرداخت', 'Pembayaran', 'చెల్లింపు', 'கொடுப்பனவு', 'ચુકવણી', 'Zapłata', 'Оплата', 'ਭੁਗਤਾਨ', 'Plată', 'ငွေပေးချေမှုရမည့်', 'Isanwo', 'Biyan kuɗi'),
(32, 'theme', 'Theme', 'থিম', 'Tema', 'موضوع', 'विषय', 'خیالیہ', '主题', 'テーマ', 'Tema', 'тема', 'thème', '테마', 'Thema', 'Tema', 'กระทู้', 'Téma', 'Thema', 'theme', 'Tema', 'Tema', 'Θέμα', 'موضوع', 'Tema', 'థీమ్', 'தீம்', 'થીમ', 'Motyw', 'Тема', 'ਥੀਮ', 'Temă', 'အကွောငျး', 'Akori', 'Jigo'),
(33, 'language', 'Language', 'ভাষা', 'Idioma', 'لغة', 'भाषा', 'زبان', '语言', '言語', 'Língua', 'язык', 'La langue', '언어', 'Sprache', 'linguaggio', 'ภาษา', 'Nyelv', 'Taal', 'Lingua', 'Bahasa', 'Dil', 'Γλώσσα', 'زبان', 'Bahasa', 'భాషా', 'மொழி', 'ભાષા', 'Język', 'Мова', 'ਭਾਸ਼ਾ', 'Limba', 'ဘာသာစကား', 'Ede', 'Harshe'),
(34, 'administrator', 'Administrator', 'প্রশাসক', 'Administrador', 'مدير', 'प्रशासक', 'منتظم', '管理员', '管理者', 'Administrador', 'администратор', 'administrateur', '관리자', 'Administrator', 'Amministratore', 'ผู้บริหาร', 'Adminisztrátor', 'Beheerder', 'administrator', 'Administrator', 'yönetici', 'Διαχειριστής', 'مدیر', 'Pentadbir', 'నిర్వాహకుడు', 'நிர்வாகி', 'સંચાલક', 'Administrator', 'Адміністратор', 'ਪ੍ਰਬੰਧਕ', 'Administrator', 'အုပ်ချုပ်သူ', 'IT', 'Mai gudanarwa'),
(35, 'academic_year', 'Academic Year', 'শিক্ষাবর্ষ', 'Año académico', 'السنة الأكاديمية', 'शैक्षणिक वर्ष', 'تعلیمی سال', '学年', '学年', 'Ano acadêmico', 'Академический год', 'Année académique', '학년', 'Akademisches Jahr', 'Anno accademico', 'ปีการศึกษา', 'Tanév', 'Academiejaar', 'anno academic', 'Tahun akademik', 'Akademik yıl', 'Ακαδημαϊκό έτος', 'سال تحصیلی', 'Tahun akademik', 'విద్యా సంవత్సరం', 'கல்வி ஆண்டில்', 'શૈક્ષણીક વર્ષ', 'Rok akademicki', 'Навчальний рік', 'ਅਕਾਦਮਿਕ ਸਾਲ', 'An academic', 'စာသင်နှစ်', 'Akẹkọ Ọdún', 'Makarantar Kwalejin'),
(36, 'user', 'User', 'ব্যবহারকারী', 'Usuario', 'المستعمل', 'उपयोगकर्ता', 'صارف', '用户', 'ユーザー', 'Do utilizador', 'пользователь', 'Utilisateur', '사용자', 'Benutzer', 'Utente', 'ผู้ใช้งาน', 'használó', 'Gebruiker', 'User', 'Pengguna', 'kullanıcı', 'Χρήστης', 'کاربر', 'Pengguna', 'వాడుకరి', 'பயனர்', 'વપરાશકર્તા', 'Użytkownik', 'Користувач', 'ਯੂਜ਼ਰ', 'Utilizator', 'အသုံးပြုသူကို', 'Olumulo', 'Mai amfani'),
(37, 'role', 'Role', 'ভূমিকা', 'Papel', 'وظيفة', 'भूमिका', 'کردار', '角色', '役割', 'Função', 'Роль', 'Rôle', '역할', 'Rolle', 'Ruolo', 'บทบาท', 'Szerep', 'Rol', 'partes', 'Peran', 'rol', 'Ρόλος', 'نقش', 'Peranan', 'పాత్ర', 'பங்கு', 'ભૂમિકા', 'Rola', 'Роль', 'ਭੂਮਿਕਾ', 'Rol', 'အခန်းက္ပ', 'Ipa', 'Matsayi'),
(38, 'user_role', 'User Role', 'ব্যবহারকারীর ভূমিকা', 'Rol del usuario', 'دور المستخدم', 'उपयोगकर्ता भूमिका', 'صارف کردار', '用户角色', 'ユーザーロール', 'Papel do usuário', 'Роль пользователя', 'Rôle dutilisateur', '사용자 역할', 'Benutzer-Rolle', 'Ruolo utente', 'บทบาทผู้ใช้', 'Felhasználói szerepkör', 'Gebruikersrol', 'User Partes', 'Peran pengguna', 'Kullanıcı rolü', 'Ρόλος χρήστη', 'نقش کاربر', 'Peranan Pengguna', 'వాడుకరి పాత్ర', 'பயனர் பங்கு', 'વપરાશકર્તા ભૂમિકા', 'Rola użytkownika', 'Роль користувача', 'ਯੂਜ਼ਰ ਭੂਮਿਕਾ', 'Rolul utilizatorului', 'အသုံးပြုသူအခန်းက္ပ', 'Išẹ Olumulo', 'Mai amfani'),
(39, 'role_permission', 'Role Permission', 'ভূমিকা অনুমতি', 'Permiso de función', 'إذن الدور', 'भूमिका अनुमति', 'کردار کی اجازت', '角色权限', '役割の許可', 'Permissão de papel', 'Ролевое разрешение', 'Permission de rôle', '역할 권한', 'Rollenberechtigungen', 'Permesso di ruolo', 'การอนุญาตบทบาท', 'Szerepengedély', 'Roltoestemming', 'Licet munus', 'Perizinan Peran', 'Rol İzni', 'Άδεια ρόλου', 'نقش مجاز', 'Kebenaran Peranan', 'పాత్ర అనుమతి', 'பங்கு அனுமதி', 'ભૂમિકા પરવાનગી', 'Zezwolenie na role', 'Ролевий дозвіл', 'ਭੂਮਿਕਾ ਦੀ ਅਨੁਮਤੀ', 'Permisiune pentru roluri', 'အခန်းက္ပခွင့်ပြုချက်', 'Igbese ipa', 'Yarjejeniyar aiki'),
(40, 'reset_password', 'Reset Password', 'পাসওয়ার্ড রিসেট', 'Restablecer la contraseña', 'إعادة تعيين كلمة المرور', 'पासवर्ड रीसेट', 'پاس ورڈ ری سیٹ', '重设密码', 'パスワードを再設定する', 'Redefinir Senha', 'Сброс пароля', 'réinitialiser le mot de passe', '암호를 재설정', 'Passwort zurücksetzen', 'Resetta la password', 'รีเซ็ตรหัสผ่าน', 'Jelszó visszaállítása', 'Reset wachtwoord', 'Reset password', 'Reset Password', 'Şifreyi yenile', 'Επαναφέρετε τον κωδικό πρόσβασης', 'بازنشانی گذرواژه', 'Menetapkan semula kata laluan', 'రహస్యపదాన్ని మార్చుకోండి', 'கடவுச்சொல்லை மீட்டமைக்க', 'પાસવર્ડ ફરીથી સેટ કરો', 'Zresetuj hasło', 'Скинути пароль', 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰੋ', 'Reseteaza parola', 'လျှို့ဝှတ်နံပါတ်အားမူလအတိုင်းပြန်လုပ်သည်', 'Atunwo Ọrọigbaniwọle', 'Sake saita kalmar sirri'),
(41, 'reset_user_password', 'Reset User Password', 'ব্যবহারকারী পাসওয়ার্ড রিসেট', 'Restablecer contraseña de usuario', 'إعادة تعيين كلمة مرور المستخدم', 'उपयोगकर्ता पासवर्ड रीसेट करें', 'صارف کا پاس ورڈ ری سیٹ کریں', '重置用户密码', 'ユーザパスワードをリセットする', 'Redefinir Senha do Usuário', 'Сбросить пароль пользователя', 'Réinitialiser mot de passe', '사용자 암호 재설정', 'Benutzerpasswort zurücksetzen', 'Reimposta password utente', 'รีเซ็ตรหัสผ่านผู้ใช้', 'Felhasználói jelszó visszaállítása', 'Reset gebruikerswachtwoord', 'User Password Reset', 'Reset Password Pengguna', 'Kullanıcı Parolasını Sıfırla', 'Επαναφορά κωδικού χρήστη', 'تنظیم مجدد رمز عبور کاربر', 'Tetapkan semula Kata Laluan Pengguna', 'యూజర్ పాస్వర్డ్ను రీసెట్ చేయండి', 'பயனர் கடவுச்சொல்லை மீட்டமைக்கவும்', 'વપરાશકર્તા પાસવર્ડ ફરીથી સેટ કરો', 'Zresetuj hasło użytkownika', 'Скинути пароль користувача', 'ਯੂਜ਼ਰ ਪਾਸਵਰਡ ਰੀਸੈਟ ਕਰੋ', 'Resetați parola de utilizator', 'အသုံးပြုသူ Password ကို Reset', 'Atunto Ọrọ Olumulo Titun', 'Sake saitin Kalmar Mai amfani'),
(42, 'backup', 'Backup', 'ব্যাকআপ', 'Apoyo', 'دعم', 'बैकअप', 'بیک اپ', '备用', 'バックアップ', 'Cópia de segurança', 'Резервное копирование', 'Sauvegarde', '지원', 'Backup', 'di riserva', 'การสำรองข้อมูล', 'biztonsági mentés', 'backup', 'tergum', 'Backup', 'yedek', 'Αντιγράφων ασφαλείας', 'پشتیبان گیری', 'Sandaran', 'బ్యాకప్', 'காப்பு', 'બેકઅપ', 'Utworzyć kopię zapasową', 'Резервне копіювання', 'ਬੈਕਅਪ', 'Backup', 'Backup ကို', 'Afẹyinti', 'Ajiyayyen'),
(43, 'human_resource', 'Human Resource', 'মানব সম্পদ', 'Recursos humanos', 'الموارد البشرية', 'मानव संसाधन', 'انسانی وسائل', '人力资源', '人的資源', 'Recursos humanos', 'Человеческие ресурсы', 'Ressource humaine', '인적 자원', 'Personal', 'Risorse umane', 'ทรัพยากรบุคคล', 'Emberi erőforrás', 'Human Resource', 'Humanum Resource', 'Sumber daya manusia', 'İnsan kaynakları', 'Ανθρώπινο δυναμικό', 'منابع انسانی', 'Sumber Manusia', 'మానవ వనరుల', 'மனித வளம்', 'માનવ સંસાધન', 'Zasoby ludzkie', 'Людський ресурс', 'ਮਾਨਵ ਸੰਸਾਧਨ', 'Resurse umane', 'လူ့စွမ်းအားအရင်းအမြစ်', 'Eda eniyan', 'Human Resource'),
(44, 'designation', 'Designation', 'পদবি', 'Designacion', 'تعيين', 'पद', 'عہدہ', '指定', '指定', 'Designação', 'обозначение', 'La désignation', '지정', 'Bezeichnung', 'Designazione', 'การแต่งตั้ง', 'Kijelölés', 'Aanwijzing', 'designatio', 'Penunjukan', 'tayin', 'Ονομασία', 'تعیین', 'Jawatan', 'హోదా', 'பதவி', 'હોદ્દો', 'Przeznaczenie', 'Позначення', 'ਅਹੁਦਾ', 'Desemnare', 'သတ်မှတ်ရေး', 'Ipilẹṣẹ', 'Dama'),
(45, 'employee', 'Employee', 'কর্মচারী', 'Empleado', 'موظف', 'कर्मचारी', 'ملازم', '雇员', '従業員', 'Empregado', 'Наемный рабочий', 'Employé', '종업원', 'Mitarbeiter', 'Dipendente', 'ลูกจ้าง', 'Munkavállaló', 'Werknemer', 'Aliquam', 'Karyawan', 'işçi', 'Υπάλληλος', 'کارمند', 'Pekerja', 'ఉద్యోగి', 'பணியாளர்', 'કર્મચારી', 'Pracownik', 'Працівник', 'ਕਰਮਚਾਰੀ', 'Angajat', 'လုပ်သား', 'Abáni', 'Maaikaci'),
(46, 'teacher', 'Teacher', 'শিক্ষক', 'Profesor', 'مدرس', 'अध्यापक', 'استاد', '老师', '先生', 'Professor', 'учитель', 'Prof', '선생', 'Lehrer', 'Insegnante', 'ครู', 'Tanár', 'Leraar', 'magister', 'Guru', 'Öğretmen', 'Δάσκαλος', 'معلم', 'Guru', 'టీచర్', 'ஆசிரியர்', 'શિક્ષક', 'Nauczyciel', 'Вчитель', 'ਟੀਚਰ', 'Profesor', 'ဆရာမ', 'Olùkọ', 'Malam'),
(47, 'class', 'Class', 'শ্রেণী', 'Clase', 'صف دراسي', 'कक्षा', 'کلاس', '类', 'クラス', 'Classe', 'Класс', 'Classe', '수업', 'Klasse', 'Classe', 'ชั้น', 'Osztály', 'Klasse', 'genus', 'Kelas', 'Sınıf', 'Τάξη', 'کلاس', 'Kelas', 'క్లాస్', 'வர்க்கம்', 'વર્ગ', 'Klasa', 'Клас', 'ਕਲਾਸ', 'Clasă', 'အတန်းအစား', 'Kilasi', 'Class'),
(48, 'section', 'Section', 'শাখা', 'Sección', 'الجزء', 'अनुभाग', 'سیکشن', '部分', 'セクション', 'Seção', 'Раздел', 'Section', '섹션', 'Sektion', 'Sezione', 'มาตรา', 'Szakasz', 'Sectie', 'sectioni', 'Bagian', 'Bölüm', 'Ενότητα', 'بخش D', 'Seksyen', 'విభాగం', 'பிரிவு', 'વિભાગ', 'Sekcja', 'Розділ', 'ਅਨੁਭਾਗ', 'Secțiune', 'အပိုင်း', 'Abala', 'Sashi'),
(49, 'subject', 'Subject', 'বিষয়', 'Tema', 'موضوع', 'विषय', 'مضمون', '学科', '件名', 'Subject', 'Предмет', 'assujettir', '제목', 'Gegenstand', ' Soggetto', 'เรื่อง', 'Tantárgy', 'Onderwerpen', 'subject', 'Subyek', 'konu', 'Θέμα', 'موضوع', 'Subjek', 'విషయం', 'பொருள்', 'વિષય', 'Przedmiot', 'Тема', 'ਵਿਸ਼ਾ', 'Subiect', 'ဘာသာရပ်', 'Koko-ọrọ', 'Subject'),
(50, 'syllabus', 'Syllabus', 'পাঠ্যক্রম', 'Silaba', 'المنهج', 'पाठ्यक्रम', 'نصاب', '教学大纲', 'シラバス', 'Programa de Estudos', 'Учебный план', 'Programme', '강의 계획서', 'Lehrplan', 'Programma', 'หลักสูตร', 'Tanmenet', 'Syllabus', 'Syllabus', 'Silabus', 'Müfredat', 'Περίληψη', 'سرفصل دروس', 'Silibus', 'సిలబస్', 'பாடத்திட்டங்கள்', 'અભ્યાસક્રમ', 'Konspekt', 'Силабус', 'ਸਿਲੇਬਸ', 'Silabă', 'သင်ရိုးညွှန်းတမ်း', 'Syllabus', 'Syllabus'),
(51, 'routine', 'Routine', 'রূটিন', 'Rutina', 'نمط', 'सामान्य', 'معمول', '常规', 'ルーチン', 'Rotina', 'рутинный', 'Routine', '루틴', 'Routine', 'Routine', 'กิจวัตรประจำวัน', 'Rutin', 'Routine', 'exercitatione', 'Rutin', 'Rutin', 'Ρουτίνα', 'معمولی', 'Rutin', 'రొటీన్', 'வழக்கமான', 'નિયમિત', 'Rutyna', 'Звичайний', 'ਰੁਟੀਨ', 'Rutină', 'လုပ်ရိုးလုပ်စဉ်', 'Ilana', 'Gyara'),
(52, 'guardian', 'Guardian', 'অভিভাবক', 'guardián', 'وصي', 'अभिभावक', 'سرپرست', '监护人', 'ガーディアン', 'Guardião', 'блюститель', 'Gardien', '보호자', 'Wächter', 'Custode', 'ผู้ปกครอง', 'Gyám', 'Voogd', 'custos', 'Wali', 'Gardiyan', 'Κηδεμόνας', 'نگهبان', 'Guardian', 'సంరక్షకుడు', 'கார்டியன்', 'ગાર્ડિયન', 'Opiekun', 'Опікун', 'ਗਾਰਡੀਅਨ', 'paznic', 'ဂေါကလူကြီး', 'Oluṣọ', 'Guardian'),
(53, 'student', 'Student', 'ছাত্র', 'Estudiante', 'طالب علم', 'छात्र', 'طالب علم', '学生', '学生', 'Aluna', 'Студент', 'Étudiant', '학생', 'Schüler', 'Alunno', 'นักเรียน', 'Diák', 'Student', 'Discipulus', 'Mahasiswa', 'Öğrenci', 'Μαθητης σχολειου', 'دانشجو', 'Pelajar', 'విద్యార్థి', 'மாணவர்', 'વિદ્યાર્થી', 'Student', 'Студентка', 'ਵਿਦਿਆਰਥੀ', 'Student', 'ကြောငျးသား', 'Ọmọ-iwe', 'Student'),
(54, 'admit', 'Admit', 'ভর্তি', 'Admitir', 'يعترف', 'स्वीकार करना', 'تسلیم', '承认', '認める', 'Admitem', 'Признавать', 'Admettre', '들이다', 'Eingestehen', 'Ammettere', 'ยอมรับ', 'Beismerni', 'Toegeven', 'fateri', 'Mengakui', 'Kabul et', 'Ομολογώ', 'اقرار کردن', 'Mengaku', 'ఒప్పుకుంటే', 'ஒப்புக்கொள்ள', 'સ્વીકાર્યું', 'Przyznać', 'Приймати', 'ਸਵੀਕਾਰ ਕਰੋ', 'admite', 'ဖွောငျ့ဆို', 'Gba', 'Shiga'),
(55, 'attendance', 'Attendance', 'উপস্থিতি', 'Asistencia', 'الحضور', 'उपस्थिति', 'حاضری', '勤', '出席', 'Comparecimento', 'посещаемость', 'Présence', '출석', 'Teilnahme', 'partecipazione', 'การดูแลรักษา', 'Részvétel', 'opkomst', 'attendance', 'Kehadiran', 'katılım', 'Παρουσία', 'حضور', 'Kehadiran', 'హాజరు', 'வருகை', 'હાજરી', 'Frekwencja', 'Відвідуваність', 'ਹਾਜ਼ਰੀ', 'prezență', 'တက်ရောက်သူ', 'Wiwa', 'Ziyarci'),
(56, 'assignment', 'Assignment', 'এসাইনমেন্ট', 'Asignación', 'مهمة', 'असाइनमेंट', 'تفویض', '分配', '割り当て', 'Tarefa', 'присваивание', 'Affectation', '할당', 'Zuordnung', 'assegnazione', 'การมอบหมาย', 'Feladat', 'toewijzing', 'assignment', 'Tugas', 'atama', 'ΑΝΑΘΕΣΗ ΕΡΓΑΣΙΑΣ', 'وظیفه', 'tugasan', 'అసైన్మెంట్', 'வேலையை', 'સોંપણી', 'Zadanie', 'Назначення', 'ਅਸਾਈਨਮੈਂਟ', 'Misiune', 'တာဝန်ကျတဲ့နေရာ', 'Ifiranṣẹ', 'Matsayi'),
(57, 'submission', 'Submission', 'সাব্মিশন', 'Sumisión', 'تسليم', 'प्रस्तुत करने', 'جمع کرانے', '服从', '提出', 'Submissão', 'представление', 'Soumission', '제출', 'Einreichung', 'Sottomissione', 'ส่ง', 'Benyújtás', 'Voorlegging', 'submission', 'pengajuan', 'boyun eğme', 'Υποβολή', 'ارسال', 'Penyerahan', 'సమర్పణ', 'சமர்ப்பிக்கும்', 'રજૂઆત', 'Uległość', 'Подання', 'ਸਬਮਿਸ਼ਨ', 'supunere', 'နားထောင်ခြင်း', 'Iwawe', 'Shiga'),
(58, 'exam', 'Exam', 'পরীক্ষা', 'Examen', 'امتحان', 'परीक्षा', 'امتحان', '考试', '試験', 'Exame', 'Экзамен', 'Examen', '시험', 'Prüfung', 'Esame', 'การสอบ', 'Vizsga', 'tentamen', 'nito', 'Ujian', 'sınav', 'Εξέταση', 'امتحان', 'Peperiksaan', 'పరీక్షా', 'தேர்வு', 'પરીક્ષા', 'Egzamin', 'Іспит', 'ਪ੍ਰੀਖਿਆ', 'Examen', 'စာမေးပွဲ', 'Idanwo', 'Binciken'),
(59, 'exam_grade', 'Exam Grade', 'পরীক্ষার গ্রেড', 'Examen de grado', 'امتحان الصف', 'परीक्षा ग्रेड', 'امتحان گریڈ', '考试成绩', '試験グレード', 'Nota da prova', 'Экзамен', 'Grade dexamen', '시험 성적', 'Prüfungsnote', 'Voto desame', 'ระดับการสอบ', 'Vizsga fokozat', 'Examencijfer', 'Romani nito', 'Kelas ujian', 'Sınav Notu', 'Βαθμό εξετάσεων', 'درجه آزمون', 'Gred Peperiksaan', 'పరీక్ష గ్రేడ్', 'தேர்வு தரம்', 'પરીક્ષા ગ્રેડ', 'Stopień egzaminu', 'Ступінь іспиту', 'ਐਜੂਕੇਸ਼ਨ ਗ੍ਰੇਡ', 'Gradul de examen', 'စာမေးပွဲအဆင့်', 'Ayẹwo Ipele', 'Binciken Nazari'),
(60, 'exam_term', 'Exam Term', 'পরীক্ষা টার্ম', 'Plazo del examen', 'مدة الامتحان', 'परीक्षा की अवधि', 'امتحان کی مدت', '考试期限', '試験期間', 'Termo do Exame', 'Срок действия экзамена', 'Terme dexamen', '시험 기간', 'Prüfungsdauer', 'Termine desame', 'เงื่อนไขการสอบ', 'Vizsgaidőszak', 'Examen termijn', 'Term nito', 'Ujian Term', 'Sınav Terimi', 'Όρος Εξέτασης', 'شرایط آزمون', 'Tempoh Peperiksaan', 'పరీక్షా టర్మ్', 'தேர்வு கால', 'પરીક્ષાની મુદત', 'Okres egzaminacyjny', 'Термін екзамену', 'ਪ੍ਰੀਖਿਆ ਮਿਆਦ', 'Termen de examinare', 'စာမေးပွဲ Term', 'Ayewo Aago', 'Tambaya'),
(61, 'schedule', 'Schedule', 'সময়সূচী', 'Programar', 'جدول', 'अनुसूची', 'شیڈول', '时间表', 'スケジュール', 'Cronograma', 'График', 'Programme', '시간표', 'Zeitplan', 'Programma', 'ตารางเวลา', 'Menetrend', 'Planning', 'schedule', 'Susunan acara', 'program', 'Πρόγραμμα', 'برنامه', 'Jadual', 'షెడ్యూల్', 'அட்டவணை', 'સૂચિ', 'Harmonogram', 'Розклад', 'ਸਮਾਸੂਚੀ, ਕਾਰਜ - ਕ੍ਰਮ', 'Programa', 'ဇယား', 'Iṣeto', 'Jadawalin'),
(62, 'suggestion', 'Suggestion', 'সাজেশন', 'Sugerencia', 'اقتراح', 'सुझाव', 'مشورہ', '建议', '提案', 'Sugestão', 'Предложение', 'Suggestion', '암시', 'Vorschlag', 'Suggerimento', 'ข้อเสนอแนะ', 'Javaslat', 'Suggestie', 'suggestion', 'Saran', 'Öneri', 'Πρόταση', 'پیشنهادی', 'Cadangan', 'సూచన', 'பரிந்துரை', 'સૂચન', 'Sugestia', 'Пропозиція', 'ਸੁਝਾਅ', 'Sugestie', 'အကြံပေးချက်', 'Abajade', 'Shawarwarin'),
(63, 'exam_mark', 'Exam Mark', 'পরীক্ষা মার্ক', 'Marca de examen', 'علامة الامتحان', 'परीक्षा चिन्ह', 'امتحان مارک', '考试标志', '試験のマーク', 'Marca de exame', 'Экзамен Mark', 'Marque dexamen', '시험 마크', 'Prüfzeichen', 'Segno dellesame', 'เครื่องหมายการสอบ', 'Vizsga Mark', 'Examenmarkering', 'Mark nito', 'Tanda ujian', 'Sınav işareti', 'Εξετάσεων Εξετάσεων', 'علامت امتحان', 'Ujian Mark', 'పరీక్ష మార్క్', 'தேர்வு மார்க்', 'પરીક્ષા માર્ક', 'Znak egzaminu', 'Екзаменаційний знак', 'ਐਜੂਕੇਸ਼ਨ ਮਾਰਕ', 'Exam Mark', 'စာမေးပွဲမာကု', 'Aami ayẹwo', 'Alamar Duba'),
(64, 'mark_sheet', 'Mark Sheet', 'নাম্বার শিট', 'Hoja de marca', 'علامة ورقة', 'अंक तालिका', 'مارک شیٹ', '标记表', 'マークシート', 'Marca Folha', 'Mark Sheet', 'Feuille de marque', '마크 시트', 'Markierungsblatt', 'Libretto universitario', 'ทำเครื่องหมายแผ่นงาน', 'Mark Sheet', 'Mark Sheet', 'Mark Sheet', 'Lembar penilaian', 'Mark Levha', 'Φυλλάδιο απαντήσεων', 'برگه مارک', 'Mark Sheet', 'గణాంకాల పట్టి', 'மதிப்பீட்டு தாள்', 'માર્ક શીટ', 'Arkusz ocen', 'Марк Лист', 'ਮਾਰਕ ਸ਼ੀਟ', 'Marcați foaia', 'မာကုစာရွက်', 'Samisi iwe', 'Mark Sheet'),
(65, 'exam_final_result', 'Exam Final Result', 'পরীক্ষার ফাইনাল ফলাফল', 'Resultado final del examen', 'النتيجة النهائية للامتحان', 'परीक्षा अंतिम परिणाम', 'امتحان کے حتمی نتیجہ', '考试最终结果', '試験最終結果', 'Resultado Final do Exame', 'Экзамен Окончательный результат', 'Résultat final de lexamen', '시험 최종 결과', 'Abschluss der Prüfung', 'Esame Risultato finale', 'ผลสอบปลายภาค', 'Vizsga végeredmény', 'Examen Eindresultaat', 'Nito captorum eventus superae', 'Hasil Ujian Akhir Ujian', 'Sınav Sonucu', 'Τελικό αποτέλεσμα εξέτασης', 'نتیجه نهایی آزمون', 'Keputusan Akhir Peperiksaan', 'పరీక్ష ఫలితం', 'தேர்வு இறுதி முடிவு', 'પરીક્ષા અંતિમ પરિણામ', 'Egzamin Wynik końcowy', 'Останній результат іспиту', 'ਪ੍ਰੀਖਿਆ ਅੰਤਿਮ ਨਤੀਜੇ', 'Examen Rezultat final', 'စာမေးပွဲနောက်ဆုံးရလဒ်', 'Ipari ipari ikẹhin', 'Binciken Ƙarshe na Ƙarshe'),
(66, 'result', 'Result', 'পরীক্ষার ফলাফল', 'Resultado', 'نتيجة', 'परिणाम', 'نتیجہ', '结果', '結果', 'Resultado', 'результат', 'Résultat', '결과', 'Ergebnis', 'Risultato', 'ผล', 'Eredmény', 'Resultaat', 'exitum', 'Hasil', 'Sonuç', 'Αποτέλεσμα', 'نتیجه', 'Keputusan', 'ఫలితం', 'விளைவாக', 'પરિણામ', 'Wynik', 'Результат', 'ਨਤੀਜਾ', 'Rezultat', 'ရလဒ်', 'Esi', 'Sakamako'),
(67, 'send', 'Send', 'প্রেরণ', 'Enviar', 'إرسال', 'भेजना', 'بھیجیں', '发送', '送信', 'Enviar', 'послать', 'Envoyer', '보내다', 'Senden', 'Inviare', 'ส่ง', 'Elküld', 'Sturen', 'Mitte', 'Kirim', 'göndermek', 'Στείλετε', 'ارسال', 'Hantar', 'పంపండి', 'அனுப்பு', 'મોકલો', 'Wysłać', 'Відправити', 'ਭੇਜੋ', 'Trimite', 'ပေးပို့', 'Firanṣẹ', 'Aika'),
(68, 'mark_send_by_sms', 'Mark send by SMS', 'মার্ক পাঠান এসএমএস দিয়ে', 'Marca enviar por SMS', 'علامة إرسال عن طريق الرسائل القصيرة', 'एसएमएस द्वारा भेजें भेजें', 'ایس ایم ایس کے ذریعہ بھیجیں', '标记通过短信发送', 'SMSでマークする', 'Marcar enviar por SMS', 'Отметить отправку по SMS', 'Mark envoyer par SMS', 'SMS로 보내기 표시', 'Markiere per SMS', 'Mark invia tramite SMS', 'ทำเครื่องหมายว่าส่งทาง SMS', 'Jelölje be SMS-ben', 'Markeer per sms', 'Mark a mittere SMS', 'Tandai kirim melalui SMS', 'SMS ile gönderiyi işaretle', 'Σημειώστε την αποστολή μέσω SMS', 'علامت گذاری به عنوان خوانده شده توسط SMS', 'Tandakan hantar melalui SMS', 'SMS ద్వారా మార్క్ పంపండి', 'SMS மூலம் அனுப்பவும்', 'એસએમએસ દ્વારા મોકલો માર્ક કરો', 'Oznacz, wyślij przez SMS', 'Марк відправити SMS', 'ਐਸਐਮਐਸ ਦੁਆਰਾ ਭੇਜੋ ਮਾਰਕ ਕਰੋ', 'Marcare trimite prin SMS', 'မာကုကို SMS ဖွငျ့ပေးပို့', 'Samisi firanṣẹ nipasẹ SMS', 'Alama aika ta SMS'),
(69, 'mark_send_by_email', 'Mark send by Email', 'মার্ক পাঠান ইমেইল দিয়ে', 'Marcar enviar por correo electrónico', 'علامة إرسال عن طريق البريد الإلكتروني', 'ईमेल द्वारा भेजें मार्क', 'ایس ایم ایس کے ذریعہ بھیجیں', '用电子邮件标记发送', '電子メールで送信する', 'Marcar enviar por e-mail', 'Марк отправить по электронной почте', 'Mark envoyer par Email', '전자 메일로 보내기 표시', 'Markiere per Email', 'Mark invia tramite e-mail', 'มาร์คส่งทางอีเมล', 'A feliratkozás e-mailben történik', 'Markeer per e-mail', 'Email a Mark mittere', 'Tandai kirim melalui Email', 'E-postayla gönderi işaretle', 'Σημειώστε στείλτε με Email', 'علامت گذاری به عنوان ارسال از طریق ایمیل', 'Tandakan hantar melalui E-mel', 'ఇమెయిల్ ద్వారా మార్క్ పంపండి', 'மின்னஞ்சல் மூலம் அனுப்பவும்', 'ઇમેઇલ દ્વારા મોકલો માર્ક કરો', 'Zaznacz Wyślij przez e-mail', 'Позначити відправити по електронній пошті', 'ਈਮੇਲ ਦੁਆਰਾ ਭੇਜੋ ਮਾਰਕ ਕਰੋ', 'Marcați trimiteți prin e-mail', 'မာကုအီးမေးလ်ပေးပို့', 'Samisi firanṣẹ nipasẹ Imeeli', 'Alama aika ta Imel'),
(70, 'promotion', 'Promotion', 'প্রমোশন', 'Promoción', 'ترقية وظيفية', 'पदोन्नति', 'فروغ', '提升', 'プロモーション', 'Promoção', 'Продвижение', 'Promotion', '승진', 'Beförderung', 'Promozione', 'การส่งเสริม', 'promóció', 'Bevordering', 'promotio', 'Promosi', 'tanıtım', 'Προβολή', 'ترفیع', 'Promosi', 'ప్రమోషన్', 'பதவி உயர்வு', 'પ્રોત્સાહન', 'Awans', 'Просування', 'ਪ੍ਰੋਮੋਸ਼ਨ', 'Promovare', 'ရာထူးတိုးမြှင့်ပေးခြင်း', 'Igbega', 'Shawarwarin'),
(71, 'library', 'Library', 'গ্রন্থাগার', 'Biblioteca', 'مكتبة', 'पुस्तकालय', 'لائبریری', '图书馆', 'としょうかん', 'Biblioteca', 'Библиотека', 'Bibliothèque', '도서관', 'Bibliothek', 'Biblioteca', 'ห้องสมุด', 'Könyvtár', 'Bibliotheek', 'Bibliotheca', 'Perpustakaan', 'Kütüphane', 'Βιβλιοθήκη', 'کتابخانه', 'Perpustakaan', 'లైబ్రరీ', 'நூலகம்', 'પુસ્તકાલય', 'Biblioteka', 'Бібліотека', 'ਲਾਇਬ੍ਰੇਰੀ', 'Bibliotecă', 'စာကြည့်တိုက်', 'Iwadi', 'Library'),
(72, 'book', 'Book', 'বই', 'Libro', 'كتاب', 'किताब', 'کتاب', '书', '本', 'Livro', 'Книга', 'Livre', '도서', 'Buch', 'Libro', 'หนังสือ', 'Könyv', 'Boek', 'liber', 'Book', 'Kitap', 'Βιβλίο', 'کتاب', 'Buku', 'పుస్తకం', 'புத்தக', 'પુસ્તક', 'Książka', 'Книга', 'ਬੁੱਕ', 'Carte', 'စာအုပ်', 'Iwe', 'Littafin'),
(73, 'member', 'Member', 'সদস্য', 'Miembro', 'عضو', 'सदस्य', 'رکن', '会员', 'メンバー', 'Membro', 'член', 'Membre', '회원', 'Mitglied', 'Membro', 'สมาชิก', 'Tag', 'Lid', 'socius', 'Anggota', 'üye', 'Μέλος', 'عضو', 'Ahli', 'సభ్యుడు', 'உறுப்பினர்', 'સભ્ય', 'Członek', 'Член', 'ਸਦੱਸ', 'Membru', 'အဖှဲ့ဝငျ', 'Ẹgbẹ', 'Memba'),
(74, 'issue_and_return', 'Issue & Return', 'ইস্যু এবং রিটার্ন', 'Emisión y devolución', 'الإصدار والعودة', 'अंक और वापसी', 'مسئلہ اور واپسی', '问题和回报', '問題とリターン', 'Problema e retorno', 'Проблема и возврат', 'Emission et retour', '이슈와 리턴', 'Problem und Rückgabe', 'Problema e ritorno', 'การออกและการคืนสินค้า', 'Kiadás és visszatérés', 'Probleem en terugkeer', 'Et exitus Redi', 'Isu dan Kembali', 'Sayı ve İade', 'Έκδοση και επιστροφή', 'مسئله و بازگشت', 'Isu dan Pulangan', 'ఇష్యూ మరియు రిటర్న్', 'வெளியீடு மற்றும் திரும்ப', 'ઇશ્યૂ અને રીટર્ન', 'Wydanie i zwrot', 'Проблема та повернення', 'ਇਸ਼ੂ ਅਤੇ ਵਾਪਸੀ', 'Eliberare și returnare', 'ပြဿနာများနှင့်ပြန်သွား', 'Oro ati Pada', 'Isar da Komawa'),
(75, 'issue', 'Issue', 'ইস্যু', 'Emisión y devolución...', 'القضية', 'मुद्दा', 'مسئلہ', '问题', '問題', 'Questão', 'вопрос', 'Problème', '발행물', 'Problem', 'Problema', 'ปัญหา', 'Probléma', 'Kwestie', 'exitus', 'Isu', 'Konu', 'Θέμα', 'موضوع', 'Isu', 'సమస్య', 'பிரச்சினை', 'મુદ્દો', 'Kwestia', 'Проблема', 'ਮੁੱਦੇ', 'Problema', 'ထုတ်ပြန်သည်', 'Oro naa', 'Matsalar'),
(76, 'return', 'Return', 'রিটার্ন করা হয়েছে', 'Regreso', 'إرجاع', 'वापसी', 'واپس لو', '返回', '戻る', 'Retorna', 'Вернуть', 'Revenir', '반환', 'Rückkehr', 'Ritorno', 'กลับ', 'Visszatérés', 'terugkeer', 'Redi', 'Kembali', 'Dönüş', 'ΕΠΙΣΤΡΟΦΗ', 'برگشت', 'Kembali', 'రిటర్న్', 'திரும்ப', 'પાછા આવો', 'Powrót', 'Повернення', 'ਵਾਪਸੀ', 'Întoarcere', 'ပြန်လာ', 'Pada', 'Komawa'),
(77, 'issue_date', 'Issue Date', 'ইস্যু তারিখ', 'Fecha de asunto', 'تاريخ الاصدار', 'जारी करने की तिथि', 'تاریخ اجراء', '发行日期', '発行日', 'Data de emissão', 'Дата выпуска', 'Date démission', '발행일', 'Ausgabedatum', 'Data di rilascio', 'วันที่ออก', 'Kiadás dátuma', 'Datum van publicatie', 'exitus Date', 'Tanggal pembuatan', 'Veriliş tarihi', 'Ημερομηνία έκδοσης', 'تاریخ انتشار', 'Tarikh Keluaran', 'జారి చేయు తేది', 'வெளியீட்டு தேதி', 'અંક તારીખ', 'Data wydania', 'Дата випуску', 'ਜਾਰੀ ਕਰਨ ਦੀ ਮਿਤੀ', 'Data emiterii', 'ထုတ်ပြန်ရက်စွဲ', 'Ọjọ itẹjade', 'Isowar ranar'),
(78, 'due_date', 'Due Date', 'নির্দিষ্ট তারিখ', 'Fecha de vencimiento', 'تاريخ الاستحقاق', 'नियत तारीख', 'اخری تاریخ', '截止日期', '期日', 'Data de Vencimento', 'Срок', 'Date déchéance', '마감일', 'Geburtstermin', 'Scadenza', 'Due Date', 'Esedékesség', 'Opleveringsdatum', 'ob Date', 'Batas tanggal terakhir', 'Bitiş tarihi', 'Ημερομηνία λήξης', 'تاریخ تحویل', 'Tarikh Gagal', 'గడువు తేది', 'தேதி தேதி', 'નિયત તારીખ', 'Termin płatności', 'Термін сплати', 'ਅਦਾਇਗੀ ਤਾਰੀਖ', 'Data scadentă', 'နောက်ဆုံးရက်', 'Asiko to ba to', 'Kwanan wata'),
(79, 'return_date', 'Return Date', 'রিটার্ন তারিখ', 'Fecha de regreso', 'تاريخ العودة', 'वापसी की तिथि', 'واپسی کی تاریخ', '归期', '返却日', 'Data de retorno', 'Дата возврата', 'Date de retour', '반환 기일', 'Rückflugdatum', 'Data di ritorno', 'วันที่กลับ', 'Visszatérítési dátum', 'Retourdatum', 'Redi Date', 'Tanggal pengembalian', 'Dönüş tarihi', 'Ημερομηνία επιστροφής', 'تاریخ بازگشت', 'Tarikh Pulang', 'తిరిగి వచ్చు తేదీ', 'திரும்ப தேதி', 'રીટર્ન તારીખ', 'Data powrotu', 'Дата повернення', 'ਵਾਪਸੀ ਦੀ ਤਾਰੀਖ', 'Data retur', 'သို့ပြန်သွားသည်နေ့စွဲ', 'Ọjọ pada', 'Ranar Koma'),
(80, 'new_issue', 'New Issue', 'নতুন ইস্যু', 'Nueva edición', 'مشكلة جديدة', 'नया मुद्दा', 'نیا مسئلہ', '新问题', '新しい問題', 'Novo problema', 'Новый выпуск', 'Nouveau numéro', '새로운 문제', 'Neues Problem', 'Nuovo problema', 'ฉบับใหม่', 'Új probléma', 'Nieuw probleem', 'New issue', 'Isu Baru', 'Yeni baskı', 'ΝΕΟ ΘΕΜΑ', 'مسئله جدید', 'Isu Baru', 'కొత్త సంచిక', 'புதிய வெளியீடு', 'નવું અંક', 'Nowy problem', 'Новий випуск', 'ਨਵਾਂ ਮਸਲਾ', 'Problemă nouă', 'နယူး Issue', 'Oro tuntun', 'Sabon Tambaya'),
(81, 'transport', 'Transport', 'পরিবহন', 'Transporte', 'المواصلات', 'ट्रांसपोर्ट', 'نقل و حمل', '运输', '輸送', 'Transporte', 'Транспорт', 'Transport', '수송', 'Transport', 'Trasporto', 'ขนส่ง', 'Szállítás', 'Vervoer', 'onerariis', 'Mengangkut', 'taşıma', 'Μεταφορά', 'حمل و نقل', 'Pengangkutan', 'రవాణా', 'போக்குவரத்து', 'પરિવહન', 'Transport', 'Транспорт', 'ਟ੍ਰਾਂਸਪੋਰਟ', 'Transport', 'တင်ဆောင်', 'Ọkọ', 'Mota'),
(82, 'vehicle', 'Vehicle', 'গাড়ী', 'Transporte...', 'مركبة', 'वाहन', 'گاڑی', '车辆', '車両', 'Veículo', 'Средство передвижения', 'Véhicule', '차량', 'Fahrzeug', 'Veicolo', 'พาหนะ', 'Jármű', 'Voertuig', 'vehiculum', 'Kendaraan', 'araç', 'Οχημα', 'وسیله نقلیه', 'Kenderaan', 'వాహనం', 'வாகன', 'વાહન', 'Pojazd', 'Автомобіль', 'ਵਾਹਨ', 'Vehicul', 'ယာဉ်', 'Ọkọ', 'Mota'),
(83, 'transport_route', 'Transport Route', 'পরিবহন রাস্তা', 'Ruta de transporte', 'طريق النقل', 'परिवहन मार्ग', 'ٹرانسپورٹ کا راستہ', '运输路线', '輸送ルート', 'Rota dos transportes', 'Транспортный маршрут', 'Route de transport', '운송 경로', 'Transportweg', 'Itinerario di trasporto', 'เส้นทางคมนาคม', 'Szállítási útvonal', 'Transportroute', 'Iter itineris onerariam', 'Rute transportasi', 'Ulaşım Güzergahı', 'Διαδρομή μεταφοράς', 'مسیر حمل و نقل', 'Laluan Pengangkutan', 'రవాణా మార్గం', 'போக்குவரத்து பாதை', 'પરિવહન માર્ગ', 'Szlak transportowy', 'Транспортний маршрут', 'ਟ੍ਰਾਂਸਪੋਰਟ ਰੂਟ', 'Traseul de transport', 'ပို့ဆောင်ရေးလမ်းကြောင်း', 'Ọna itọsọna', 'Hanyar sufuri'),
(84, 'hostel', 'Hostel', 'ছাত্রাবাস', 'Hostal', 'نزل', 'छात्रावास', 'ہاسٹل', '宿舍', 'ホステル', 'Hostel', 'Хостел', 'Hôtel', '호스텔', 'Herberge', 'Ostello', 'ที่พัก', 'Diákszálló', 'Herberg', 'Hostel', 'Asrama', 'Pansiyon', 'Ξενοδοχείο', 'خوابگاه', 'Asrama', 'వసతిగృహం', 'விடுதி', 'છાત્રાલય', 'Schronisko', 'Хостел', 'ਹੋਸਟਲ', 'Hostel', 'ဘော်ဒါဆောင်', 'Agbegbe', 'Dakunan kwanan dalibai'),
(85, 'room', 'Room', 'কক্ষ', 'Habitación', 'مجال', 'कक्ष', 'کمرہ', '房间', 'ルーム', 'Quarto', 'Комната', 'Chambre', '방', 'Zimmer', 'Camera', 'ห้อง', 'Szoba', 'Kamer', 'locus', 'Kamar', 'oda', 'Δωμάτιο', 'اتاق', 'Bilik', 'గది', 'அறை', 'રૂમ', 'Pokój', 'Номер', 'ਕਮਰਾ', 'Cameră', 'အခန်း', 'Yara', 'Room'),
(86, 'message', 'Message', 'বার্তা', 'Mensaje', 'رسالة', 'संदेश', 'پیغام', '信息', 'メッセージ', 'mensagem', 'Сообщение', 'Message', '메시지', 'Botschaft', 'Messaggio', 'ข่าวสาร', 'Üzenet', 'Bericht', 'Nuntius', 'Pesan', 'Mesaj', 'Μήνυμα', 'پیام', 'Mesej', 'సందేశం', 'செய்தி', 'સંદેશ', 'Wiadomość', 'повідомлення', 'ਸੁਨੇਹਾ', 'Mesaj', 'မက်ဆေ့ခ်ျကို', 'Ifiranṣẹ', 'Saƙo'),
(87, 'mail_and_sms', 'Mail & SMS', 'ইমেইল ও এসএমএস', 'Correo y SMS', 'البريد والرسائل القصيرة', 'मेल और एसएमएस', 'میل اور ایس ایم ایس', '邮件和短信', 'メールとSMS', 'Correio e SMS', 'Почта и SMS', 'Mail et SMS', '메일 및 SMS', 'Mail & SMS', 'Mail e SMS', 'อีเมลและ SMS', 'Mail & SMS', 'Mail & SMS', 'Mail SMS &', 'Mail & SMS', 'Posta ve SMS', 'Mail και SMS', 'ایمیل و اس ام اس', 'Mail & SMS', 'మెయిల్ & SMS', 'அஞ்சல் & SMS', 'મેઇલ અને એસએમએસ', 'Poczta i SMS', 'Пошта та SMS', 'ਮੇਲ ਅਤੇ ਐਸਐਮਐਸ', 'Mail și SMS', 'မေးလ် & SMS ကို', 'Mail & SMS', 'Mail & SMS'),
(88, 'email', 'Email', 'ইমেইল', 'Email', 'البريد الإلكتروني', 'ईमेल', 'ای میل', '电子邮件', 'Eメール', 'O email', 'Эл. адрес', 'Email', '이메일', 'Email', 'E-mail', 'อีเมล์', 'Email', 'E-mail', 'Email', 'E-mail', 'E-posta', 'ΗΛΕΚΤΡΟΝΙΚΗ ΔΙΕΥΘΥΝΣΗ', 'پست الکترونیک', 'E-mel', 'ఇమెయిల్', 'மின்னஞ்சல்', 'ઇમેઇલ', 'E-mail', 'Електронна пошта', 'ਈ - ਮੇਲ', 'E-mail', 'အီးမေးလ်ပို့ရန်', 'Imeeli', 'Imel'),
(89, 'sms', 'SMS', 'এসএমএস', 'SMS', 'رسالة قصيرة', 'एसएमएस', 'پیغام', '短信', 'SMS', 'SMS', 'смс', 'SMS', 'SMS', 'SMS', 'sms', 'ข้อความ', 'SMS', 'sms', 'SMS', 'SMS', 'SMS', 'γραπτό μήνυμα', 'پیامک', 'SMS', 'SMS', 'எஸ்எம்எஸ்', 'એસએમએસ', 'SMS', 'СМС', 'SMS', 'mesaj', 'စာတို', 'SMS', 'SMS'),
(90, 'announcement', 'Announcement', 'ঘোষণা', 'Anuncio', 'إعلان', 'घोषणा', 'اعلان', '公告', '発表', 'Anúncio', 'Объявление', 'Annonce', '발표', 'Ankündigung', 'Annuncio', 'การประกาศ', 'Közlemény', 'Aankondiging', 'denuntiatio', 'Pengumuman', 'duyuru', 'Ανακοίνωση', 'اطلاعیه', 'Pengumuman', 'ప్రకటన', 'அறிவிப்பு', 'જાહેરાત', 'Ogłoszenie', 'Оголошення', 'ਘੋਸ਼ਣਾ', 'Anunţ', 'ကြေညာချက်', 'Ikede', 'Sanarwa'),
(91, 'notice', 'Notice', 'বিজ্ঞপ্তি', 'darse cuenta', 'تنويه', 'नोटिस', 'نوٹس', '注意', '通知', 'Aviso prévio', 'уведомление', 'Remarquer', '주의', 'Beachten', 'Avviso', 'แจ้งให้ทราบ', 'Értesítés', 'Merk op', 'notitia', 'Melihat', 'ihbar', 'Ειδοποίηση', 'اطلاع', 'Notis', 'నోటీసు', 'அறிவிப்பு', 'નોટિસ', 'Ogłoszenie', 'Зверніть увагу', 'ਨੋਟਿਸ', 'Înștiințare', 'အသိပေးစာ', 'Akiyesi', 'Lura'),
(92, 'news', 'News', 'সংবাদ', 'Noticias', 'أخبار', 'समाचार', 'خبریں', '新闻', 'ニュース', 'Notícia', 'Новости', 'Nouvelles', '뉴스', 'Nachrichten', 'notizia', 'ข่าว', 'hírek', 'Nieuws', 'News', 'Berita', 'Haber', 'Νέα', 'اخبار', 'Berita', 'న్యూస్', 'செய்திகள்', 'સમાચાર', 'Aktualności', 'Новини', 'ਨਿਊਜ਼', 'Știri', 'သတင်း', 'Awọn iroyin', 'News'),
(93, 'holiday', 'Holiday', 'ছুটির দিন', 'Fiesta', 'يوم الاجازة', 'छुट्टी का दिन', 'چھٹیوں', '假日', '休日', 'Feriado', 'День отдыха', 'Vacances', '휴일', 'Urlaub', 'Vacanza', 'วันหยุด', 'Ünnep', 'Holiday', 'ferias', 'Liburan', 'Tatil', 'Αργία', 'تعطیلات', 'Percutian', 'హాలిడే', 'விடுமுறை', 'રજા', 'Święto', 'Свято', 'ਛੁੱਟੀਆਂ', 'Vacanţă', 'အားလပ်ရက်များ', 'Isinmi', 'Holiday'),
(94, 'event', 'Event', 'ইভেন্ট', 'Evento', 'هدف', 'घटना', 'تقریب', '事件', 'イベント', 'Evento', 'Мероприятие', 'un événement', '행사', 'Veranstaltung', 'Evento', 'เหตุการณ์', 'Esemény', 'Evenement', 'res', 'Peristiwa', 'Etkinlik', 'Εκδήλωση', 'رویداد', 'Acara', 'ఈవెంట్', 'நிகழ்வு', 'ઇવેન્ટ', 'Zdarzenie', 'Подія', 'ਘਟਨਾ', 'Eveniment', 'အဖြစ်အပျက်', 'Iṣẹ iṣe', 'Event'),
(95, 'visitor_info', 'Visitor Info', 'আগন্তুক তথ্য', 'Información del visitante', 'معلومات الزائر', 'आगंतुक जानकारी', 'وزیٹر کی معلومات', '访客信息', '訪問者の情報', 'Informação do visitante', 'Информация для посетителей', 'Infos visiteurs', '방문자 정보', 'Besucherinfo', 'Informazioni per i visitatori', 'ข้อมูลผู้เยี่ยมชม', 'Látogatóinformációk', 'Bezoekersinformatie', 'visitor Info', 'Info Pengunjung', 'Ziyaretçi Bilgisi', 'Πληροφορίες επισκεπτών', 'اطلاعات بازدید کننده', 'Maklumat Pelawat', 'సందర్శకుల సమాచారం', 'பார்வையாளர் தகவல்', 'મુલાકાતી માહિતી', 'Informacje dla odwiedzających', 'Інформація про відвідувачів', 'ਵਿਜ਼ਟਰ ਜਾਣਕਾਰੀ', 'Informații despre vizitatori', 'ဧည့်သည်အင်ဖို', 'Alaye Alejo', 'Bayar da Bayani'),
(96, 'accounting', 'Accounting', 'হিসাবরক্ষণ', 'Contabilidad', 'محاسبة', 'लेखांकन', 'اکاؤنٹنگ', '会计', '会計', 'Contabilidade', 'бухгалтерский учет', 'Comptabilité', '회계', 'Buchhaltung', 'Contabilità', 'การบัญชี', 'Számvitel', 'Accounting', 'ratio', 'Akuntansi', 'Muhasebe', 'Λογιστική', 'حسابداری', 'Perakaunan', 'అకౌంటింగ్', 'கணக்கியல்', 'નામું', 'Rachunkowość', 'Бухгалтерський облік', 'ਲੇਿਾਕਾਰੀ', 'Contabilitate', 'စာရင်းကိုင်', 'Iṣiro', 'Ƙididdiga'),
(97, 'fee_type', 'Fee Type', 'ফি টাইপ', 'Tipo de tarifa', 'نوع الرسوم', 'शुल्क प्रकार', 'فیس قسم', '费用类型', '料金タイプ', 'Tipo de taxa', 'Тип платы', 'Type de frais', '수수료 유형', 'Gebührenart', 'Tipo di commissione', 'ประเภทค่าธรรมเนียม', 'Díj típusa', 'Vergoedingstype', 'feodo Type', 'Jenis Biaya', 'Ücret Türü', 'Τύπος τέλους', 'نوع هزینه', 'Jenis Bayaran', 'ఫీజు రకం', 'கட்டணம் வகை', 'ફી પ્રકાર', 'Rodzaj opłaty', 'Плата типу', 'ਫੀਸ ਕਿਸਮ', 'Tip de taxă', 'အခကြေးငွေအမျိုးအစား', 'Iru Ẹri', 'Fee Type');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(98, 'type', 'Type', 'প্রকার', 'Tipo', 'اكتب', 'प्रकार', 'ٹائپ کریں', '类型', 'タイプ', 'Tipo', 'Тип', 'Type', '유형', 'Art', 'genere', 'ชนิด', 'típus', 'Type', 'genus', 'Mengetik', 'tip', 'Τύπος', 'تایپ کنید', 'Taipkan', 'రకం', 'வகை', 'પ્રકાર', 'Rodzaj', 'Тип', 'ਟਾਈਪ ਕਰੋ', 'Tip', 'ပုံစံ', 'Iru', 'Rubuta'),
(99, 'invoice', 'Invoice', 'চালান', 'Factura', 'فاتورة', 'बीजक', 'انوائس', '发票', '請求書', 'Fatura', 'Выставленный счет', 'Facture dachat', '송장', 'Rechnung', 'Fattura', 'ใบแจ้งหนี้', 'Számla', 'Factuur', 'cautionem', 'Faktur', 'Fatura', 'Τιμολόγιο', 'صورتحساب', 'Invois', 'వాయిస్', 'விலைப்பட்டியல்', 'ભરતિયું', 'Faktura', 'Рахунок-фактура', 'ਇਨਵੌਇਸ', 'Factura fiscala', 'ဝယ်ကုန်စာရင်း', 'Ifiweranṣẹ', 'Invoice'),
(100, 'create', 'Create', 'তৈরী কর', 'Crear', 'خلق', 'सर्जन करना', 'بنانا', '创建', '作成する', 'Crio', 'Создайте', 'Créer', '몹시 떠들어 대다', 'Erstellen', 'Creare', 'สร้าง', 'Teremt', 'creëren', 'Create', 'Membuat', 'yaratmak', 'Δημιουργώ', 'ايجاد كردن', 'Buat', 'సృష్టించు', 'உருவாக்கவும்', 'બનાવો', 'Stwórz', 'Створити', 'ਬਣਾਓ', 'Crea', 'ဖန်တီး', 'Ṣẹda', 'Ƙirƙiri'),
(101, 'due_invoice', 'Due Invoice', 'বাকি চালান', 'Factura debida', 'الفاتورة المستحقة', 'कारण चालान', 'وجہ انوائس', '到期发票', '支払請求書', 'Fatura devida', 'Счет-фактура', 'Due Facture', '송장', 'Fällige Rechnung', 'Fattura dovuta', 'ใบแจ้งหนี้ที่ครบกำหนด', 'Esedékes számla', 'Doorlopende factuur', 'ob cautionem', 'Karena Faktur', 'Fatura Faturası', 'Οφειλόμενο τιμολόγιο', 'فاکتور موقت', 'Invois yang Dikehendaki', 'ఇన్వాయిస్ కారణంగా', 'காரணமாக விலைப்பட்டியல்', 'કારણે ભરતિયું', 'Due Faktura', 'Належний рахунок-фактура', 'ਬਕਾਇਆ ਇਨਵੌਇਸ', 'Datorită facturii', 'ကြောင့်ငွေတောင်းခံလွှာ', 'Fun Iroyin', 'Saboda Bayani'),
(102, 'expenditure', 'Expenditure', 'ব্যয়', 'Gasto', 'المصروفات', 'व्यय', 'خرچ', '支出', '支出', 'Despesa', 'Расход', 'Dépense', '지출', 'Ausgaben', 'Spesa', 'รายจ่าย', 'Kiadás', 'Uitgaven', 'Custus', 'Pengeluaran', 'harcama', 'Δαπάνη', 'هزینه ها', 'Perbelanjaan', 'ఎక్స్పెండిచర్', 'செலவினம்', 'ખર્ચ', 'Wydatek', 'Витрати', 'ਖਰਚੇ', 'Cheltuieli', 'သုံးငှေ', 'Isanwo', 'Sakamako'),
(103, 'expenditure_head', 'Expenditure Head', 'ব্যয় হেড', 'Jefe de gastos', 'رئيس النفقات', 'व्यय हेड', 'خرچ سر', '支出负责人', '支出ヘッド', 'Chefe de despesas', 'Руководитель отдела расходов', 'Chef des dépenses', '지출 헤드', 'Ausgabenleiter', 'Capo spese', 'หัวหน้าค่าใช้จ่าย', 'Kiadási vezető', 'Uitgaven Hoofd', 'caput capitis expensi,', 'Kepala Pengeluaran', 'Harcama Kafası', 'Επικεφαλής δαπανών', 'سر هزینه', 'Ketua Perbelanjaan', 'ఎక్స్పెండిచర్ హెడ్', 'செலவுத் தலை', 'ખર્ચ હેડ', 'Wydatki Kierownik', 'Голова витрат', 'ਖਰਚਾ ਸਿਰ', 'Șef de cheltuieli', 'အသုံးစရိတ်ဌာနမှူး', 'Oriiye Gbese', 'Shugaban Kuɗi'),
(104, 'income', 'Income', 'আয়', 'Ingresos', 'الإيرادات', 'आय', 'آمدنی', '收入', '所得', 'Renda', 'доход', 'le revenu', '수입', 'Einkommen', 'Reddito', 'เงินได้', 'Jövedelem', 'Inkomen', 'reditus', 'Pendapatan', 'Gelir', 'Εισόδημα', 'درآمد', 'Pendapatan', 'ఆదాయపు', 'வருமான', 'આવક', 'Dochód', 'Дохід', 'ਆਮਦਨੀ', 'Sursa de venit', 'ဝငျငှေ', 'Owo oya', 'Kudin shiga'),
(105, 'income_head', 'Income Head', 'আয় হেড', 'Jefe de ingresos', 'رئيس الدخل', 'आय हेड', 'آمدنی کے سربراہ', '收入负责人', '所得の頭部', 'Chefe de renda', 'Головной доход', 'Tête de revenu', '소득 헤드', 'Einkommen Kopf', 'Capo reddito', 'หัวหน้ารายได้', 'Jövedelemvezető', 'Inkomenskop', 'caput capitis reditus', 'Kepala Penghasilan', 'Gelir Kafası', 'Κεφάλαιο Εισοδήματος', 'سر درآمد', 'Ketua Pendapatan', 'ఆదాయం హెడ్', 'வருமானத் தலைவர்', 'આવક હેડ', 'Głowa dochodów', 'Голова доходів', 'ਇਨਕਮ ਹੈੱਡ', 'Cap de venit', 'ဝင်ငွေခွန်ဌာနမှူး', 'owo oya Head', 'Shugaban Asusun'),
(106, 'report', 'Report', 'প্রতিবেদন', 'Informe', 'أبلغ عن', 'रिपोर्ट', 'رپورٹ', '报告', '報告する', 'Relatório', 'отчет', 'rapport', '보고서', 'Bericht', 'rapporto', 'รายงาน', 'Jelentés', 'Verslag doen van', 'Report', 'Melaporkan', 'Rapor', 'Κανω ΑΝΑΦΟΡΑ', 'گزارش', 'Laporan', 'నివేదిక', 'அறிக்கை', 'અહેવાલ', 'Raport', 'Звіт', 'ਰਿਪੋਰਟ ਕਰੋ', 'Raport', 'အစီရင်ခံစာ', 'Iroyin', 'Rahoton'),
(107, 'balance', 'Balance', 'হিসাবনিকাশ', 'Equilibrar', 'توازن', 'संतुलन', 'بقیہ', '平衡', 'バランス', 'Equilibrar', 'Баланс', 'Équilibre', '밸런스', 'Balance', 'Equilibrio', 'สมดุล', 'Egyensúly', 'Balans', 'Libra', 'Keseimbangan', 'Denge', 'Ισορροπία', 'تعادل', 'Seimbang', 'సంతులనం', 'இருப்பு', 'બેલેન્સ', 'Saldo', 'Баланс', 'ਬਕਾਇਆ', 'Echilibru', 'ချိန်ခွင်လျှာ', 'Iwontunws.funfun', 'Balance'),
(108, 'profile', 'Profile', 'প্রোফাইল', 'Perfil', 'الملف الشخصي', 'प्रोफाइल', 'پروفائل', '轮廓', 'プロフィール', 'Perfil', 'Профиль', 'Profil', '윤곽', 'Profil', 'Profilo', 'ข้อมูลส่วนตัว', 'Profil', 'Profiel', 'Profile', 'Profil', 'Profil', 'Προφίλ', 'مشخصات', 'Profil', 'ప్రొఫైల్', 'விவரம்', 'પ્રોફાઇલ', 'Profil', 'Профіль', 'ਪ੍ਰੋਫਾਈਲ', 'Profil', 'ပရိုဖိုင်းကို', 'Profaili', 'Profile'),
(109, 'my_profile', 'My Profile', 'আমার প্রোফাইল', 'Mi perfil', 'ملفي', 'मेरी प्रोफाइल', 'میری پروفائل', '我的简历', '私のプロフィール', 'Meu perfil', 'Мой профайл', 'Mon profil', '내 프로필', 'Mein Profil', 'Il mio profilo', 'ประวัติของฉัน', 'A profilom', 'Mijn profiel', 'mea Profile', 'Profil saya', 'Benim profilim', 'Το ΠΡΟΦΙΛ μου', 'پروفایل من', 'Profil saya', 'నా జీవన వివరణ', 'என் சுயவிவரம்', 'મારી પ્રોફાઈલ', 'Mój profil', 'Мій профіль', 'ਮੇਰੀ ਪ੍ਰੋਫਾਈਲ', 'Profilul meu', 'အကြှနျုပျ၏ကိုယ်ရေးဖိုင်', 'Profaili mi', 'My Profile'),
(110, 'logout', 'Log Out', 'প্রস্থান', 'Cerrar sesión', 'الخروج', 'लोग आउट', 'لاگ آوٹ', '登出', 'ログアウト', 'Sair', 'Выйти', 'Connectez - Out', '로그 아웃', 'Ausloggen', 'Disconnettersi', 'ออกจากระบบ', 'Kijelentkezés', 'Uitloggen', 'Ex Log', 'Keluar', 'Çıkış Yap', 'Αποσυνδέση', 'خروج', 'Log keluar', 'లాగ్ అవుట్', 'வெளியேறு', 'લૉગ આઉટ', 'Wyloguj', 'Вийти', 'ਲਾੱਗ ਆਊਟ, ਬਾਹਰ ਆਉਣਾ', 'Deconectați-vă', 'အထဲက Log', 'Jade kuro', 'An fita'),
(111, 'login', 'Log In', 'লগইন', 'Iniciar sesión', 'تسجيل الدخول', 'लॉग इन करें', 'میں لاگ ان کریں', '登录', 'ログイン', 'Entrar', 'Авторизоваться', 'Sidentifier', '로그인', 'Einloggen', 'Accesso', 'เข้าสู่ระบบ', 'Belépés', 'Log in', 'Log In', 'Masuk', 'Oturum aç', 'Σύνδεση', 'ورود', 'Log masuk', 'లాగ్ ఇన్', 'உள் நுழை', 'લૉગ ઇન કરો', 'Zaloguj Się', 'Увійти', 'ਲਾਗਿਨ', 'Logare', 'လော့ဂ်အင်', 'Wo ile', 'Shiga'),
(112, 'forgot_password', 'Forgot Password', 'পাসওয়ার্ড ভুলে গেছি', 'Se te olvidó tu contraseña', 'هل نسيت كلمة المرور', 'पासवर्ड भूल गए', 'پاسورڈ بھول گے', '忘记密码', 'パスワードをお忘れですか', 'Esqueceu a senha', 'Забыли пароль', 'Forgot Password', '비밀번호를 잊으 셨나요', 'Passwort vergessen', 'Ha dimenticato la password', 'ลืมรหัสผ่าน', 'Elfelejtett jelszó', 'Wachtwoord vergeten', 'Forgot Password', 'Lupa kata sandi', 'Parolanızı mı unuttunuz', 'Ξεχάσατε τον κωδικό', 'رمز عبور را فراموش کرده اید', 'Lupa kata laluan', 'పాస్వర్డ్ మర్చిపోయారా', 'கடவுச்சொல்லை மறந்துவிட்டீர்களா', 'પાસવર્ડ ભૂલી ગયા છો', 'Zapomniałeś hasła', 'Забули пароль', 'ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ', 'Aţi uitat parola', 'စကားဝှက်ကိုမေ့နေပါသလား', 'Gbagbe ọrọ aṣina bi', 'Kalmar sirri da aka manta'),
(113, 'recovery_email', 'Recovery Email', 'পুনরুদ্ধার ইমেল', 'Correo electrónico de recuperación', 'البريد الإلكتروني الاسترداد', 'रिकवरी ईमेल', 'بازیابی ای میل', '恢复邮件', '復旧メール', 'Email de recuperação', 'Восстановление электронной почты', 'E-mail de secours', '복구 이메일', 'Wiederherstellungs-E-Mail', 'Email di recupero', 'อีเมลสำหรับกู้คืน', 'Helyreállítási e-mail', 'Herstel e-mail', 'Email convaluisset', 'Email pemulihan', 'Kurtarma Postası', 'Email αποκατάστασης', 'ایمیل بازیابی', 'E-mel Pemulihan', 'రికవరీ ఇమెయిల్', 'மீட்பு மின்னஞ்சல்', 'પુનઃપ્રાપ્તિ ઇમેઇલ', 'E-mail odzyskiwania', 'Електронна пошта відновлення', 'ਰਿਕਵਰੀ ਈਮੇਲ', 'E-mail de recuperare', 'recovery ကိုအီးမေးလ်ပို့ရန်', 'Imeeli igbasilẹ', 'Maido da Imel'),
(114, 'remember_me', 'Remember me', 'আমাকে মনে রাখুন', 'Recuérdame', 'تذكرنى', 'मुझे याद रखना', 'مجھے پہچانتے ہو', '记住我', '私を覚えてますか', 'Lembre de mim', 'Запомни меня', 'Souviens-toi de moi', '날 기억해', 'Erinnere dich an mich', 'Ricordati di me', 'จดจำฉัน', 'Emlékezz rám', 'Onthoud me', 'memento mei', 'Ingat saya', 'Beni hatırla', 'Θυμήσου με', 'مرا به خاطر بسپار', 'Ingat saya', 'నన్ను గుర్తు పెట్టుకో', 'என்னை நினைவில் கொள்ளுங்கள்', 'મને યાદ', 'Zapamiętaj mnie', 'Памятай мене', 'ਮੇਰੀ ਯਾਦ ਹੈ', 'Amintește-ți de mine', 'ငါ့ကိုသတိရပါ', 'Ranti mi', 'Ka tuna da ni'),
(115, 'school', 'School', 'বিদ্যালয়', 'Colegio', 'مدرسة', 'स्कूल', 'اسکول', '学校', '学校', 'Escola', 'Школа', 'École', '학교', 'Schule', 'Scuola', 'โรงเรียน', 'Iskola', 'School', 'School', 'Sekolah', 'Okul', 'Σχολείο', 'مدرسه', 'Sekolah', 'స్కూల్', 'பள்ளி', 'શાળા', 'Szkoła', 'Школа', 'ਸਕੂਲ', 'Şcoală', 'ကြောငျး', 'Ile-iwe', 'Makarantar'),
(116, 'name', 'Name', 'নাম', 'Nombre', 'اسم', 'नाम', 'نام', '名称', '名', 'Nome', 'имя', 'prénom', '이름', 'Name', 'Nome', 'ชื่อ', 'Név', 'Naam', 'nomine', 'Nama', 'isim', 'Ονομα', 'نام', 'Nama', 'పేరు', 'பெயர்', 'નામ', 'Nazwa', 'Імя', 'ਨਾਮ', 'Nume', 'အမည်', 'Oruko', 'Sunan'),
(117, 'address', 'Address', 'ঠিকানা', 'Dirección', 'عنوان', 'पता', 'ایڈریس', '地址', '住所', 'Endereço', 'Адрес', 'Adresse', '주소', 'Adresse', 'Indirizzo', 'ที่อยู่', 'Cím', 'Adres', 'oratio', 'Alamat', 'Adres', 'Διεύθυνση', 'نشانی', 'Alamat', 'చిరునామా', 'முகவரி', 'સરનામું', 'Adres', 'Адреса', 'ਪਤਾ', 'Adresa', 'လိပ်စာ', 'Adirẹsi', 'Adireshin'),
(118, 'phone', 'Phone', 'ফোন', 'Teléfono', 'هاتف', 'फ़ोन', 'فون', '电话', '電話', 'telefone', 'Телефон', 'Phone', '전화', 'Telefon', 'Telefono', 'โทรศัพท์', 'Telefon', 'Telefoon', 'Phone', 'Telepon', 'Telefon', 'Τηλέφωνο', 'تلفن', 'Telefon', 'ఫోన్', 'தொலைபேசி', 'ફોન', 'Telefon', 'Телефон', 'ਫੋਨ', 'Telefon', 'ဖုန်းနံပါတ်', 'Foonu', 'Waya'),
(119, 'footer', 'Footer', 'ওয়েবসাইট ফুটার', 'Pie de página', 'تذييل', 'फ़ुटबाल', 'فوٹر', '页脚', 'フッター', 'Rodapé', 'нижний колонтитул', 'Bas de page', '보행인', 'Fußzeile', 'footer', 'ฟุตบอล', 'Lábjegyzet', 'footer', 'footer', 'Footer', 'Alt Bilgi', 'Υποσέλιδο', 'پاورقی', 'Footer', 'ఫుటర్', 'அடிக்குறிப்பு', 'ફૂટર', 'Stopka', 'Нижній колонтитул', 'ਪਦਲੇਰ', 'Subsol', 'အောက်ခြေ', 'Ẹlẹsẹ', 'Hanya'),
(120, 'logo', 'Logo', 'লগো', 'Logo', 'شعار', 'प्रतीक चिन्ह', 'لوگو', '商标', 'ロゴ', 'Logotipo', 'логотип', 'Logo', '심벌 마크', 'Logo', 'Logo', 'เครื่องหมาย', 'logo', 'Logo', 'logo', 'Logo', 'Logo', 'Λογότυπο', 'لوگو', 'Logo', 'లోగో', 'சின்னம்', 'લૉગો', 'Logo', 'Логотип', 'ਲੋਗੋ', 'Siglă', 'လိုဂို', 'Logo', 'Logo'),
(121, 'title', 'Title', 'শিরোনাম', 'Título', 'عنوان', 'शीर्षक', 'عنوان', '标题', 'タイトル', 'Título', 'заглавие', 'Titre', '표제', 'Titel', 'Titolo', 'หัวข้อ', 'Cím', 'Titel', 'titulus', 'Judul', 'Başlık', 'Τίτλος', 'عنوان', 'Tajuk', 'శీర్షిక', 'தலைப்பு', 'શીર્ષક', 'Tytuł', 'Назва', 'ਟਾਈਟਲ', 'Titlu', 'ခေါင်းစဥ်', 'Akọle', 'Title'),
(122, 'total', 'Total', 'মোট', 'Total', 'مجموع', 'कुल', 'کل', '总', '合計', 'Total', 'Всего', 'Total', '합계', 'Gesamt', 'Totale', 'ทั้งหมด', 'Teljes', 'Totaal', 'summa', 'Total', 'Genel Toplam', 'Σύνολο', 'جمع', 'Jumlah', 'మొత్తం', 'மொத்த', 'કુલ', 'Całkowity', 'Всього', 'ਕੁੱਲ', 'Total', 'စုစုပေါငျး', 'Lapapọ', 'Jimlar'),
(123, 'calendar', 'Calendar', 'পঞ্জিকা', 'Calendario', 'التقويم', 'कैलेंडर', 'کیلنڈر', '日历', 'カレンダー', 'Calendário', 'Календарь', 'Calendrier', '달력', 'Kalender', 'Calendario', 'ปฏิทิน', 'Naptár', 'Kalender', 'Calendar', 'Kalender', 'Takvim', 'Ημερολόγιο', 'تقویم', 'Kalendar', 'క్యాలెండర్', 'நாட்காட்டி', 'કૅલેન્ડર', 'Kalendarz', 'Календар', 'ਕੈਲੰਡਰ', 'Calendar', 'ပြက္ခဒိန်', 'Kalẹnda', 'Kalanda'),
(124, 'statistics', 'Statistics', 'পরিসংখ্যান', 'Estadística', 'الإحصاء', 'आंकड़े', 'اعداد و شمار', '统计', '統計', 'Estatisticas', 'Статистика', 'Statistiques', '통계', 'Statistiken', 'statistica', 'สถิติ', 'Statisztika', 'Statistieken', 'Statistics', 'Statistik', 'istatistik', 'Στατιστική', 'آمار', 'Statistik', 'గణాంకాలు', 'புள்ளியியல்', 'આંકડા', 'Statystyka', 'Статистика', 'ਅੰਕੜੇ', 'Statistici', 'စာရင်းအင်း', 'Awọn iṣiro', 'Statistics'),
(125, 'latest', 'Latest', 'সর্বশেষ', 'Último', 'آخر', 'नवीनतम', 'تازہ ترین', '最新', '最新', 'Mais recentes', 'Последний', 'Dernier', '최근', 'Neueste', 'Più recente', 'ล่าสุด', 'Legújabb', 'Laatste', 'latest', 'Terbaru', 'son', 'Αργότερο', 'آخرین', 'Terkini', 'తాజా', 'சமீபத்திய', 'તાજેતરની', 'Najnowszy', 'Останні', 'ਨਵੀਨਤਮ', 'Cele mai recente', 'နောက်ဆုံး', 'Titun', 'Bugawa'),
(126, 'currency', 'Currency', 'মুদ্রা', 'Moneda', 'دقة', 'मुद्रा', 'کرنسی', '货币', '通貨', 'Moeda', 'валюта', 'Devise', '통화', 'Währung', 'Moneta', 'เงินตรา', 'Valuta', 'Valuta', 'monetæ', 'Mata uang', 'Para birimi', 'Νόμισμα', 'واحد پول', 'Mata wang', 'కరెన్సీ', 'நாணய', 'ચલણ', 'Waluta', 'Валюта', 'ਮੁਦਰਾ', 'Valută', 'ငွေကြေးစနစ်', 'Owo', 'Kudin'),
(127, 'currency_symbol', 'Currency Symbol', 'মুদ্রা চিহ্ন', 'Símbolo de moneda', 'رمز العملة', 'मुद्रा चिन्ह', 'کرنسی علامت', '货币符号', '通貨記号', 'Símbolo monetário', 'Символ валюты', 'Symbole de la monnaie', '통화 기호', 'Währungszeichen', 'Simbolo di valuta', 'สัญลักษณ์สกุลเงิน', 'Pénznem szimbólum', 'Symbool van munteenheid', 'monetæ Symbol', 'Simbol mata uang', 'Para Birimi Sembolü', 'Σύμβολο νομίσματος', 'نماد ارز', 'Simbol mata wang', 'కరెన్సీ చిహ్నం', 'நாணய சின்னம்', 'કરન્સી પ્રતીક', 'Symbol waluty', 'Символ валюти', 'ਕਰੰਸੀ ਨਿਸ਼ਾਨ', 'Simbolul valutei', 'ငွေကြေးသင်္ကေတ', 'Aami Owo', 'Alamar Kudin'),
(128, 'note', 'Note', 'মন্তব্য', 'Nota', 'ملحوظة', 'ध्यान दें', 'نوٹ', '注意', '注意', 'Nota', 'Заметка', 'Remarque', '노트', 'Hinweis', 'Nota', 'บันทึก', 'jegyzet', 'Notitie', 'nota', 'Catatan', 'Not', 'Σημείωση', 'توجه داشته باشید', 'Nota', 'గమనిక', 'குறிப்பு', 'નૉૅધ', 'Uwaga', 'Примітка', 'ਨੋਟ', 'Notă', 'မှတ်စု', 'Akiyesi', 'Lura'),
(129, 'is_running', 'Is Running?', 'চলছে?', '¿Esta corriendo?', 'يجري؟', 'दौड रहा है?', 'بھاگ رہا ہے؟', '在跑？', 'が走っています？', 'Está correndo?', 'Бежит?', 'Est en cours dexécution?', '달리기?', 'Läuft?', 'È in esecuzione?', 'กำลังวิ่ง?', 'Fut?', 'Is aan het rennen?', 'Is Cursor?', 'Sedang berlari?', 'Çalışıyor?', 'Τρέχει?', 'در حال اجراست؟', 'Adalah berlari?', 'పరిగెత్తుతున్నాడు?', 'இயங்குகிறது?', 'ચાલી રહ્યું છે?', 'Biegnie?', 'Біжить?', 'ਚੱਲ ਰਿਹਾ ਹੈ?', 'Rulează?', 'ကို run သလဲ?', 'Nṣiṣẹ?', 'Yana gudana?'),
(130, 'running_year', 'Running Year', 'চলমান বছর', 'Año de ejecución', 'تشغيل السنة', 'वर्ष चल रहा है', 'چل رہا ہے سال', '运行年', 'ランニング・イヤー', 'Ano corrente', 'Бегущий год', 'Année de fonctionnement', '러닝 연도', 'Laufendes Jahr', 'Anno in corso', 'ปีที่ดำเนินการ', 'Futóév', 'Lopend jaar', 'anno currit', 'Tahun berjalan', 'Koşu Yılı', 'Τρέχον έτος', 'در حال اجرا سال', 'Tahun Berjalan', 'రన్నింగ్ ఇయర్', 'இயங்கும் வருடம்', 'વર્ષ ચાલી રહ્યું છે', 'Rok bieżący', 'Біг Рік', 'ਰਨਿੰਗ ਯੀਅਰ', 'Anul de funcționare', 'အပြေးတစ်နှစ်တာ', 'Nṣiṣẹ Ọdun', 'Gudun Shekara'),
(131, 'is_demo', 'Is Demo?', 'ডেমো কি?', 'Es Demo?', 'هل تجريبي؟', 'डेमो है?', 'ڈیمو ہے؟', '是演示？', 'デモですか？', 'Demo?', 'Есть демо?', 'Est-ce que Demo?', '데모입니까?', 'Ist Demo?', 'È Demo?', 'Demo?', 'A demo?', 'Is demo?', 'Demo est?', 'Apakah demo', 'Demo var mı?', 'Είναι επίδειξη;', 'آیا نسخه ی نمایشی است؟', 'Adakah Demo?', 'డెమోనా?', 'டெமோ?', 'ડેમો છે?', 'Czy to demo?', 'Демо?', 'ਡੈਮੋ ਹੈ?', 'Este Demo?', 'Demo လား?', 'Ṣe Demo?', 'Shin Demo?'),
(132, 'is_active', 'Is Active?', 'একটিভ?', '¿Está activo?', 'هل نشط؟', 'सक्रिय है?', 'فعال ہے؟', '活跃？', 'アクティブです？', 'Está ativo?', 'Активен?', 'Cest actif?', '활성?', 'Ist aktiv?', 'È attivo?', 'มีการใช้งานอยู่หรือไม่?', 'Aktív?', 'Is actief?', 'Active est?', 'Aktif?', 'Aktif?', 'Είναι ενεργό?', 'فعال است؟', 'Adalah aktif?', 'సక్రియంగా ఉందా?', 'செயலில் இருக்கிறதா?', 'સક્રિય છે?', 'Jest aktywny?', 'Активний?', 'ਸਰਗਰਮ ਹੈ?', 'Este activ?', 'Active ကိုလား?', 'Ṣe Iroyin?', 'Yana aiki?'),
(133, 'active', 'Active', 'সক্রিয়', 'Activo', 'نشيط', 'सक्रिय', 'فعال', '活性', 'アクティブ', 'Ativo', 'активный', 'actif', '유효한', 'Aktiv', 'Attivo', 'คล่องแคล่ว', 'Aktív', 'Actief', 'Active', 'Aktif', 'Aktif', 'Ενεργός', 'فعال', 'Aktif', 'క్రియాశీల', 'செயலில்', 'સક્રિય', 'Aktywny', 'Активний', 'ਕਿਰਿਆਸ਼ੀਲ', 'Activ', 'တက်ကြွ', 'Iroyin', 'Aiki'),
(134, 'secret', 'Secret', 'গোপন', 'Secreto', 'سر', 'गुप्त', 'خفیہ', '秘密', '秘密', 'Segredo', 'секрет', 'Secret', '비밀', 'Geheimnis', 'Segreto', 'ลับ', 'Titok', 'Geheim', 'secret', 'Rahasia', 'Gizli', 'Μυστικό', 'راز', 'Rahsia', 'సీక్రెట్', 'இரகசிய', 'સિક્રેટ', 'Sekret', 'Таємно', 'ਰਾਜ਼', 'Secret', 'လျှို့ဝှက်ချက်', 'ìkọkọ', 'Asiri'),
(135, 'api_key', 'Api Key', 'এপিআই কী', 'Clave API', 'مفتاح API', 'एपीआई कुंजी', 'اےپی کی کلی', 'Api Key', 'Api Key', 'Chave API', 'Api Key', 'Clé de feu', 'API 키', 'API-Schlüssel', 'Chiave Api', 'คีย์ Api', 'Api Key', 'API sleutel', 'API key', 'Kunci API', 'Api Key', 'Api Key', 'کلید ای پی ای', 'Api Utama', 'అపి కీ', 'அப் கீ', 'API કી', 'Klucz API', 'Api Key', 'ਅਪੀ ਕੁੰਜੀ', 'Api Key', 'api Key ကို', 'Bọtini Api', 'Api Key'),
(136, 'key', 'Key', 'কী', 'Llave', 'مفتاح', 'कुंजी', 'کلیدی', '键', 'キー', 'Chave', 'ключ', 'Clé', '키', 'Schlüssel', 'Chiave', 'สำคัญ', 'Kulcs', 'Sleutel', 'Clavis', 'Kunci', 'anahtar', 'Κλειδί', 'کلید', 'Kunci', 'కీ', 'சாவி', 'કી', 'Klawisz', 'Ключ', 'ਕੁੰਜੀ', 'Cheie', 'သော့', 'Bọtini', 'Key'),
(137, 'key_salt', 'Key Salt', 'কী সল্ট', 'Key Salt', 'مفتاح الملح', 'कुंजी नमक', 'کلیدی نمک', '关键盐', 'キーソルト', 'Sal chave', 'Основная соль', 'Sel principal', '키 솔트', 'Schlüsselsalz', 'Key Salt', 'เกลือแกง', 'Fő só', 'Key Salt', 'Key salis', 'Garam utama', 'Anahtar Tuz', 'Βασικό αλάτι', 'نمک کلیدی', 'Garam utama', 'కీ ఉప్పు', 'முக்கிய உப்பு', 'કી સોલ્ટ', 'Kluczowa sól', 'Ключові солі', 'ਕੀ ਸਲੌਲ', 'Sare cheie', 'Key ကိုဆား', 'iyọ bọtini', 'Key Salt'),
(138, 'username', 'Username', 'ব্যবহারকারীর নাম', 'Nombre de usuario', 'اسم المستخدم', 'उपयोगकर्ता नाम', 'صارف کا نام', '用户名', 'ユーザー名', 'Nome de usuário', 'имя пользователя', 'Nom dutilisateur', '사용자 이름', 'Nutzername', 'Nome utente', 'ชื่อผู้ใช้', 'Felhasználónév', 'Gebruikersnaam', 'nomen usoris', 'Nama pengguna', 'Kullanıcı adı', 'Όνομα χρήστη', 'نام کاربری', 'Nama pengguna', 'యూజర్ పేరు', 'பயனர்பெயர்', 'વપરાશકર્તા નામ', 'Nazwa Użytkownika', 'Імя користувача', 'ਯੂਜ਼ਰਨਾਮ', 'Nume de utilizator', 'အသုံးပြုသူအမည်', 'Orukọ olumulo', 'Sunan mai amfani'),
(139, 'account_sid', 'Account SID', 'একাউন্ট এসআইডি', 'SID de la cuenta', 'حساب سيد', 'अकाउंट एसआईडी', 'اکاؤنٹ SID', '帐户SID', 'アカウントSID', 'SID da conta', 'SID учетной записи', 'Compte SID', '계정 SID', 'Konto SID', 'SID dellaccount', 'บัญชี SID', 'Fiók SID', 'Account SID', 'ratio SID', 'Akun SID', 'Hesap SID', 'Λογαριασμός SID', 'SID حساب', 'SID Akaun', 'SID ఖాతా', 'கணக்கு SID', 'એકાઉન્ટ SID', 'Identyfikator konta SID', 'Ідентифікатор облікового запису', 'ਖਾਤਾ SID', 'Cont SID', 'အကောင့် SID', 'SID iroyin', 'Asusun SID'),
(140, 'auth_token', 'Auth Token', 'অথ টোকেন', 'Token de autenticación', 'الرمز المميز للمصادقة', 'औथ टोकन', 'مصنف ٹوکن', '验证令牌', '認証トークン', 'Token Auth', 'Auth Token', 'Jeton dauthentification', '인증 토큰', 'Auth Token', 'Token di autenticazione', 'Auth Token', 'Hitel Token', 'Auth Token', 'auth Thochen', 'Token Auth', 'Auth Token', 'Auth Token', 'Auth Token', 'Token Auth', 'ప్రామాణీకరణ టోకెన్', 'அங்கீகார டோக்கன்', 'ઑથ ટોકન', 'token autoryzacji', 'Авт токен', 'Auth ਟੋਕਨ', 'Auth Token', 'auth တိုကင်', 'auth aami', 'Auth Token'),
(141, 'auth_key', 'Auth Key', 'অথ কী', 'Clave de autenticación', 'مفتاح المصادقة', 'प्रमाणन कुंजी', 'مصنف کلیدی', '授权键', '認証キー', 'Chave de autenticação', 'Auth Key', 'Clé dauthentification', '인증 키', 'Authentifizierungsschlüssel', 'Chiave dautenticazione', 'คีย์การตรวจสอบ', 'Autentikációs kulcs', 'Inlogcode', 'Key auth', 'Kunci otomatis', 'Auth Key', 'Auth Key', 'کلید تایید', 'Auth Key', 'ప్రామాణీకరణ కీ', 'அங்கீகார விசை', 'ઑથ કી', 'Klucz autoryzujący', 'Автх ключ', 'ਔਥ ਕੀ', 'Auth Key', 'auth Key ကို', 'Bọtini Auth', 'A Key Key'),
(142, 'auth_id', 'Auth ID', 'অথ আইডি', 'ID de autenticación', 'معرف المصادقة', 'ऑथ आईडी', 'مصنف ID', '身份验证ID', '認証ID', 'ID de Autenticação', 'Auth ID', 'Authentification', '인증 ID', 'Authentifizierungs-ID', 'Auth ID', 'รหัสผู้ใช้', 'Hitelazonosító', 'Auth ID', 'id auth', 'ID Auth', 'Kimliği kimliği', 'Auth ID', 'ID Auth', 'ID pengarang', 'ప్రామాణీకరణ ID', 'அங்கீகார ஐடி', 'ઑથ ID', 'Auth ID', 'Auth ID', 'Auth ID', 'Auth ID', 'auth ID ကို', 'Auth ID', 'ID ID'),
(143, 'from_number', 'From Number', 'ফ্রম নম্বর', 'Desde el número', 'من العدد', 'संख्या से', 'نمبر سے', '从数字', '番号から', 'Do número', 'От номера', 'À partir du numéro', '발신 번호', 'Von Nummer', 'Dal numero', 'จากจำนวน', 'A számtól', 'Van nummer', 'Ex Number', 'Dari nomor', 'Numaradan', 'Από τον αριθμό', 'از شماره', 'Daripada Nombor', 'సంఖ్య నుండి', 'எண் இருந்து', 'સંખ્યા પ્રતિ', 'Z numeru', 'З числа', 'ਨੰਬਰ ਤੋਂ', 'Din numărul', 'နံပါတ် မှစ.', 'Lati Nọmba', 'Daga Lambar'),
(144, 'number', 'Number', 'নম্বর', 'Número', 'رقم', 'संख्या', 'نمبر', '数', '数', 'Número', 'Число', 'Nombre', '번호', 'Nummer', 'Numero', 'จำนวน', 'Szám', 'Aantal', 'numerus', 'Jumlah', 'Numara', 'Αριθμός', 'عدد', 'Nombor', 'సంఖ్య', 'எண்', 'સંખ્યા', 'Numer', 'Номер', 'ਗਿਣਤੀ', 'Număr', 'ဂဏန်း', 'Nọmba', 'Lambar'),
(145, 'from', 'From', 'থেকে', 'De', 'من عند', 'से', 'سے', '从', 'から', 'A partir de', 'Из', 'De', '에서', 'Von', 'A partire dal', 'จาก', 'Tól től', 'Van', 'Ex', 'Dari', 'itibaren', 'Από', 'از جانب', 'Dari', 'నుండి', 'இருந்து', 'પ્રતિ', 'Od', 'Від', 'ਤੋਂ', 'Din', 'မှ', 'Lati', 'Daga'),
(146, 'sender_id', 'Sender ID', 'প্রেরকের আইডি', 'identificación del remitente', 'هوية المرسل', 'प्रेषक आईडी', 'بھیجنے والے کی شناخت', '发件人ID', '送信者ID', 'ID do remetente', 'Удостоверение личности отправителя', 'Identifiant dexpéditeur', '보낸 사람 ID', 'Absenderidentität', 'identità del mittente', 'ID ผู้ส่ง', 'Sender ID', 'zender ID', 'id mittens', 'ID pengirim', 'Gönderen Kimliği', 'ταυτότητα αποστολέα', 'شناسه فرستنده', 'ID penghantar', 'పంపినవారు ID', 'அனுப்பியவர் ஐடி', 'પ્રેષક ID', 'Identyfikator nadawcy', 'Ідентифікатор відправника', 'ਭੇਜਣ ਵਾਲਾ ID', 'ID-ul expeditorului', 'ပေးပို့သူ ID', 'Olu ID', 'Mai aikawa ID'),
(147, 'activate', 'Activate', 'সক্রিয় করুন', 'Activar', 'تفعيل', 'सक्रिय', 'چالو کریں', '启用', 'アクティブ化する', 'Ativar', 'активировать', 'Activer', '활성화', 'aktivieren Sie', 'Attivare', 'กระตุ้น', 'Aktiválja', 'Activeren', 'strenuus', 'Mengaktifkan', 'etkinleştirmek', 'Θέτω εις ενέργειαν', 'فعالسازی', 'Aktifkan', 'సక్రియం', 'செயல்படுத்த', 'સક્રિય કરો', 'Aktywuj', 'Активувати', 'ਸਰਗਰਮ ਕਰੋ', 'Activati', 'ကိုသက်ဝင်', 'Muu ṣiṣẹ', 'Kunna'),
(148, 'label', 'Lavel', 'লেভেল', 'Lavel', 'Lavel', 'Lavel', 'لیلیل', 'Lavel', 'Lavel', 'Lavel', 'Lavel', 'Lavel', 'Lavel', 'Lavel', 'Lavel', 'Lavel', 'lavel', 'Lavel', 'Lavel', 'Lavel', 'lavel', 'Lavel', 'لاوئل', 'Lavel', 'Lavel', 'Lavel', 'લેવેલ', 'Lavel', 'Лавел', 'ਲੇਵਲ', 'Lavel', 'Lavel', 'Lavel', 'Lavel'),
(149, 'session_year', 'Session Year', 'সেশন বছর', 'Año de la sesión', 'سنة الدورة', 'सत्र वर्ष', 'اجلاس کا سال', '会议年', 'セッション年', 'Ano da sessão', 'Сезонность', 'Année de la session', '세션 연도', 'Sitzungsjahr', 'Anno di sessione', 'ปีการศึกษา', 'Session Year', 'Sessiejaar', 'Anno Sessio', 'Sesi Tahun', 'Oturum Yılı', 'Έτος συνεδρίας', 'سال نشست', 'Tahun Sesi', 'సెషన్ ఇయర్', 'அமர்வு ஆண்டு', 'સત્ર વર્ષ', 'Rok sesji', 'Сесія року', 'ਸੈਸ਼ਨ ਸਾਲ', 'Anul Sesiunii', 'session တစ်နှစ်တာ', 'Akoko Odun', 'Zama Na Zama'),
(150, 'is_default', 'Is Default?', 'ডিফল্ট কি?', 'Es predeterminado?', 'هل الافتراضي؟', 'डिफ़ॉल्ट है?', 'پہلے سے طے شدہ ہے؟', '是默认的？', 'デフォルトですか？', 'O padrão é?', 'По умолчанию?', 'Est par défaut?', '디폴트인가?', 'Ist Standard?', 'È predefinito?', 'เป็นค่าเริ่มต้นหรือไม่?', 'Alapértelmezés?', 'Is standaard?', 'Default est?', 'Apakah Default?', 'Varsayılan mı?', 'Είναι προεπιλογή;', 'پیش فرض', 'Adakah Default?', 'డిఫాల్ట్?', 'இயல்புநிலையா?', 'ડિફૉલ્ટ છે?', 'Czy domyślne?', 'За замовчуванням?', 'ਕੀ ਡਿਫਾਲਟ ਹੈ?', 'Este implicit?', 'ပုံမှန်ဖြစ်သနည်း', 'Ni aiyipada?', 'Shin Default?'),
(151, 'module', 'Module', 'মডিউল', 'Módulo', 'وحدة', 'मॉड्यूल', 'ماڈیول', '模', 'モジュール', 'Módulo', 'модуль', 'Module', '기준 치수', 'Modul', 'Modulo', 'โมดูล', 'modul', 'module', 'OMNIBUS', 'Modul', 'modül', 'Μονάδα μέτρησης', 'ماژول', 'Modul', 'మాడ్యూల్', 'தொகுதி', 'મોડ્યુલ', 'Moduł', 'Модуль', 'ਮੋਡੀਊਲ', 'Modul', 'module တစ်ခု', 'Module', 'Module'),
(152, 'function', 'Function', 'কর্তব্যপালন', 'Función', 'وظيفة', 'समारोह', 'فنکشن', '功能', '関数', 'Função', 'функция', 'Fonction', '기능', 'Funktion', 'Funzione', 'ฟังก์ชัน', 'Funkció', 'Functie', 'Officium', 'Fungsi', 'fonksiyon', 'Λειτουργία', 'عملکرد', 'Fungsi', 'ఫంక్షన్', 'விழா', 'કાર્ય', 'Funkcjonować', 'Функція', 'ਫੰਕਸ਼ਨ', 'Funcţie', 'လုပ်ဆောင်ချက်', 'Išẹ', 'Yanayi'),
(153, 'confirm', 'Confirm', 'নিশ্চিত করা', 'Confirmar', 'تؤكد', 'की पुष्टि करें', 'تصدیق کریں', '确认', '確認', 'confirme', 'подтвердить', 'Confirmer', '확인', 'Bestätigen', 'Confermare', 'ยืนยัน', 'megerősít', 'Bevestigen', 'Constituo', 'Memastikan', 'Onaylamak', 'Επιβεβαιώνω', 'تایید', 'Sahkan', 'నిర్ధారించండి', 'உறுதிப்படுத்தவும்', 'પુષ્ટિ કરો', 'Potwierdzać', 'Підтвердьте', 'ਪੁਸ਼ਟੀ ਕਰੋ', 'A confirma', 'အတည်ပြု', 'Jẹrisi', 'Tabbatar'),
(154, 'database', 'Database', 'ডেটাবেস', 'Base de datos', 'قاعدة البيانات', 'डेटाबेस', 'ڈیٹا بیس', '数据库', 'データベース', 'Base de dados', 'База данных', 'Base de données', '데이터 베이스', 'Datenbank', 'Banca dati', 'ฐานข้อมูล', 'adatbázis', 'Database', 'database', 'Database', 'Veritabanı', 'Βάση δεδομένων', 'بانک اطلاعاتی', 'Pangkalan data', 'డేటాబేస్', 'டேட்டாபேஸ்', 'ડેટાબેઝ', 'Baza danych', 'База даних', 'ਡਾਟਾਬੇਸ', 'Bază de date', 'ဒေတာဘေ့စ', 'Aaye data', 'Database'),
(155, 'download', 'Download', 'ডাউনলোড', 'Descargar', 'تحميل', 'डाउनलोड', 'ڈاؤن لوڈ کریں', '下载', 'ダウンロード', 'Download', 'Скачать', 'Télécharger', '다운로드', 'Herunterladen', 'Scaricare', 'ดาวน์โหลด', 'Letöltés', 'Download', 'download', 'Download', 'İndir', 'Κατεβάστε', 'دانلود', 'Muat turun', 'డౌన్లోడ్', 'பதிவிறக்க', 'ડાઉનલોડ કરો', 'Pobieranie', 'Завантажити', 'ਡਾਊਨਲੋਡ ਕਰੋ', 'Descarca', 'ဒေါင်းလုပ်', 'Gba lati ayelujara', 'Saukewa'),
(156, 'join_date', 'Joining Date', 'যোগদান তারিখ', 'Dia de ingreso', 'تاريخ الانضمام', 'कार्यग्रहण तिथि', 'شامل ہونے کی تاریخ', '入职日期', '参加日', 'Data de ingresso', 'Дата вступления', 'Date dinscription', '가입 날짜', 'Beitrittsdatum', 'Data di adesione', 'วันที่เข้าร่วม', 'Csatlakozási dátum', 'Lid worden van datum', 'Adhaeret Date', 'Tanggal Bergabung', 'Birleştirme Tarihi', 'Ημερομηνία σύνδεσης', 'تاریخ عضویت', 'Menyertai Tarikh', 'తేదీ చేరడం', 'சேரும் தேதி', 'તારીખ જોડાયા', 'Data przyłączenia', 'Дата приєднання', 'ਦਾਖਲ ਹੋਣ ਦੀ ਤਾਰੀਖ', 'Data îmbinării', 'နေ့စွဲလာရောက်ပူးပေါင်း', 'Ọjọ Ajọpọ', 'Ranar Jiki'),
(157, 'present', 'Present', 'বর্তমান', 'Presente', 'অনুবাদ ত্রুটি', 'वर्तमान', 'موجودہ', '当下', '現在', 'Presente', 'настоящее время', 'Présent', '선물', 'Geschenk', 'Presente', 'นำเสนอ', 'Ajándék', 'Aanwezig', 'praesenti', 'Menyajikan', 'Mevcut', 'Παρόν', 'حاضر', 'Hadir', 'ప్రస్తుతం', 'தற்போதைய', 'હાજર', 'Obecny', 'Подаруй', 'ਵਰਤਮਾਨ', 'Prezent', 'လက်ဆောင်', 'Nisin', 'Gabatarwa'),
(158, 'permanent', 'Permanent', 'স্থায়ী', 'Permanente', 'دائم', 'स्थायी', 'مستقل', '常驻', '恒久的な', 'Permanente', 'перманентный', 'Permanent', '퍼머넌트', 'Permanent', 'Permanente', 'ถาวร', 'Állandó', 'blijvend', 'permanent', 'Permanen', 'kalıcı', 'Μόνιμος', 'دائمی', 'Kekal', 'శాశ్వత', 'நிரந்தர', 'કાયમી', 'Stały', 'Постійний', 'ਸਥਾਈ', 'Permanent', 'အမြဲတမ်း', 'O yẹ', 'Tabbatacce'),
(159, 'gender', 'Gender', 'লিঙ্গ', 'Género', 'جنس', 'लिंग', 'صنف', '性别', '性別', 'Gênero', 'Пол', 'Le genre', '성별', 'Geschlecht', 'Genere', 'เพศ', 'nem', 'Geslacht', 'genus', 'Jenis kelamin', 'Cinsiyet', 'Γένος', 'جنسيت', 'Jantina', 'జెండర్', 'பாலினம்', 'જાતિ', 'Płeć', 'Стать', 'ਲਿੰਗ', 'Gen', 'ကျား, မ', 'Iwa', 'Gender'),
(160, 'blood_group', 'Blood Group', 'রক্তের গ্রুপ', 'Grupo sanguíneo', 'فصيلة الدم', 'रक्त समूह', 'خون گروپ', '血型', '血液型', 'Grupo sanguíneo', 'Группа крови', 'Groupe sanguin', '혈액형', 'Blutgruppe', 'Gruppo sanguigno', 'กรุ๊ปเลือด', 'Vércsoport', 'Bloedgroep', 'Sanguine coetus', 'Golongan darah', 'Kan grubu', 'Ομάδα αίματος', 'گروه خونی', 'Kumpulan darah', 'రక్తపు గ్రూపు', 'இரத்த வகை', 'બ્લડ ગ્રુપ', 'Grupa krwi', 'Група крові', 'ਬਲੱਡ ਗਰੁੱਪ', 'Grupa sanguină', 'သွေးအုပ်စု', 'Ẹgbẹ Ẹjẹ', 'Kungiyar Blood'),
(161, 'group', 'Group', 'গ্রুপ', 'Grupo', 'مجموعة', 'समूह', 'گروپ', '组', 'グループ', 'Grupo', 'группа', 'Groupe', '그룹', 'Gruppe', 'Gruppo', 'กลุ่ม', 'Csoport', 'Groep', 'Group', 'Kelompok', 'grup', 'Ομάδα', 'گروه', 'Kumpulan', 'గ్రూప్', 'குழு', 'ગ્રુપ', 'Grupa', 'Група', 'ਗਰੁੱਪ', 'grup', 'Group မှ', 'Ẹgbẹ', 'Rukuni'),
(162, 'religion', 'Religion', 'ধর্ম', 'Religión', 'دين', 'धर्म', 'مذہب', '宗教', '宗教', 'Religião', 'религия', 'Religion', '종교', 'Religion', 'Religione', 'ศาสนา', 'Vallás', 'Religie', 'religio', 'Agama', 'Din', 'Θρησκεία', 'دین', 'Agama', 'మతం', 'மதம்', 'ધર્મ', 'Religia', 'Релігія', 'ਧਰਮ', 'Religie', 'ဘာသာ', 'Esin', 'Addini'),
(163, 'birth_date', 'Birth Date', 'জন্ম তারিখ', 'Fecha de nacimiento', 'تاريخ الميلاد', 'जन्म दिन', 'تاریخ پیدائش', '生日', '誕生日', 'Data de nascimento', 'Дата рождения', 'Date de naissance', '생일', 'Geburtsdatum', 'Data di nascita', 'วันที่เกิด', 'Születési dátum', 'Geboortedatum', 'Dies natalis, diei natalis, m', 'Tanggal lahir', 'Doğum günü', 'Ημερομηνία γέννησης', 'تاریخ تولد', 'Tarikh lahir', 'పుట్టిన తేదీ', 'பிறந்த தேதி', 'જન્મતારીખ', 'Data urodzenia', 'Дата народження', 'ਜਨਮ ਮਿਤੀ', 'Data nasterii', 'မွေးရက်', 'Ojo ibi', 'Ranar haifuwa'),
(164, 'resume', 'Resume', 'জীবনবৃত্তান্ত', 'Currículum', 'استئنف', 'बायोडाटा', 'دوبارہ شروع کریں', '恢复', '履歴書', 'Currículo', 'Продолжить', 'CV', '이력서', 'Fortsetzen', 'Curriculum vitae', 'ประวัติย่อ', 'Önéletrajz', 'Hervat', 'Proin', 'Lanjut', 'Devam et', 'ΒΙΟΓΡΑΦΙΚΟ', 'خلاصه', 'Teruskan', 'పునఃప్రారంభం', 'தற்குறிப்பு', 'ફરી શરુ કરવું', 'Wznawianie', 'Резюме', 'ਮੁੜ ਸ਼ੁਰੂ ਕਰੋ', 'Relua', 'ပြန်စသည်', 'Tun pada', 'Tsayawa'),
(165, 'other_info', 'Other Info', 'অন্যান্য তথ্য', 'Otra información', 'معلومات اخرى', 'अन्य सूचना', 'دیگر معلومات', '其他信息', '他の情報', 'Outras informações', 'Дополнительная информация', 'Autre info', '기타 정보', 'Andere Information', 'Altre informazioni', 'ข้อมูลอื่น ๆ', 'Más információ', 'Andere informatie', 'alii Info', 'Info lain', 'Diğer Bilgiler', 'Άλλες πληροφορίες', 'سایر اطلاعات', 'Maklumat Lain', 'ఇతర సమాచారం', 'மற்ற தகவல்', 'અન્ય માહિતી', 'Inne informacje', 'Інша інформація', 'ਹੋਰ ਜਾਣਕਾਰੀ', 'Alte informații', 'အခြားအအင်ဖို', 'Alaye miiran', 'Sauran Bayanan'),
(166, 'numeric', 'Numeric', 'সাংখ্যিক', 'Numérico', 'رقمية', 'संख्यात्मक', 'تعداد', '数字', '数値', 'Numérico', 'числовой', 'Numérique', '숫자', 'Numerisch', 'Numerico', 'เป็นตัวเลข', 'numerikus', 'numerieke', 'Ordo numerorum', 'Numerik', 'Sayısal', 'Αριθμητικός', 'عددی', 'Angka', 'సంఖ్యా', 'எண்', 'સંખ્યાત્મક', 'Numeryczne', 'Чисельний', 'ਨੁਮਾਇਕ', 'Numeric', 'ဂဏန်း', 'Nọmba', 'Numeric'),
(167, 'code', 'Code', 'কোড', 'Código', 'الشفرة', 'कोड', 'کوڈ', '码', 'コード', 'Código', 'Код', 'Code', '암호', 'Code', 'Codice', 'รหัส', 'Kód', 'Code', 'Code', 'Kode', 'kod', 'Κώδικας', 'کد', 'Kod', 'కోడ్', 'குறியீடு', 'કોડ', 'Kod', 'Код', 'ਕੋਡ', 'Cod', 'ကုဒ်', 'Koodu', 'Code'),
(168, 'pass_mark', 'Pass Mark', 'পাশ নম্বর', 'Aprobado', 'علامة المرور', 'उतीर्णांक', 'نشان مارک', '合格标志', 'パスマーク', 'Pass Mark', 'Проходной балл', 'Moyenne', '패스 마크', 'Mindestpunktzahl', 'Punteggio minimo', 'ผ่านมาร์ค', 'Minimális pontszám', 'Pass Mark', 'Mark Tempus', 'Pass Mark', 'Geçme notu', 'Περάστε το σήμα', 'علامت گذاری به عنوان', 'Pas Mark', 'పాస్ మార్క్', 'தேர்ச்சி மதிப்பெண்', 'પાસ માર્ક', 'Przekaż Marka', 'Пройти марку', 'ਮਾਰਕ ਪਾਸ ਕਰੋ', 'Nota de trecere', 'မာကုဖြတ်သွား', 'Ṣe ami Marku', 'Alamar tafiya'),
(169, 'full_mark', 'Full Mark', 'পুরো নম্বর', 'Marca completa', 'درجة كاملة', 'पूर्ण अंक', 'مکمل نشان', '满分', '満点', 'Nota máxima', 'Отметить все', 'Pleine marque', '만점', 'Volle Markierung', 'Full Mark', 'เครื่องหมายเต็มรูปแบบ', 'Teljes Mark', 'Volle markering', 'Mark plena', 'Tanda penuh', 'Tam not', 'Πλήρες σήμα', 'علامت کامل', 'Mark penuh', 'పూర్తి మార్కులు', 'முழு மதிப்பெண்', 'સંપૂર્ણ માર્ક', 'Pełny znak', 'Повний Марк', 'ਪੂਰਾ ਮਾਰਕ', 'Nota maxima', 'အပြည့်အဝမာကု', 'Samisi Kikun', 'Alamar cikakke'),
(170, 'author', 'Author', 'লেখক', 'Autor', 'مؤلف', 'लेखक', 'مصنف', '作者', '著者', 'Autor', 'автор', 'Auteur', '저자', 'Autor', 'Autore', 'ผู้เขียน', 'Szerző', 'Auteur', 'auctor', 'Penulis', 'Yazar', 'Συγγραφέας', 'نویسنده', 'Pengarang', 'రచయిత', 'ஆசிரியர்', 'લેખક', 'Autor', 'Автор', 'ਲੇਖਕ', 'Autor', 'စာရေးသူ', 'Onkọwe', 'Mawallafin'),
(171, 'day', 'Day', 'দিন', 'Día', 'يوم', 'दिन', 'دن', '天', '日', 'Dia', 'День', 'Dayjournée', '일', 'Tag', 'Giorno', 'วัน', 'Nap', 'Dag', 'Dies', 'Hari', 'Gün', 'Ημέρα', 'روز', 'Hari', 'డే', 'தினம்', 'દિવસ', 'Dzień', 'День', 'ਦਿਨ', 'Zi', 'နေ့', 'Ọjọ', 'Ranar'),
(172, 'start_time', 'Start Time', 'সময় শুরু', 'Hora de inicio', 'وقت البدء', 'समय शुरू', 'وقت آغاز', '开始时间', '始まる時間', 'Hora de início', 'Время начала', 'Heure de début', '시작 시간', 'Startzeit', 'Ora di inizio', 'เวลาเริ่มต้น', 'Kezdési idő', 'Starttijd', 'Satus tempus', 'Waktu mulai', 'Başlama zamanı', 'Ωρα έναρξης', 'زمان شروع', 'Masa mula', 'సమయం ప్రారంభించండి', 'ஆரம்பிக்கும் நேரம்', 'પ્રારંભ સમય', 'Czas rozpoczęcia', 'Час початку', 'ਸ਼ੁਰੂਆਤੀ ਸਮਾਂ', 'Timpul de începere', 'start ကိုအချိန်', 'Aago Ibẹrẹ', 'Fara lokaci'),
(173, 'end_time', 'End Time', 'শেষ সময়', 'Hora de finalización', 'وقت النهاية', 'अंतिम समय', 'آخر وقت', '时间结束', '終了時間', 'Fim do tempo', 'Время окончания', 'Heure de fin', '종료 시간', 'Endzeit', 'Fine del tempo', 'เวลาสิ้นสุด', 'Idő vége', 'Eindtijd', 'finis Tempus', 'Akhir waktu', 'Bitiş zamanı', 'Τέλος χρόνου', 'زمان پایان', 'Masa tamat', 'ముగింపు సమయం', 'முடிவு நேரம்', 'સમાપ્તિ સમય', 'Koniec czasu', 'Кінець часу', 'ਅੰਤ ਸਮਾਂ', 'Ora de terminare', 'အဆုံးအချိန်', 'Aago ipari', 'Ƙarshen lokaci'),
(174, 'start_date', 'Start Date', 'শুরুর তারিখ', 'Fecha de inicio', 'تاريخ البدء', 'आरंभ करने की तिथि', 'شروع کرنے کی تاریخ', '开始日期', '開始日', 'Data de início', 'Дата начала', 'Date de début', '시작 날짜', 'Anfangsdatum', 'Data dinizio', 'วันที่เริ่มต้น', 'Kezdő dátum', 'Begin datum', 'Date incipere', 'Mulai tanggal', 'Başlangıç tarihi', 'Ημερομηνία έναρξης', 'تاریخ شروع', 'Tarikh mula', 'ప్రారంబపు తేది', 'தொடக்க தேதி', 'પ્રારંભ તારીખ', 'Data rozpoczęcia', 'Дата початку', 'ਤਾਰੀਖ ਸ਼ੁਰੂ', 'Data de început', 'စတင်သည့်ရက်စွဲ', 'Ọjọ Bẹrẹ', 'Fara Farawa'),
(175, 'end_date', 'End Date', 'শেষ তারিখ', 'Fecha final', 'تاريخ الانتهاء', 'अंतिम तिथि', 'آخری تاریخ', '结束日期', '終了日', 'Data final', 'Дата окончания', 'Date de fin', '종료일', 'Endtermin', 'Data di fine', 'วันที่สิ้นสุด', 'Befejezés dátuma', 'Einddatum', 'finis Date', 'Tanggal akhir', 'Bitiş tarihi', 'Ημερομηνία λήξης', 'تاریخ پایان', 'Tarikh tamat', 'ఆఖరి తేది', 'கடைசி தேதி', 'અંતિમ તારીખ', 'Data końcowa', 'Дата закінчення', 'ਅੰਤ ਦੀ ਮਿਤੀ', 'Data de încheiere', 'အဆုံးနေ့စွဲ', 'Ọjọ ipari', 'Ƙarshe Ranar'),
(176, 'relation', 'Relation', 'সম্পর্ক', 'Relación', 'علاقة', 'रिश्ता', 'تعلقات', '关系', '関係', 'Relação', 'Связь', 'Relation', '관계', 'Beziehung', 'Relazione', 'ความสัมพันธ์', 'Kapcsolat', 'Relatie', 'relatione', 'Hubungan', 'ilişki', 'Σχέση', 'رابطه', 'Hubungan', 'రిలేషన్', 'உறவு', 'સંબંધ', 'Relacja', 'Відносини', 'ਸਬੰਧ', 'Relație', 'ဆှေမြိုး', 'Ibasepo', 'Hada dangantaka'),
(177, 'profession', 'Profession', 'পেশা', 'Profesión', 'مهنة', 'व्यवसाय', 'پیشہ', '职业', '職業', 'Profissão', 'профессия', 'Métier', '직업', 'Beruf', 'Professione', 'อาชีพ', 'Szakma', 'Beroep', 'professionis', 'Profesi', 'Meslek', 'Επάγγελμα', 'حرفه', 'Profesion', 'వృత్తి', 'தொழில்', 'વ્યવસાય', 'Zawód', 'Професія', 'ਪੇਸ਼ਾ', 'Profesie', 'အလုပ်အကိုင်', 'Oṣiṣẹ', 'Zama'),
(178, 'roll_no', 'Roll No', 'ক্রমিক নাম্বার', 'Rollo No', 'رول نو', 'अनुक्रमांक', 'رول نمبر نہیں', '卷号', 'ロールNo', 'Roll No', 'Нет', 'Rouler Non', '롤 아니요', 'Rolle Nr', 'Rotolo n', 'ฉบับที่ไม่มี', 'Roll No', 'Roll No', 'Nulla volvunt', 'Roll No', 'Rulo Hayır', 'ρολό αριθ', 'رول نه', 'Roll No', 'రోల్ నం', 'ரோல் இல்லை', 'રોલ નં', 'Rzuć nr', 'ролл немає', 'ਰੋਲ ਨੰਬਰ ਨਹੀਂ', 'Rola numărul', 'အဘယ်သူမျှမလှိမ့်ပုံ', 'Roll Bẹẹkọ', 'Roll Babu'),
(179, 'registration_no', 'Registration No', 'নিবন্ধন নম্বর', 'Número de registro', 'رقم التسجيل', 'पंजीकरण क्रमांक', 'رجسٹریشن نمبر', '注册号', '登録番号', 'número de registro', 'номер регистрации', 'N ° denregistrement', '등록 번호', 'Registrierungsnr', 'Registrazione N', 'หมายเลขทะเบียน', 'regisztrációs szám', 'Registratienummer', 'No registration', 'Pendaftaran No', 'kayıt numarası', 'αριθμός καταχώρησης', 'شماره ثبت نام', 'Nombor pendaftaran', 'నమోదు సంఖ్య', 'பதிவு எண்', 'નોંધણી નં', 'Numer rejestracyjny', 'Номер реєстрації', 'ਰਜਿਸਟਰੇਸ਼ਨ ਨੰਬਰ', 'nr. de inregistrare', 'မှတ်ပုံတင်ခြင်းအဘယ်သူမျှမ', 'Iforukọ silẹ Ko si', 'Lambar rajista'),
(180, 'present_all', 'Present All', 'উপস্থিত সকল', 'Presente todo', 'الحالي الكل', 'सभी को प्रस्तुत करें', 'سب پیش', '现在所有', 'すべてを表示', 'Presente tudo', 'Представить все', 'Présenter tout', '모두 선물하기', 'Alle präsentieren', 'Presente tutto', 'นำเสนอทั้งหมด', 'Jelenleg mindet', 'Presenteer alles', 'nunc omnes', 'Hadir Semua', 'Hepsini Sunun', 'Παρουσιάστε όλα', 'در حال حاضر همه', 'Hadir Semua', 'అందరికీ అందించండి', 'அனைவருக்கும் வழங்கவும்', 'બધા હાજર', 'Przedstaw wszystko', 'Подаруй все', 'ਸਭ ਪੇਸ਼ ਕਰੋ', 'Prezentați-vă pe toți', 'ပစ္စုပ္ပန်အားလုံး', 'Paa Gbogbo', 'Duk Dukkan'),
(181, 'late_all', 'Late All', 'বিলম্বিত সকল', 'Late All', 'أواخر الكل', 'स्वर्गीय सभी', 'دیر سے', '所有的晚', '後期', 'Late All', 'Поздно все', 'Tard tout', '늦게 모두', 'Spät alle', 'Tutto in ritardo', 'ปลายทั้งหมด', 'Késő minden', 'Laat alles', 'late omnes', 'Terlambat semua', 'Hep Geç', 'Αργά Όλα', 'اواخر همه', 'Akhir semua', 'లేట్ అన్నీ', 'அனைவருக்கும்', 'લેટ ઓલ', 'Późno wszystkim', 'Пізно все', 'ਦੇਰ ਸਾਰੇ', 'Totul târziu', 'နှောင်းပိုင်းတွင်အားလုံး', 'Paa Gbogbo', 'Late Duk'),
(182, 'absent_all', 'Absent All', 'অনুপস্থিত সকল', 'Ausente todo', 'غائب الجميع', 'सभी अनुपस्थित', 'سب کو مطمئن', '缺席全部', 'すべてが不在', 'Absent All', 'Отсутствует все', 'Absent Tous', '모두 없슴', 'Alles fehlt', 'Assente tutti', 'ขาดทั้งหมด', 'Mindenki hiányzik', 'Afwezig allemaal', 'aberant aegrae', 'Tidak ada', 'Herkesten Yoksun', 'Απουσία όλων', 'همه وجود ندارند', 'Absent All', 'అబ్సెంట్ అన్నీ', 'எல்லாவற்றையும் விட', 'બધા ગેરહાજર', 'Nieobecny', 'Немає всіх', 'ਸਾਰੀ ਗੈਰਹਾਜ਼ਰੀ', 'Absent Toate', 'ပျက်ကွက်အားလုံး', 'Ti ko ni Gbogbo', 'Bazuwa Duk'),
(183, 'deadline', 'Deadline', 'শেষ তারিখ', 'Fecha tope', 'الموعد النهائي', 'समयसीमा', 'ڈیڈ لائن', '截止日期', '締め切り', 'Data limite', 'Крайний срок', 'Date limite', '마감 시간', 'Frist', 'Scadenza', 'วันกำหนดส่ง', 'Határidő', 'Deadline', 'deadline', 'Batas waktu', 'Son tarih', 'Προθεσμία', 'ضرب الاجل', 'Tarikh akhir', 'గడువు', 'காலக்கெடுவை', 'અન્તિમ રેખા', 'Ostateczny termin', 'Термін дії', 'ਡੈੱਡਲਾਈਨ', 'Termen limita', 'သတ်မှတ်နောက်ဆုံးအချိန်', 'Ọjọ ipari', 'Kwanan lokaci'),
(184, 'grade_point', 'Grade Point', 'গ্রেড পয়েন্ট', 'Punto de Grado', 'تراكمي', 'मूल्यांकन', 'گریڈ پوائنٹ', '成绩点', 'グレードポイント', 'Ponto de classificação', 'Точка оценки', 'Grade Point', '학점', 'Notenpunkt', 'Grado', 'Grade Point', 'Grade Point', 'Grade punt', 'gradus punctum', 'Indeks Prestasi', 'Grade Point', 'Σημείο βαθμού', 'نقطه درجه', 'Gred Point', 'గ్రేడ్ పాయింట్', 'கிரேடு புள்ளி', 'ગ્રેડ પોઇન્ટ', 'Punkt Grade', 'Градуйова точка', 'ਗਰੇਡ ਪੁਆਇੰਟ', 'Punct de punctaj', 'တန်း Point သို့', 'Iwe Ipele', 'Alamar Jagora'),
(185, 'mark_from', 'Mark From', 'মার্ক থেকে', 'Marcar de', 'علامة من', 'मार्क से', 'سے نشان زد کریں', '马克从', 'マークする', 'Mark From', 'Отметить от', 'Mark From', '마크부터', 'Mark von', 'Mark From', 'ทำเครื่องหมายจาก', 'Mark From', 'Markeer van', 'Mark ex', 'Mark dari', 'İşaretle', 'Σημειώστε από', 'مارک از', 'Tanda dari', 'నుండి మార్క్', 'இருந்து மார்க்', 'માર્ક ફ્રોમ', 'Mark From', 'Позначка з', 'ਮਾਰਕ ਤੋ', 'Marchează din', 'မှစ. , Mark', 'Samisi Lati', 'Alama Daga'),
(186, 'mark_to', 'Mark To', 'মার্ক পর্যন্ত', 'Marcar a', 'مارك تو', 'मार्क टू', 'نشان زد کریں', '标记为', 'マークする', 'Mark To', 'Отметить', 'Mark To', '표시 대상', 'Zu markieren', 'Mark To', 'ทำเครื่องหมายว่าต้องการ', 'Jelölje meg', 'Mark To', 'Mark Ad', 'Mark To', 'Mark To', 'Mark To', 'علامت گذاری به عنوان', 'Mark To', 'మార్క్ టు', 'மார்க் டூ', 'માર્ક ટુ', 'Mark To', 'Позначити до', 'ਮਾਰਕ ਕਰਨ ਲਈ', 'Marchează la', 'မာကုရန်', 'Samisi Lati', 'Alama Don'),
(187, 'room_no', 'Room No', 'কক্ষ নম্বর', 'Habitación no', 'غرفة رقم', 'कमरा क्रमांक', 'کمرہ نمبر', '房间号', '部屋番号', 'Quarto Não', 'Комната нет', 'Chambre numéro', '객실 번호', 'Raum Nummer', 'Stanza No', 'เบอร์ห้อง', 'Szobaszám', 'Kamer nummer', 'nullus locus', 'Kamar no', 'Oda numarası', 'Αριθμός δωματίου', 'شماره اتاق', 'Nombor bilik', 'గది సంఖ్య', 'அறை இல்லை', 'રૂમ નં', 'Pokój numer', 'Кімната №', 'ਕਮਰਾ ਨੰਬਰ', 'Cameră nr', 'ROOM တွင်အဘယ်သူမျှမ', 'Yara Bẹẹkọ', 'Room Babu'),
(188, 'attend_all', 'Attend All', 'উপস্থিত সকল', 'Asistir a todos', 'حضور الجميع', 'सभी में शामिल हों', 'Attend All', '全部参加', 'すべてに出席する', 'Participe de todos', 'Все участники', 'Assister à tous', '모두 참석', 'An allen teilnehmen', 'Partecipare a tutti', 'เข้าร่วมทั้งหมด', 'Vegyen részt mindenben', 'Woon iedereen bij', 'adtende omnes', 'Menghadiri Semua', 'Herkese Katıl', 'Παρακολουθήστε όλους', 'حضور در همه', 'Hadiri Semua', 'అన్ని హాజరు', 'எல்லாவற்றிலும் கலந்துகொள்ளுங்கள்', 'બધા હાજરી', 'Weź udział w wszystkim', 'Відвідати все', 'ਸਾਰੇ ਹਾਜ਼ਰ ਹੋਵੋ', 'Participați la toate', 'အားလုံးတက်ရောက်ရန်', 'Lọ gbogbo', 'Ku halarci Duk'),
(189, 'mark_total', 'Mark Total', 'মোট মার্ক', 'Mark Total', 'مارك المجموع', 'कुल मार्क', 'کل مارک', '马克总', 'マーク合計', 'Mark Total', 'Марка Всего', 'Mark Total', '마크 합계', 'Gesamtmarkierung', 'Mark Total', 'Mark Total', 'Mark Összesen', 'Markeer Total', 'Mark Summa', 'Mark Total', 'Mark Total', 'Σημείωση Σύνολο', 'مارک کل', 'Mark Jumlah', 'మొత్తం మార్క్', 'மொத்தம் மார்க்', 'કુલ ચિહ્ન', 'Mark Total', 'Марк Тотал', 'ਕੁੱਲ ਮਿਲਾਓ', 'Marchează total', 'မာကုစုစုပေါင်း', 'Samisi Kolopin', 'Mark Total'),
(190, 'mark_obtain', 'Mark Obtain', 'প্রাপ্ত মার্ক', 'Mark Obtain', 'الحصول على علامة', 'मार्क ओब्टेन', 'نشان زد کریں', '马克获得', 'マーク取得', 'Mark Obtain', 'Mark Получить', 'Mark Obtain', '마크 획득', 'Mark Erhalten', 'Mark Ottieni', 'Mark Obtain', 'Mark Obtain', 'Markeer verkrijgen', 'Mark Vitam', 'Mark mendapatkan', 'Mark Al', 'Σημάδι αποκτήστε', 'علامت گذاری به دست آوردن', 'Mark Obtain', 'గుర్తు పొందండి', 'மார்க் பெறவும்', 'માર્ક ઑબ્ટેન', 'Mark Obtain', 'Позначте ', 'ਮਾਰਕ ਆਬਟੈੱਨ', 'Marchează Obțineți', 'မာကုရယူပါ', 'Samisi Gba', 'Mark Obtain'),
(191, 'remark', 'Remark', 'মন্তব্য', 'Observación', 'تعليق', 'टिप्पणी', 'تبصرہ', '备注', 'リマーク', 'Observação', 'замечание', 'Remarque', '말', 'Anmerkung', 'osservazione', 'ข้อสังเกต', 'Megjegyzés', 'Opmerking', 'Attende', 'Ucapan', 'düşünce', 'Παρατήρηση', 'یادداشت', 'Catatan', 'వ్యాఖ్య', 'கருத்து', 'રીમાર્ક', 'Uwaga', 'Зауваження', 'ਟਿੱਪਣੀ', 'Remarcă', 'ပွောဆို', 'Atokasi', 'Alamar'),
(192, 'option', 'Option', 'পছন্দ', 'Opción', 'اختيار', 'विकल्प', 'اختیار', '选项', 'オプション', 'Opção', 'вариант', 'Option', '선택권', 'Möglichkeit', 'Opzione', 'ตัวเลือก', 'választási lehetőség', 'Keuze', 'optionem', 'Pilihan', 'seçenek', 'Επιλογή', 'گزینه', 'Pilihan', 'ఎంపిక', 'விருப்பம்', 'વિકલ્પ', 'Opcja', 'Варіант', 'ਚੋਣ', 'Opțiune', 'option ကို', 'Aṣayan', 'Zaži'),
(193, 'running_session', 'Running Session', 'চলমান সেশন', 'Sesión en ejecución', 'تشغيل الدورة', 'चल रहा सत्र', 'چل رہا ہے اجلاس', '运行会话', 'ランニングセッション', 'Sessão de corrida', 'Запуск сеанса', 'Session en cours', '러닝 세션', 'Sitzung wird ausgeführt', 'Esecuzione della sessione', 'การเรียกใช้เซสชัน', 'Futtatás', 'Sessie uitvoeren', 'currens Sessio', 'Menjalankan sesi', 'Oturum Devam Ediyor', 'Εκτέλεση συνόδου', 'در حال اجرا', 'Sesi Berjalan', 'సెషన్ రన్నింగ్', 'அமர்வு இயக்குதல்', 'સત્ર ચાલી રહ્યું છે', 'Prowadzenie sesji', 'Запуск сесії', 'ਚੱਲ ਰਹੇ ਸੈਸ਼ਨ', 'Sesiunea de desfășurare', 'အပြေးတွေ့ဆုံဆွေးနွေးပွဲ', 'Ipade Nṣiṣẹ', 'Zangon Zama'),
(194, 'promote_to_session', 'Promote to Session', 'উন্নীতকরণ  সেশন', 'Promover a la sesión', 'الترقية إلى الجلسة', 'सत्र को बढ़ावा देना', 'اجلاس میں فروغ دیں', '促进会议', 'セッションに昇進', 'Promover a Sessão', 'Поощрять сессию', 'Promouvoir à la session', '세션으로 승격', 'Zu einer Sitzung hochstufen', 'Promuovi alla sessione', 'โปรโมตเซสชัน', 'Előmozdítása a munkamenethez', 'Promoten naar sessie', 'Sessio autem Promovere', 'Promosikan untuk Sesi', 'Oturuma Teşvik Et', 'Προωθήστε στη σύνοδο', 'ارتقا به جلسه', 'Menggalakkan Sesi', 'సెషన్కు ప్రచారం చేయండి', 'அமர்வுக்கு ஊக்குவிக்கவும்', 'સત્રમાં પ્રમોટ કરો', 'Promuj do sesji', 'Реклама на сеанс', 'ਸੈਸ਼ਨ ਨੂੰ ਪ੍ਰਮੋਟ ਕਰੋ', 'Promovați la sesiune', 'တွေ့ဆုံဆွေးနွေးပွဲမှမြှင့်တင်', 'Igbelaruge si Ipade', 'Ƙaddamar zuwa Zama'),
(195, 'current_class', 'Current Class', 'বর্তমান শ্রেণী', 'Clase actual', 'الفئة الحالية', 'वर्तमान कक्षा', 'موجودہ کلاس', '当前类', '現在のクラス', 'Classe atual', 'Текущий класс', 'Classe actuelle', '현재 수업', 'Aktuelle Klasse', 'Classe corrente', 'ระดับปัจจุบัน', 'Jelenlegi osztály', 'Huidige klasse', 'Current Paleonemertea Class', 'Kelas sekarang', 'Mevcut Sınıf', 'Τρέχουσα κλάση', 'کلاس کنونی', 'Kelas Semasa', 'ప్రస్తుత క్లాస్', 'தற்போதைய வகுப்பு', 'વર્તમાન વર્ગ', 'Aktualna klasa', 'Поточний клас', 'ਮੌਜੂਦਾ ਕਲਾਸ', 'Clasa curentă', 'လက်ရှိအတန်းအစား', 'Akoko lọwọlọwọ', 'Kwanan Yanzu'),
(196, 'promote_to_class', 'Promote To Class', 'উন্নীতকরণ  শ্রেণী', 'Promover a clase', 'الترقية إلى الفصل', 'कक्षा को बढ़ावा देना', 'کلاس میں فروغ دیں', '促进上课', 'クラスに昇格', 'Promover para a classe', 'Повысить класс', 'Promouvoir en classe', '클래스로 승격', 'In die Klasse hochstufen', 'Promuovi in classe', 'โปรโมตในชั้นเรียน', 'Promóció az osztályba', 'Promoot Class', 'Promovere Ad Paleonemertea Class', 'Promosikan ke Kelas', 'Sınıfı Tanıyalım', 'Προωθήστε στην κλάση', 'ارتقا به کلاس', 'Menggalakkan Ke Kelas', 'క్లాస్కి ప్రచారం చేయండి', 'வகுப்புக்கு ஊக்குவிக்கவும்', 'વર્ગ માટે પ્રોત્સાહન', 'Promuj do klasy', 'Реклама в класі', 'ਕਲਾਸ ਨੂੰ ਵਧਾਓ', 'Promovați la clasă', 'အတန်းအစားစေရန်မြှင့်တင်ရန်', 'Igbelaruge Lati Kilasi', 'Ƙaddamar da Ƙungiya'),
(197, 'next_roll_no', 'Next Roll No', 'পরবর্তী রোল', 'Siguiente rollo No', 'التالي لفة لا', 'अगला रोल नंबर', 'اگلے رول نمبر', '下一卷No', '次のロール番号', 'Next Roll No', 'Следующий ролл Нет', 'Prochain rouleau No', '다음 롤 없음', 'Nächste Rolle Nr', 'Next Roll No', 'ฉบับต่อไป No', 'Következő Roll No.', 'Volgende rol Nee', 'Next Roll No', 'Gulungan Berikutnya No', 'Sonraki Rulo Hayır', 'Επόμενος αριθμός ρόλου', 'بعدی رول نه', 'Rol seterusnya No', 'తదుపరి రోల్ సంఖ్య', 'அடுத்த ரோல் இல்லை', 'આગામી રોલ નં', 'Następna rolka nr', 'Наступний рулон немає', 'ਅਗਲਾ ਰੋਲ ਕੋਈ ਨਹੀਂ', 'Următorul Roll Nu', 'Next ကို Roll အဘယ်သူမျှမ', 'Eerun Oke No', 'Nemi na gaba Babu'),
(198, 'promote', 'Promote', 'উন্নীত করা', 'Promover', 'تروج  يشجع  يعزز  ينمى  يطور', 'को बढ़ावा देना', 'فروغ دیں', '促进', 'プロモーション', 'Promover', 'содействовать', 'Promouvoir', '홍보', 'Fördern', 'Promuovere', 'ส่งเสริม', 'Népszerűsít', 'Promoten', 'Promovere', 'Memajukan', 'Desteklemek', 'Προάγω', 'ترویج', 'Menggalakkan', 'ప్రమోట్', 'ஊக்குவிக்க', 'પ્રમોટ કરો', 'Promować', 'Рекламувати', 'ਵਧਾਓ', 'Promova', 'မြှင့်တင်ရန်', 'Igbelaruge', 'Ƙara'),
(199, 'book_id', 'Book ID', 'বই আইডি', 'ID de libro', 'معرف الكتاب', 'बुक आईडी', 'کتاب کی شناخت', '图书ID', '書籍ID', 'ID do livro', 'Книжный идентификатор', 'ID de livre', '도서 ID', 'Buch-ID', 'ID del libro', 'รหัสหนังสือ', 'Könyvazonosító', 'Boek-ID', 'id libri', 'ID buku', 'Kitap kimliği', 'Αναγνωριστικό βιβλίου', 'شناسه کتاب', 'ID Buku', 'బుక్ ID', 'புத்தக ஐடி', 'બુક ID', 'Identyfikator książki', 'Ідентифікатор книги', 'ਬੁੱਕ ID', 'Carte de identitate', 'စာအုပ် ID ကို', 'Iwe iD', 'ID ID'),
(200, 'isbn_no', 'ISBN No', 'আইএসবিএন নম্বর', 'ISBN No', 'رقم إيسبن لا', 'आईएसबीएन नहीं', 'ISBN نمبر', '书号', 'ISBNいいえ', 'Número ISBN', 'ISBN Нет', 'ISBN Non', 'ISBN 아니오', 'ISBN Nr', 'ISBN n', 'เลข ISBN', 'ISBN szám', 'ISBN nr', 'ISBN No', 'ISBN No', 'ISBN Hayır', 'Αριθμός ISBN', 'ISBN شماره', 'ISBN No', 'ISBN సంఖ్య', 'ISBN இல்லை', 'આઇએસબીએન નં', 'Numer ISBN', 'Номер ISBN', 'ISBN ਨਹੀਂ', 'ISBN nr', 'ISBN အဘယ်သူမျှမ', 'ISBN Bẹẹkọ', 'ISBN Babu'),
(201, 'book_cover', 'Book Cover', 'বইয়ের কভার', 'Tapa del libro', 'غلاف الكتاب', 'पुस्तक आवरण', 'کتاب کاپوشش، کتاب کی جلد', '封面', 'ブックカバー', 'Capa de livro', 'Книжная обложка', 'Couverture de livre', '책 표지', 'Buchumschlag', 'Copertina del libro', 'ปกหนังสือ', 'Könyvborító', 'Boekomslag', 'Libro Cover', 'Sampul buku', 'Kitap kapağı', 'Εξώφυλλο βιβλίου', 'جلد کتاب', 'Kulit buku', 'పుస్తకపు అట్ట', 'புத்தக உறை', 'પુસ્તક કવર', 'Okładka książki', 'Обкладинка книги', 'ਬੁੱਕ ਕਵਰ', 'Coperta cărții', 'စာအုပ်အဖုံး', 'Iwe Ideri iwe', 'Rufin Shafin'),
(202, 'price', 'Price', 'মূল্য', 'Precio', 'السعر', 'मूल्य', 'قیمت', '价钱', '価格', 'Preço', 'Цена', 'Prix', '가격', 'Preis', 'Prezzo', 'ราคา', 'Ár', 'Prijs', 'pretium', 'Harga', 'Fiyat', 'Τιμή', 'قیمت', 'Harga', 'ధర', 'விலை', 'કિંમત', 'Cena £', 'Ціна', 'ਕੀਮਤ', 'Preț', 'စျေးနှုန်း', 'Iye owo', 'Farashin'),
(203, 'quantity', 'Quantity', 'পরিমাণ', 'Cantidad', 'كمية', 'मात्रा', 'مقدار', '数量', '量', 'Quantidade', 'Количество', 'Quantité', '수량', 'Menge', 'Quantità', 'ปริมาณ', 'Mennyiség', 'Aantal stuks', 'quantitas', 'Kuantitas', 'miktar', 'Ποσότητα', 'مقدار', 'Kuantiti', 'మొత్తము', 'அளவு', 'જથ્થો', 'Ilość', 'Кількість', 'ਗਿਣਤੀ', 'Cantitate', 'အရေအတွက်', 'Opolopo', 'Yawan'),
(204, 'availble', 'Available', 'সহজলভ্য', 'Disponible', 'متاح', 'उपलब्ध', 'دستیاب', '可得到', '利用可能', 'acessível', 'Доступный', 'Disponible', '유효한', 'Verfügbar', 'A disposizione', 'ที่มีจำหน่าย', 'Elérhető', 'Beschikbaar', 'available', 'Tersedia', 'Mevcut', 'Διαθέσιμος', 'در دسترس', 'Tersedia', 'అందుబాటులో', 'கிடைக்கும்', 'ઉપલબ્ધ', 'Dostępny', 'Доступно', 'ਉਪਲੱਬਧ', 'Disponibil', 'ရရှိနိုင်', 'Wa', 'Akwai'),
(205, 'edition', 'Edition', 'সংস্করণ', 'Edición', 'الإصدار', 'संस्करण', 'ایڈیشن', '版', '版', 'Edição', 'Издание', 'Édition', '판', 'Auflage', 'Edizione', 'ฉบับ', 'Kiadás', 'Editie', 'edition', 'Edisi', 'Baskı', 'Εκδοση', 'نسخه', 'Edisi', 'ఎడిషన్', 'பதிப்பு', 'આવૃત્તિ', 'Wydanie', 'Видання', 'ਐਡੀਸ਼ਨ', 'Ediție', 'Edition ကို', 'Itọsọna', 'Edition'),
(206, 'almira_rack', 'Almira No', 'আলমারি নম্বর', 'Almira No', 'ألميرا نو', 'अलमिरा नो', 'الامرا نمبر', 'Almira No', 'Almira No', 'Almira Não', 'Альмира Нет', 'Almira Non', 'Almira No', 'Almira Nein', 'Almira no', 'Almira No', 'Almira No', 'Almira Nee', 'Non Almira', 'Almira No', 'Almira Hayır', 'Αλμίρα Όχι', 'آلمیرا نه', 'Almira No', 'అల్మిరా నం', 'அல்மிரா இல்லை', 'અલમરા ના', 'Almira Nie', 'Альміра №', 'ਅਲਮਾਮਾ ਨੰ', 'Almira nr', 'Almira အဘယ်သူမျှမ', 'Almira Bẹẹkọ', 'Almira Babu'),
(207, 'yes', 'Yes', 'হাঁ', 'Sí', 'نعم فعلا', 'हाँ', 'جی ہاں', '是', 'はい', 'sim', 'да', 'Oui', '예', 'Ja', 'sì', 'ใช่', 'Igen', 'Ja', 'Ita', 'iya nih', 'Evet', 'Ναί', 'بله', 'Ya', 'అవును', 'ஆம்', 'હા', 'tak', 'Так', 'ਹਾਂ', 'da', 'ဟုတ်ကဲ့', 'Bẹẹni', 'Ee');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(208, 'no', 'No', 'না', 'No', 'لا', 'नहीं', 'نہیں', '没有', 'いいえ', 'Não', 'нет', 'Non', '아니', 'Nein', 'No', 'ไม่', 'Nem', 'Nee', 'nullum', 'Tidak', 'Yok hayır', 'Οχι', 'نه', 'Tidak', 'తోబుట్టువుల', 'இல்லை', 'ના', 'Nie', 'Немає', 'ਨਹੀਂ', 'Nu', 'အဘယ်သူမျှမ', 'Rara', 'Aa'),
(209, 'library_id', 'Library ID', 'গ্রন্থাগার আইডি', 'ID de biblioteca', 'معرف المكتبة', 'लाइब्रेरी आईडी', 'لائبریری کی شناخت', '库ID', 'ライブラリID', 'ID da biblioteca', 'ИД библиотеки', 'ID de la bibliothèque', '도서관 ID', 'Bibliotheks-ID', 'ID della biblioteca', 'ID ห้องสมุด', 'Könyvtár azonosítója', 'Bibliotheek-ID', 'id bibliothecam', 'ID Perpustakaan', 'Kütüphane kimliği', 'Αναγνωριστικό βιβλιοθήκης', 'شناسه کتابخانه', 'ID Perpustakaan', 'లైబ్రరీ ID', 'நூலக ஐடி', 'લાઇબ્રેરી ID', 'Identyfikator biblioteki', 'Ідентифікатор бібліотеки', 'ਲਾਇਬ੍ਰੇਰੀ ਆਈਡੀ', 'ID-ul bibliotecii', 'စာကြည့်တိုက် ID ကို', 'ID ibi ipamọ', 'ID ID'),
(210, 'return_this', 'Return This', 'রিটার্ন করুন', 'Devuelve esto', 'عودة هذا', 'यह वापसी करें', 'واپس لو', '返回这个', 'これを返す', 'Retornar isso', 'Возвращение', 'Retournez ceci', '반환이', 'Gib das zurück', 'Restituire questo', 'กลับนี้', 'Vissza', 'Keer dit terug', 'return haec', 'Kembalikan ini', 'Geri dön', 'Επιστρέψτε αυτό', 'بازگشت این', 'Pulangkan ini', 'ఈ రిటర్న్', 'இந்த திரும்பு', 'આ આવો', 'Wróć to', 'Поверніть це', 'ਇਸ ਨੂੰ ਵਾਪਸ ਕਰੋ', 'Întoarce-te', 'ဤသည်ပြန်သွားသည်', 'Da eyi pada', 'Koma wannan'),
(211, 'vehicle_model', 'Vehicle Model', 'গাড়ী মডেল', 'Modelo de vehículo', 'نموذج المركبة', 'वाहन मॉडल', 'گاڑی کا ماڈل', '车辆模型', '車両モデル', 'Modelo do veículo', 'Модель транспортного средства', 'Modèle de véhicule', '차량 모델', 'Fahrzeugmodell', 'Modello di veicolo', 'โมเดลรถ', 'Járműmodell', 'Voertuigmodel', 'vehiculum Model', 'Model Kendaraan', 'Araç modeli', 'Μοντέλο οχήματος', 'مدل خودرو', 'Model Kenderaan', 'వాహన నమూనా', 'வாகன மாதிரி', 'વાહન મોડેલ', 'model maszyny', 'Модель автомобіля', 'ਵਾਹਨ ਮਾਡਲ', 'Modelul vehiculului', 'ယာဉ်မော်ဒယ်', 'Apẹẹrẹ ọkọ ayọkẹlẹ', 'Vehicle Model'),
(212, 'driver', 'Driver', 'চালক', 'Conductor', 'سائق', 'चालक', 'ڈرائیور', '司机', 'ドライバ', 'Motorista', 'Водитель', 'Chauffeur', '운전사', 'Treiber', 'autista', 'คนขับรถ', 'Sofőr', 'Bestuurder', 'agitator', 'Sopir', 'sürücü', 'Οδηγός', 'راننده', 'Pemandu', 'డ్రైవర్', 'இயக்கி', 'ડ્રાઈવર', 'Kierowca', 'Водій', 'ਡਰਾਇਵਰ', 'Conducător auto', 'မောင်းသူ', 'Awako', 'Driver'),
(213, 'vehicle_license', 'Vehicle License', 'গাড়ী লাইসেন্স', 'Licencia del vehículo', 'رخصة السيارة', 'वाहन लाइसेंस', 'گاڑیاں لائسنس', '车辆牌照', '車両ライセンス', 'Licença de veículo', 'Лицензия на автомобиль', 'Licence de véhicule', '차량 면허', 'Fahrzeuglizenz', 'Licenza del veicolo', 'ใบขับขี่', 'Gépjármű-engedély', 'Voertuig licentie', 'vehiculum License', 'Lisensi Kendaraan', 'Araç Lisansı', 'Άδεια οχήματος', 'مجوز خودرو', 'Lesen Kenderaan', 'వాహన లైసెన్సు', 'வாகன உரிமம்', 'વાહન લાઇસન્સ', 'Licencja pojazdu', 'Ліцензія на автомобіль', 'ਵਾਹਨ ਲਾਇਸੈਂਸ', 'Licența vehiculului', 'ယာဉ်လိုင်စင်', 'Iwe-aṣẹ ọkọ ayọkẹlẹ', 'Takardar Lasin Jirgin'),
(214, 'vehicle_contact', 'Vehicle Contact', 'গাড়ী যোগাযোগ', 'Contacto del vehículo', 'الاتصال مركبة', 'वाहन संपर्क', 'گاڑی سے رابطہ', '车辆接触', '車両の連絡先', 'Contato com o veículo', 'Контакт с автомобилем', 'Contact du véhicule', '차량 연락처', 'Fahrzeugkontakt', 'Contatto del veicolo', 'ติดต่อยานพาหนะ', 'Jármű kapcsolattartó', 'Contactpersoon voor voertuigen', 'Contact vehiculum', 'Kontak Kendaraan', 'Araç Teması', 'Επικοινωνία με το όχημα', 'تماس با خودرو', 'Kenalan Kenderaan', 'వాహన సంప్రదించండి', 'வாகன தொடர்பு', 'વાહન સંપર્ક', 'Kontakt z pojazdem', 'Контакт з транспортним засобом', 'ਵਾਹਨ ਸੰਪਰਕ', 'Contactul vehiculului', 'ယာဉ်ဆက်သွယ်ပါ', 'Ọkọ ọkọ ayọkẹlẹ', 'Sadarwar mota'),
(215, 'route_start', 'Route Start', 'রাস্তা শুরু', 'Ruta de inicio', 'بداية الطريق', 'रूट प्रारंभ करें', 'روٹ شروع', '路线开始', 'ルートスタート', 'Começo da rota', 'Начало маршрута', 'Début de litinéraire', '경로 시작', 'Route starten', 'Route Start', 'เริ่มต้นเส้นทาง', 'Útvonal indítása', 'Route Start', 'Satus route', 'Mulai rute', 'Yol Başlat', 'Έναρξη διαδρομής', 'شروع مسیر', 'Jalankan Permulaan', 'రూట్ ప్రారంభం', 'வழி தொடக்கம்', 'રૂટ પ્રારંભ', 'Rozpocznij trasę', 'Початок маршруту', 'ਰੂਟ ਸਟਾਰਟ', 'Urmați traseul', 'လမ်းကြောင်း Start ကို', 'Ibẹrẹ ọna', 'Fara hanya'),
(216, 'route_end', 'Route End', 'রাস্তা শেষ', 'Ruta final', 'نهاية الطريق', 'मार्ग समाप्ति', 'روٹ اختتام', '路线结束', 'ルートエンド', 'Fim da rota', 'Маршрутный конец', 'Fin de la route', '국도 끝', 'Routenende', 'Route End', 'Route End', 'Útvonal vége', 'Route einde', 'iter itineris finis', 'Akhir rute', 'Güzergah sonu', 'Διαδρομή διαδρομής', 'پایان مسیر', 'Laluan Akhir', 'మార్గం ఎండ్', 'முடிவடையும்', 'રૂટ એન્ડ', 'Koniec trasy', 'Кінець маршруту', 'ਰੂਟ ਐਂਡ', 'Traseul final', 'လမ်းကြောင်းအဆုံး', 'Ipari Ipa', 'Ƙare Ƙare'),
(217, 'route_fare', 'Route Fare', 'রাস্তা ভাড়া', 'Ruta de la ruta', 'الطريق الأجرة', 'रूट किराया', 'راستے کی قسم', '路线结束', 'ルート運賃', 'Tarifa de rota', 'Маршрутная плата', 'Route Fare', '노선 요금', 'Route Tarif', 'Itinerario', 'ค่าโดยสารเส้นทาง', 'Útvonali vásárlás', 'Route tarief', 'Bene route', 'Tarif rute', 'Yol Ücreti', 'Διαδρομή διαδρομής', 'کرایه تاکسی', 'Tambang Laluan', 'రూట్ ఫేర్', 'வழி கட்டணம்', 'રૂટ ફેર', 'Opłata za przejazd', 'Вартість маршруту', 'ਰੂਟ ਕਿਰਾਇਆ', 'Route Fare', 'လမ်းကြောင်းလက်မှတ်ခများ', 'Ipa itọsọna', 'Route Fare'),
(751, 'vehicle_for_route', 'Vehicle for Route', 'রুট যানবাহন', 'Vehículo para la ruta', 'مركبة للطريق', 'मार्ग के लिए वाहन', 'روٹ کے لئے گاڑی', '路线车辆', 'ルートの車両', 'Veículo para rota', 'Автомобиль для маршрута', 'Véhicule pour Route', '국도 용 차량', 'Fahrzeug für die Route', 'Veicolo per il percorso', 'ยานพาหนะสำหรับเส้นทาง', 'Jármű az útvonalhoz', 'Voertuig voor route', 'Vehiculum itineris', 'Kendaraan untuk Rute', 'Güzergah için araç', 'Οχήματος για τη διαδρομή', 'وسیله نقلیه برای مسیر', 'Kenderaan untuk Laluan', 'మార్గం కోసం వాహనం', 'பாதைக்கான வாகனம்', 'રૂટ માટે વાહન', 'Pojazd dla trasy', 'Автомобіль для маршруту', 'ਰੂਟ ਲਈ ਵਾਹਨ', 'Vehicul pentru traseu', 'လမ်းကြောင်းများအတွက်ယာဉ်', 'Ọkọ ayọkẹlẹ fun Itọsọna', 'Mota don Hanyar'),
(752, 'fee', 'Fee', 'ফী', 'Cuota', 'رسوم', 'शुल्क', 'فیس', '费用', '費用', 'Taxa', 'плата', 'Frais', '보수', 'Gebühr', 'tassa', 'ค่าธรรมเนียม', 'Díj', 'honorarium', 'fee', 'Biaya', 'ücret', 'Τέλη', 'هزینه', 'Bayaran', 'ఫీజు', 'கட்டணம்', 'ફી', 'Opłata', 'Комісія', 'ਫੀਸ', 'taxă', 'ကြေး', 'Awọn owo sisan', 'Fee'),
(753, 'stop_name', 'Stop Name', 'স্টপ নাম', 'Nombre de parada', 'اسم التوقف', 'नाम बंद करो', 'نام بند کرو', '停止名称', '停止名', 'Parar Nome', 'Остановить имя', 'Arrêter le nom', '이름 중지', 'Stoppen Sie den Namen', 'Arresta il nome', 'ชื่อหยุด', 'Nevezzen meg nevet', 'Stop Naam', 'nomen subsisto', 'Hentikan Nama', 'Adı Durdur', 'Διακοπή ονόματος', 'نام توقف', 'Hentikan Nama', 'పేరు ఆపండి', 'பெயர் நிறுத்து', 'નામ રોકો', 'Zatrzymaj nazwę', 'Зупинити імя', 'ਨਾਂ ਰੋਕੋ', 'Opriți numele', 'အမည်ရပ်တန့်', 'Duro Orukọ', 'Tsaya sunan'),
(754, 'stop_km', 'Stop KM', 'স্টপ কে এম', 'Detener KM', 'وقف كم', 'केएम बंद करो', 'KM بند کرو', '停止KM', 'KMを停止', 'Pare KM', 'Стоп КМ', 'Arrêtez KM', 'KM 중지', 'Stoppen Sie KM', 'Stop KM', 'หยุด KM', 'Stop KM', 'Stop KM', 'nolite KM', 'Hentikan KM', 'KM durdur', 'Διακοπή KM', 'توقف KM', 'Hentikan KM', 'KM ఆపు', 'KM ஐ நிறுத்தவும்', 'KM રોકો', 'Zatrzymaj KM', 'Зупинити КМ', 'KM ਰੋਕੋ', 'Opriți KM', 'KM ရပ်တန့်', 'Duro KM', 'Tsaya KM'),
(755, 'stop_fare', 'Stop Fare', 'স্টপ ভাড়া', 'Detener la tarifa', 'وقف الأجرة', 'किराया बंद करो', 'کرایہ بند کرو', '停止票价', '運賃を停止する', 'Parar tarifa', 'Остановить тариф', 'Arrêter le tarif', '운임 할인', 'Stop Fare', 'Stop Fare', 'หยุดค่าโดยสาร', 'Stop Fare', 'Stop tarief', 'Bene subsisto', 'Hentikan Tarif', 'Ücreti Durdur', 'Σταματήστε το Φόρεμα', 'کرایه را متوقف کنید', 'Hentikan tambang', 'ఫేర్ ఆపివేయి', 'ஃபேர் நிறுத்து', 'ભાડું રોકો', 'Stop Fare', 'Зупинити вартість проїзду', 'ਫਾਰ ਰੋਕੋ', 'Opriți tariful', 'stop လက်မှတ်ခများ', 'Duro Iduro', 'Dakatar da Fare'),
(756, 'add_more', 'Add More', 'আরো যোগ করো', 'Añadir más', 'أضف المزيد', 'अधिक जोड़ें', 'مزید شامل کریں', '添加更多', 'さらに追加', 'Adicione mais', 'Добавить больше', 'Ajouter plus', '더 추가', 'Mehr hinzufügen', 'Aggiungere altro', 'เพิ่มอีก', 'Adj hozzá többet', 'Voeg meer toe', 'Add More', 'Tambahkan Lebih Banyak', 'Daha ekle', 'Πρόσθεσε περισσότερα', 'اضافه کردن بیشتر', 'Tambah lebih banyak', 'మరిన్ని జోడించండి', 'மேலும் சேர்க்கவும்', 'વધુ ઉમેરો', 'Dodaj więcej', 'Додати більше', 'ਹੋਰ ਜੋੜੋ', 'Adăuga mai mult', 'နောက်ထပ် Add', 'Fi Die e sii', 'Ƙara Ƙari'),
(757, 'route_stop_fare', 'Route Stop Fare', 'রুট স্টপ ভাড়া', 'Ruta detener tarifa', 'Route Stop Fare', 'मार्ग बंद किराया', 'روٹ سٹاپ کرایہ', '路线止损票价', 'ルートストップ運賃', 'Tarifa de parada de rota', 'Маршрутная остановка', 'Itinéraire Tarif darrêt', '노선 정지 요금', 'Route Stop Tarif', 'Route Stop Fare', 'หยุดการเดินทาง', 'Útvonal leállítása', 'Route stop tarief', 'Bene nolite route', 'Route Stop Fare', 'Rota Durdurma Ücreti', 'Διακοπή διαδρομής', 'هزینه توقف مسیر', 'Bayaran Henti Laluan', 'రూట్ స్టాప్ ఫేర్', 'வழி நிறுத்து கட்டணம்', 'રૂટ સ્ટોપ ફેર', 'Cena przejazdu trasy', 'Вартість зупинки маршруту', 'ਰੂਟ ਸਟਾਪ ਫਰਾਈ', 'Traseul opri tariful', 'လမ်းကြောင်း Stop လက်မှတ်ခများ', 'Ilana Duro Itọsọna', 'fitar da Tsaya Tsaya'),
(219, 'hostel_type', 'Hostel Type', 'ছাত্রাবাস ধরন', 'Tipo de Hostal', 'نوع نزل', 'छात्रावास का प्रकार', 'ہاسٹل کی قسم', '旅馆类型', 'ホステルタイプ', 'Tipo de albergue', 'Тип хостела', 'Type dauberge', '호스텔 유형', 'Herbergsart', 'Tipo di ostello', 'ประเภท Hostel', 'Szálló típusa', 'Hostel type', 'Type Hostel', 'Tipe asrama', 'Pansiyon Türü', 'Τύπος Hostel', 'نوع خوابگاه', 'Jenis Hostel', 'హాస్టల్ పద్ధతి', 'விடுதி வகை', 'છાત્રાલયનો પ્રકાર', 'Typ hostelu', 'Тип хостелу', 'ਹੋਸਟਲ ਦੀ ਕਿਸਮ', 'Tipul de hostel', 'ဘော်ဒါဆောင်အမျိုးအစား', 'Agbegbe Iru', 'Dakunan kwanan dalibai'),
(220, 'seat_total', 'Seat Total', 'আসন মোট', 'Asiento total', 'المقعد الكلي', 'सीट कुल', 'سیٹ کل', '座位总数', 'シート合計', 'Total do assento', 'Общее количество сидячих мест', 'Siège Total', '좌석 합계', 'Sitzplatz gesamt', 'Totale del sedile', 'ที่นั่งรวม', 'Seat Total', 'Seat Total', 'sede Summa', 'Kursi Total', 'Koltuk Toplam', 'Θέση Σύνολο', 'صندلی مجموع', 'Jumlah tempat duduk', 'సీట్ మొత్తం', 'மொத்த எண்ணிக்கை', 'બેઠક કુલ', 'Seat Total', 'Загальна кількість сидінь', 'ਸੀਟ ਕੁੱਲ', 'Seat Total', 'ထိုင်ခုံစုစုပေါင်း', 'Okun apapọ', 'Tsawon kuɗi'),
(221, 'cost_per_seat', 'Cost per Seat', 'আসন প্রতি খরচ', 'Costo por asiento', 'التكلفة لكل مقعد', 'सीट प्रति सीट', 'فی سیٹ لاگت', '每个座位的成本', '1シートあたりのコスト', 'Custo por assento', 'Стоимость за место', 'Coût par siège', '좌석 당 비용', 'Kosten pro Sitzplatz', 'Costo per posto', 'ต้นทุนต่อที่นั่ง', 'Tartózkodási költség', 'Kosten per stoel', 'Sumptus per propitiatorium,', 'Biaya per Kursi', 'Koltuk Başına Maliyet', 'Κόστος ανά Θέση', 'هزینه هر صندلی', 'Kos setiap Tempat Duduk', 'సీట్కు ఖర్చు', 'உட்கட்டமைப்புக்கான செலவு', 'સીટ દીઠ ખર્ચ', 'Koszt za miejsce', 'Вартість за місце', 'ਪ੍ਰਤੀ ਸੀਟ ਦੀ ਲਾਗਤ', 'Cost pe scaun', 'ထိုင်ခုံနှုန်းကုန်ကျစရိတ်', 'Iye owo fun ijoko', 'Kudin da Seat'),
(222, 'compose', 'Compose', 'লিখা', 'Componer', 'مؤلف موسيقى', 'लिखना', 'تحریر کریں', '撰写', '作成する', 'Compor', 'компоновать', 'Composer', '짓다', 'Komponieren', 'Comporre', 'แต่ง', 'Összeállít', 'Componeren', 'Componere epistolas', 'Menyusun', 'oluşturmak', 'Συνθέτω', 'ساختن', 'Tuliskan', 'కంపోజ్', 'எழுது', 'લખો', 'Komponować', 'Скласти', 'ਲਿਖੋ', 'Compune', 'compose', 'Ṣajọ', 'Shirya'),
(223, 'folder', 'Folder', 'ফোল্ডার', 'Carpeta', 'مجلد', 'फ़ोल्डर', 'فولڈر', '夹', 'フォルダ', 'Pasta', 'скоросшиватель', 'Dossier', '폴더', 'Mappe', 'Cartella', 'โฟลเดอร์', 'Folder', 'Map', 'folder', 'Map', 'Klasör', 'Ντοσιέ', 'پوشه', 'Folder', 'ఫోల్డర్', 'அடைவு', 'ફોલ્ડર', 'Teczka', 'Папка', 'ਫੋਲਡਰ', 'Pliant', 'ဖိုငျတှဲ', 'Folda', 'Jaka'),
(224, 'inbox', 'Inbox', 'ইনবক্স', 'Bandeja de entrada', 'صندوق الوارد', 'इनबॉक्स', 'ان باکس', '收件箱', '受信トレイ', 'Caixa de entrada', 'входящие', 'Boîte de réception', '받은 편지함', 'Posteingang', 'Posta in arrivo', 'กล่องขาเข้า', 'Bejövő', 'Postvak IN', 'inbuxo', 'Kotak masuk', 'Gelen kutusu', 'Inbox', 'صندوق ورودی', 'Peti masuk', 'ఇన్బాక్స్', 'உட்பெட்டி', 'ઇનબૉક્સ', 'W pudełku', 'Вхідні', 'ਇਨਬਾਕਸ', 'Inbox', 'inbox ထဲမှာ', 'Apo-iwọle', 'Inbox'),
(225, 'draft', 'Draft', 'ড্রাফ্ট্', 'Borrador', 'مشروع', 'प्रारूप', 'ڈرافٹ', '草案', 'ドラフト', 'Esboço, projeto', 'Проект', 'Brouillon', '초안', 'Entwurf', 'Bozza', 'ร่าง', 'vázlat', 'Droogte', 'capturam', 'Konsep', 'taslak', 'Προσχέδιο', 'پیش نویس', 'Draf', 'డ్రాఫ్ట్', 'வரைவு', 'ડ્રાફ્ટ', 'Wersja robocza', 'Чернетка', 'ਡਰਾਫਟ', 'Proiect', 'မူကြမ်း', 'Ifaworanhan', 'Shafin'),
(226, 'trash', 'Trash', 'ট্র্যাশ', 'Basura', 'قمامة، يدمر، يهدم', 'कचरा', 'ردی کی ٹوکری', '垃圾', 'ごみ', 'Lixo', 'дрянь', 'Poubelle', '폐물', 'Müll', 'Spazzatura', 'ขยะ', 'Szemét', 'uitschot', 'quisquiliae', 'Sampah', 'Çöp', 'Σκουπίδια', 'زباله ها', 'Sampah', 'ట్రాష్', 'குப்பைக்கு', 'ટ્રૅશ', 'Śmieci', 'Сміття', 'ਟ੍ਰੈਸ਼', 'Gunoi', 'အသုံးမရသောအရာ', 'Idọti', 'Shara'),
(227, 'message', 'Message', 'বার্তা', 'Mensaje', 'رسالة', 'संदेश', 'پیغام', '信息', 'メッセージ', 'mensagem', 'Сообщение', 'Message', '메시지', 'Botschaft', 'Messaggio', 'ข่าวสาร', 'Üzenet', 'Bericht', 'Nuntius', 'Pesan', 'Mesaj', 'Μήνυμα', 'پیام', 'Mesej', 'సందేశం', 'செய்தி', 'સંદેશ', 'Wiadomość', 'повідомлення', 'ਸੁਨੇਹਾ', 'Mesaj', 'မက်ဆေ့ခ်ျကို', 'Ifiranṣẹ', 'Saƙo'),
(228, 'discard', 'Discard', 'বাতিল', 'Descarte', 'تجاهل', 'छोड़ना', 'رکھو', '丢弃', '破棄', 'Descartar', 'отбрасывать', 'Jeter', '포기', 'Verwerfen', 'Scartare', 'ทิ้ง', 'Dobja', 'afdanken', 'Relinquere', 'Membuang', 'ıskarta', 'Απορρίπτω', 'نادیده گرفتن', 'Buang', 'విస్మరించు', 'நிராகரி', 'કાઢી નાખો', 'Odrzucać', 'Відхилити', 'ਬਰਖਾਸਤ ਕਰੋ', 'decarta', 'စွန့်ပစ်', 'Ṣabọ', 'Zubar da'),
(229, 'receiver_type', 'Receiver Type', 'প্রাপক প্রকার', 'Tipo de receptor', 'نوع جهاز الاستقبال', 'प्राप्तकर्ता प्रकार', 'رسیور کی قسم', '接收器类型', '受信機タイプ', 'Tipo de receptor', 'Тип приемника', 'Type de récepteur', '수신기 유형', 'Empfängertyp', 'Tipo di ricevitore', 'ประเภทตัวรับสัญญาณ', 'Vevőtípus', 'Ontvanger Type', 'Type receptorem', 'Jenis Penerima', 'Alıcı Türü', 'Τύπος δέκτη', 'نوع گیرنده', 'Jenis Penerima', 'స్వీకర్త పద్ధతి', 'பெறுநர் வகை', 'રીસીવર પ્રકાર', 'Typ odbiornika', 'Тип приймача', 'ਪ੍ਰਾਪਤਕਰਤਾ ਕਿਸਮ', 'Tip receptor', 'receiver အမျိုးအစား', 'Gbigba Iru', 'Mai karɓa iri'),
(230, 'receiver', 'Receiver', 'প্রাপক', 'Receptor', 'المتلقي', 'रिसीवर', 'وصول کنندہ', '接收器', '受信機', 'Receptor', 'Получатель', 'Destinataire', '리시버', 'Empfänger', 'Ricevitore', 'ผู้รับ', 'Receiver', 'Ontvanger', 'receptor', 'Penerima', 'Alıcı', 'Δέκτης', 'گیرنده', 'Penerima', 'స్వీకర్త', 'ரிசீவர்', 'રીસીવર', 'Odbiorca', 'Приймач', 'ਪ੍ਰਾਪਤਕਰਤਾ', 'Receptor', 'လက်ခံ', 'olugba', 'Mai karɓar'),
(231, 'time', 'Time', 'সময়', 'Hora', 'زمن', 'पहर', 'وقت', '时间', '時間', 'Tempo', 'Время', 'Temps', '시각', 'Zeit', 'Tempo', 'เวลา', 'Idő', 'Tijd', 'Tempus', 'Waktu', 'Zaman', 'χρόνος', 'زمان', 'Masa', 'సమయం', 'நேரம்', 'સમય', 'Czas', 'Час', 'ਸਮਾਂ', 'Timp', 'အချိန်', 'Aago', 'Lokaci'),
(232, 'read_message', 'Read Message', 'বার্তা পড়ুন', 'Leer el mensaje', 'اقرأ الرساله', 'संदेश पढ़ना', 'پیغام پڑھیں', '阅读消息', 'メッセージを読む', 'Leia a mensagem', 'Читать сообщение', 'Lire le message', '메시지 읽기', 'Lies die Nachricht', 'Leggi il messaggio', 'อ่านข้อความ', 'Üzenet olvasása', 'Lees bericht', 'Read Nuntius', 'Baca pesan', 'Mesajı oku', 'Διαβάστε το μήνυμα', 'خواندن پیام', 'Baca Mesej', 'సందేశం చదవండి', 'செய்தி வாசிக்கவும்', 'સંદેશ વાંચો', 'Czytać wiadomość', 'Читати повідомлення', 'ਸੁਨੇਹਾ ਪੜ੍ਹੋ', 'Citiți mesajul', 'ကို Message ကိုဖတ်ပါ', 'Ka Ifiranṣẹ', 'Karanta Saƙo'),
(233, 'reply', 'Reply', 'উত্তর', 'Respuesta', 'الرد', 'जवाब दे दो', 'جواب دیں', '回复', '応答', 'Resposta', 'Ответить', 'Répondre', '댓글', 'Antworten', 'rispondere', 'ตอบ', 'Válasz', 'Antwoord', 'Respondeo', 'Balasan', 'cevap', 'Απάντηση', 'پاسخ', 'Balas', 'ప్రత్యుత్తరం', 'பதில்', 'જવાબ આપો', 'Odpowiadać', 'Відповідь', 'ਜਵਾਬ ਦਿਉ', 'Răspuns', 'ပြန်ကြားချက်', 'Idahun', 'Amsa'),
(234, 'attachment', 'Attachment', 'সংযুক্তি', 'Adjunto archivo', 'المرفق', 'आसक्ति', 'منسلکہ', '附件', 'アタッチメント', 'Anexo', 'прикрепление', 'Attachement', '부착', 'Befestigung', 'attaccamento', 'ความผูกพัน', 'Attachment', 'gehechtheid', 'affectum', 'Lampiran', 'Ek dosya', 'Συνημμένο', 'ضمیمه', 'Lampiran', 'జోడింపు', 'இணைப்பு', 'જોડાણ', 'Załącznik', 'Вкладення', 'ਅਟੈਚਮੈਂਟ', 'Atașament', 'ပူးတွဲမှု', 'Asopọ', 'Abin haɗi'),
(235, 'dynamic_tag', 'Dynamic Tag', 'ডায়নামিক ট্যাগ', 'Etiqueta dinámica', 'علامة ديناميكية', 'डायनेमिक टैग', 'متحرک ٹیگ', '动态标签', '動的タグ', 'Tag dinâmico', 'Динамический тег', 'Balise dynamique', '동적 태그', 'Dynamische Markierung', 'Tag dinamico', 'แท็กแบบไดนามิก', 'Dinamikus címke', 'Dynamische tag', 'dynamic Omega', 'Tag Dinamis', 'Dinamik Etiket', 'Δυναμική ετικέτα', 'برچسب پویا', 'Tag Dinamik', 'డైనమిక్ ట్యాగ్', 'டைனமிக் டேக்', 'ડાયનેમિક ટૅગ', 'Tag dynamiczny', 'Динамічний тег', 'ਡਾਇਨਾਮਿਕ ਟੈਗ', 'Etichetă dinamică', 'dynamic Tag ကို', 'Atilẹyin Ayika', 'Dynamic Tag'),
(236, 'gateway', 'Gateway', 'গেটওয়ে', 'Puerta', 'بوابة', 'द्वार', 'گیٹ وے', '网关', 'ゲートウェイ', 'Gateway', 'шлюз', 'passerelle', '게이트웨이', 'Tor', 'porta', 'ประตู', 'Gateway', 'poort', 'porta', 'pintu gerbang', 'geçit', 'πύλη', 'دروازه', 'Gateway', 'గేట్వే', 'நுழைவாயில்', 'ગેટવે', 'Przejście', 'Шлюз', 'ਗੇਟਵੇ', 'portal', 'တံခါးပေါက်', 'Ẹnu-ọna', 'Ƙofar waje'),
(237, 'email_body', 'Email Body', 'ইমেইল বডি', 'Cuerpo del correo electronico', 'هيئة البريد الإلكتروني', 'ईमेल बॉडी', 'ای میل جسم', '电子邮件正文', 'メール本文', 'Corpo do e-mail', 'Тело письма', 'Corps de le-mail', '이메일 본문', 'Nachrichtentext', 'Email Corpo', 'Email Body', 'Email Body', 'E-mail body', 'Email Corpus', 'Email Tubuh', 'E-posta Gövdesi', 'Σώμα ηλεκτρονικού ταχυδρομείου', 'بدن ایمیل', 'Badan E-mel', 'ఇమెయిల్ బాడీ', 'மின்னஞ்சல் உடல்', 'ઇમેઇલ શારીરિક', 'Treść e-maila', 'Email Body', 'ਈਮੇਲ ਬਾਡੀ', 'Organismul de e-mail', 'အီးမေးလ်ပို့ရန်ခန္ဓာကိုယ်', 'Imeeli Ara', 'Jikin Jiki'),
(238, 'notice_for', 'Notice for', 'নোটিশ ফর', 'Aviso para', 'إشعار ل', 'के लिए सूचना', 'نوٹس', '通知', 'お知らせ', 'Aviso para', 'Уведомление для', 'Avis pour', '공지 사항', 'Hinweis für', 'Avviso per', 'แจ้งให้ทราบ', 'Figyelmeztetés', 'Kennisgeving voor', 'notitia est', 'Pemberitahuan untuk', 'Için bildirim', 'Ειδοποίηση για', 'برای', 'Notis untuk', 'గమనించండి', 'கவனிக்கவும்', 'માટે નોટિસ', 'Powiadomienie dla', 'Зверніть увагу на', 'ਲਈ ਨੋਟਿਸ', 'Notă pentru', 'မှုအတွက်အသိပေးစာ', 'Akiyesi fun', 'Lura don'),
(239, 'date', 'Date', 'তারিখ', 'Fecha', 'تاريخ', 'तारीख', 'تاریخ', '日期', '日付', 'Encontro', 'Дата', 'Rendez-vous amoureux', '날짜', 'Datum', 'Data', 'วันที่', 'Dátum', 'Datum', 'Date', 'Tanggal', 'tarih', 'Ημερομηνία', 'تاریخ', 'Tarikh', 'తేదీ', 'தேதி', 'તારીખ', 'Data', 'Дата', 'ਤਾਰੀਖ', 'Data', 'နေ့စှဲ', 'Ọjọ', 'Kwanan wata'),
(240, 'from_date', 'From Date', 'তারিখ হইতে', 'Partir de la fecha', 'من التاريخ', 'तारीख से', 'اس تاریخ سے', '从日期', '日付から', 'Da data', 'С даты', 'Partir de la date', '날짜부터', 'Ab Datum', 'Dalla data', 'จากวันที่', 'Dátumtól', 'Van datum', 'Ex Date', 'Dari tanggal', 'İtibaren', 'Από την ημερομηνία', 'از تاریخ', 'Dari tarikh', 'తేదీ నుంచి', 'தேதி முதல்', 'તારીખથી', 'Od daty', 'Від дати', 'ਮਿਤੀ ਤੋਂ', 'Din data', 'နေ့စွဲကနေ', 'Lati Ọjọ', 'Daga Kwanan wata'),
(241, 'to_date', 'To Date', 'তারিখ পর্যন্ত', 'Hasta la fecha', 'ان يذهب في موعد', 'तारीख तक', 'تاریخ تک', '至今', '現在まで', 'Até a presente data', 'Встретиться1', 'À ce jour', '오늘까지', 'Miteinander ausgehen', 'Ad oggi', 'ถึงวันที่', 'Randizni', 'Daten', 'Ad Date', 'Saat ini', 'Bugüne kadar', 'Μέχρι σήμερα', 'به روز', 'Untuk Tarikh', 'తేదీ వరకు', 'தேதி', 'આજ સુધી', 'Spotykać się z kimś', 'До дати', 'ਮਿਤੀ ਤੱਕ', 'La zi', 'ယနေ့အထိ', 'Titi di akoko yi', 'Don Kwanan wata'),
(242, 'image', 'Image', 'ইমেজ', 'Imagen', 'صورة', 'छवि', 'تصویر', '图片', '画像', 'Imagem', 'Образ', 'Image', '영상', 'Bild', 'Immagine', 'ภาพ', 'Kép', 'Beeld', 'Image', 'Gambar', 'görüntü', 'Εικόνα', 'تصویر', 'Gambar', 'చిత్రం', 'பட', 'છબી', 'Obraz', 'Зображення', 'ਚਿੱਤਰ', 'Imagine', 'image ကို', 'Aworan', 'Hoton hoto'),
(243, 'event_for', 'Event for', 'ইভেন্ট ফর', 'Evento para', 'حدث ل', 'के लिए घटना', 'کے لئے واقعہ', '事件', 'イベント', 'Evento para', 'Событие для', 'Événement pour', '이벤트', 'Ereignis für', 'Evento per', 'กิจกรรมสำหรับ', 'Esemény', 'Evenement voor', 'res enim', 'Acara untuk', 'Için Etkinlik', 'Εκδήλωση για', 'رویداد برای', 'Acara untuk', 'ఈవెంట్ కోసం', 'நிகழ்வு', 'માટે ઇવેન્ટ', 'Wydarzenie dla', 'Подія для', 'ਲਈ ਇਵੈਂਟ', 'Eveniment pentru', 'များအတွက်အဖြစ်အပျက်', 'Iṣẹlẹ fun', 'Aukuwa don'),
(244, 'event_place', 'Event Place', 'ইভেন্ট স্থান', 'Lugar del evento', 'مكان الحدث', 'इवेंट प्लेस', 'واقعہ کی جگہ', '活动地点', 'イベント会場', 'Lugar do Evento', 'Место проведения мероприятия', 'Lieu de lévénement', '행사 장소', 'Veranstaltungsort', 'Luogo dellevento', 'สถานที่จัดงาน', 'Rendezvényhelyszín', 'Evenementplaats', 'res Locus Iste', 'Tempat acara', 'Etkinlik Yeri', 'Τόπος εκδήλωσης', 'محل برگزاری', 'Tempat Acara', 'ఈవెంట్ ప్లేస్', 'நிகழ்வு இடம்', 'ઇવેન્ટ પ્લેસ', 'Miejsce zdarzenia', 'Місце проведення', 'ਇਵੈਂਟ ਸਥਾਨ', 'Locul evenimentului', 'အဖြစ်အပျက်နေရာ', 'Ibi ti o ṣe', 'Tarihin Lura'),
(245, 'coming_from', 'Coming From', 'যেখান থেকে আসছে', 'Procedente de', 'القادمة من', 'से आ रही', 'سے آنے والے', '来自（哪里', 'から来る', 'Vindo de', 'Приходящий из', 'Provenir de', '에서 오는', 'Kommen von', 'Proveniente da', 'มาจาก', 'Jön valahonnan', 'Afkomstig uit', 'Ex', 'Berasal dari', 'Gelen', 'Που προέρχονται από', 'داره میاد از', 'Yang datang dari', 'వస్తున్నది', 'வரவிருக்கிறது', 'આવતા', 'Pochodzi z', 'Виходячи з', 'ਤੋਂ ਆ ਰਿਹਾ ਹੈ', 'Provin de la', 'မှစ. လာမယ့်', 'Wiwa Lati', 'Zuwan Daga'),
(246, 'to_meet', 'To Meet', 'যার সাথে দেখা করবে', 'Conocer', 'لكي نلتقي', 'मीलऩा', 'ملنے کے لئے', '见面', '会う', 'Encontrar', 'Встречаться', 'Rencontrer', '만나다', 'Treffen', 'Incontrare', 'พบ', 'Találkozni', 'Ontmoeten', 'Convenire', 'Bertemu', 'Tanışmak', 'Να συναντησω', 'برای دیدار با', 'Berjumpa', 'కలవడం', 'சந்திக்க', 'મળવા', 'Spotkać', 'Зустріти', 'ਮਿਲਣ ਲਈ', 'A întâlni', 'တွေ့ဖို့', 'Lati pade', 'Don saduwa'),
(247, 'reason_to_meet', 'Reason to Meet', 'দেখা করার কারণ', 'Motivo para reunirse', 'سبب الاجتماع', 'मिलने का कारण', 'ملاقات کرنے کی وجہ', '满足的理由', '会う理由', 'Razão para conhecer', 'Причина встречи', 'Raison de rencontrer', '만나는 이유', 'Grund zu treffen', 'Motivo per incontrarsi', 'เหตุผลที่จะพบ', 'A találkozás oka', 'Reden om te ontmoeten', 'Ratio ut meet', 'Alasan untuk bertemu', 'Tanışma Nedeni', 'Λόγος για να συναντήσω', 'دلیل برای دیدار', 'Sebab untuk Bertemu', 'కలుసుకోవడానికి కారణం', 'சந்திக்க காரணம்', 'મળવા કારણ', 'Powód do spotkania', 'Привід зустрітися', 'ਮਿਲਣ ਦਾ ਕਾਰਨ', 'Motivul pentru a satisface', 'တွေ့ဆုံဖို့အကြောင်းရင်း', 'Idi lati pade', 'Dalili na Saduwa'),
(248, 'check_in', 'Check In', 'চেক ইন', 'Registrarse', 'تحقق في', 'चेक इन', 'چیک کریں', '报到', 'チェックイン', 'Check-in', 'Регистрироваться', 'Enregistrement', '체크인', 'Check-In', 'Registrare', 'เช็คอิน', 'Becsekkolás', 'Check in', 'Reprehendo in', 'Mendaftar', 'Giriş', 'Παραδίδω αποσκευές', 'چک کردن', 'Daftar masuk', 'చెక్ ఇన్ చేయండి', 'சரிபார்க்கவும்', 'ચેક ઇન કરો', 'Zameldować się', 'Перевірь', 'ਚੈੱਕ ਇਨ ਕਰੋ', 'Verifica', 'ရောက်ရှိကြောင်းစာရင်းသွင်းခြင်း', 'Wole sinu', 'Rajistan shiga'),
(249, 'check_out', 'Check Out', 'চেক আউট', 'Revisa', 'الدفع', 'चेक आउट', 'اس کو دیکھو', '查看', 'チェックアウト', 'Confira', 'Проверять, выписываться', 'Check-out', '체크 아웃', 'Auschecken', 'Check-out', 'เช็คเอาท์', 'Kijelentkezés', 'Uitchecken', 'reprehendo de', 'Periksa', 'Çıkış yapmak', 'Ολοκλήρωση αγοράς', 'وارسی', 'Semak Keluar', 'తనిఖీ చేయండి', 'பாருங்கள்', 'તપાસો', 'Sprawdzić', 'Перевірити', 'ਕਮਰਾ ਛੱਡ ਦਿਓ', 'Verifică', 'ထွက်ခွာသည်', 'Ṣayẹwo', 'Duba Out'),
(250, 'amount', 'Amount', 'পরিমাণ', 'Cantidad', 'كمية', 'रकम', 'رقم', '量', '量', 'Montante', 'Количество', 'Montant', '양', 'Menge', 'Quantità', 'จำนวน', 'Összeg', 'Bedrag', 'tantum', 'Jumlah', 'Miktar', 'Ποσό', 'میزان', 'Jumlah', 'మొత్తం', 'தொகை', 'રકમ', 'Ilość', 'Сума', 'ਦੀ ਰਕਮ', 'Cantitate', 'ငွေပမာဏ', 'Iye', 'Adadin'),
(251, 'discount', 'Discount', 'ছাড়', 'Descuento', 'خصم', 'छूट', 'ڈسکاؤنٹ', '折扣', 'ディスカウント', 'Desconto', 'скидка', 'Discount', '할인', 'Rabatt', 'Sconto', 'ส่วนลด', 'Kedvezmény', 'Korting', 'Buy', 'Diskon', 'İndirim', 'Εκπτωση', 'تخفیف', 'Diskaun', 'డిస్కౌంట్', 'தள்ளுபடி', 'ડિસ્કાઉન્ટ', 'Zniżka', 'Знижка', 'ਛੂਟ', 'Reducere', 'လျှော့စျေး', 'iye owo', 'Dama'),
(253, 'print', 'Print', 'প্রিন্ট', 'Impresión', 'طباعة', 'छाप', 'پرنٹ کریں', '打印', '印刷', 'Impressão', 'Распечатать', 'Impression', '인쇄', 'Drucken', 'Stampare', 'พิมพ์', 'Nyomtatás', 'Afdrukken', 'Print', 'Mencetak', 'baskı', 'Τυπώνω', 'چاپ', 'Cetak', 'ప్రింట్', 'அச்சு', 'છાપો', 'Wydrukować', 'Друк', 'ਛਾਪੋ', 'Imprimare', 'ပုံနှိပ်', 'Tẹjade', 'Buga'),
(254, 'paid', 'Paid', 'পরিশোদ', 'Pagado', 'دفع', 'भुगतान किया है', 'ادا کیا', '付费', '有料', 'Pago', 'оплаченный', 'Payé', '유료', 'Bezahlt', 'Pagato', 'ต้องจ่าย', 'Fizetett', 'Betaald', 'pretium', 'Dibayar', 'ödenmiş', 'επί πληρωμή', 'پرداخت شده', 'Dibayar', 'చెల్లింపు', 'பணம்', 'ચૂકવેલ', 'Płatny', 'Оплачений', 'ਦਾ ਭੁਗਤਾਨ', 'Plătit', 'paid', 'San', 'An biya'),
(255, 'subtotal', 'Subtotal', 'উপমোট', 'Total parcial', 'حاصل الجمع', 'उप-योग', 'ذیلی کل', '小计', '小計', 'Subtotal', 'Промежуточный итог', 'Total', '소계', 'Zwischensumme', 'totale parziale', 'ไม่ทั้งหมด', 'Részösszeg', 'Subtotaal', 'Subtotal', 'Subtotal', 'ara toplam', 'ΜΕΡΙΚΟ ΣΥΝΟΛΟ', 'کل حجم', 'jumlah kecil', 'పూర్తికాని', 'கூட்டுத்தொகை', 'પેટાસરવાળો', 'Suma częściowa', 'Сумарно', 'ਉਪ-ਕੁੱਲ', 'Subtotal', 'စုစုပေါင်း', 'Atokun', 'Subtotal'),
(256, 'method', 'Method', 'পদ্ধতি', 'Método', 'طريقة', 'तरीका', 'طریقہ', '方法', '方法', 'Método', 'метод', 'Méthode', '방법', 'Methode', 'Metodo', 'วิธี', 'Módszer', 'Methode', 'modum', 'metode', 'Yöntem', 'Μέθοδος', 'روش', 'Kaedah', 'విధానం', 'செய்முறை', 'પદ્ધતિ', 'metoda', 'Метод', 'ਵਿਧੀ', 'Metodă', 'နည်းလမ်း', 'Ọna', 'Hanyar'),
(257, 'payment_via', 'Payment Via', 'পেমেন্ট মাধ্যমে', 'Pago a través de', 'الدفع عن طريق', 'भुगतान के माध्यम से', 'ادائیگی کے ذریعے', '付款通过', '支払い方法', 'Pagamento através', 'Оплата через', 'Paiement Via', '지불 비아', 'Zahlung über', 'Pagamento Via', 'ชำระเงินผ่านทาง', 'Fizetés Via', 'Betaling Via', 'Payment Via', 'Pembayaran melalui', 'Ödeme Via', 'Πληρωμή μέσω Via', 'پرداخت از طریق', 'Pembayaran Melalui', 'చెల్లింపు ద్వారా', 'செலுத்தும் வழியாக', 'ચુકવણી વાયા', 'Płatność przez', 'Оплата Via', 'ਦੁਆਰਾ ਭੁਗਤਾਨ ਭੁਗਤਾਨ', 'Plata prin', 'ငွေပေးချေမှုရမည့်မှတစ်ဆင့်', 'Isanwo Nipasẹ', 'Biyan kuɗi ta hanyar'),
(259, 'yearly', 'Yearly', 'বার্ষিক', 'Anual', 'سنوي', 'सालाना', 'سالانہ', '每年', '毎年', 'Anual', 'каждый год', 'Annuel', '매년', 'Jährlich', 'Annuale', 'รายปี', 'Évi', 'jaar-', 'quot annis', 'Tahunan', 'Yıllık', 'Ετήσια', 'سالانه', 'Setiap tahun', 'ప్రతిసంవత్సరం', 'வருடாந்திரம்', 'વાર્ષિક', 'Rocznie', 'Щорічно', 'ਸਲਾਨਾ', 'Anual', 'နှစ်အလိုက်', 'Ọdún', 'Shekara shekara'),
(260, 'tabular', 'Tabular', 'ট্যাবুলার ডেটা', 'Tabular', 'مجدول', 'तालिका का', 'ٹیبلولر', '表格式的', '表形式', 'Tabular', 'табличный', 'Tabulaire', '표의', 'Tabellarisch', 'di tabella', 'แบน', 'Táblázatos', 'tabellarisch', 'Expositio canonica', 'Datar', 'yassı', 'Πινακοειδής', 'جدولی', 'Tabular', 'పట్టిక', 'சீரமைப்புப்', 'કોષ્ટક', 'Tabelaryczny', 'Табличний', 'ਤਾਲੂਲਰ', 'Tabular', 'tabular', 'Tabular', 'Tabula'),
(261, 'graphical', 'Graphical', 'গ্রাফিক', 'Gráfico', 'بياني', 'चित्रात्मक', 'گرافیکل', '图形', 'グラフィカルな', 'Gráfico', 'графический', 'Graphique', '그래픽', 'Grafisch', 'grafico', 'กราฟิก', 'Grafikus', 'grafisch', 'graphical', 'Grafis', 'Grafiksel', 'Γραφικός', 'گرافیکی', 'Grafik', 'గ్రాఫికల్', 'வரைவியல்', 'ગ્રાફિકલ', 'Graficzny', 'Графічний', 'ਗਰਾਫਿਕਲ', 'Grafic', 'graphical', 'Ti iwọn', 'Zane-zane'),
(262, 'remain', 'Remain', 'অবশিষ্ট', 'Permanecer', 'يبقى', 'रहना', 'رہنا', '留', '残っている', 'Permanecer', 'оставаться', 'Rester', '남아있는', 'Bleiben übrig', 'rimanere', 'ยังคง', 'Marad', 'Blijven', 'manent', 'Tetap', 'Kalmak', 'Παραμένει', 'ماندن', 'Kekal', 'ఉంటాయి', 'இருக்கும்', 'રહો', 'Pozostawać', 'Залишитися', 'ਰਹਿਣ ਦਿਓ', 'Rămâne', 'ကျန်ရစ်', 'Duro', 'Ku tsaya'),
(263, 'month', 'Month', 'মাস', 'Mes', 'شهر', 'महीना', 'مہینہ', '月', '月', 'Mês', 'Месяц', 'Mois', '달', 'Monat', 'Mese', 'เดือน', 'Hónap', 'Maand', 'mense', 'Bulan', 'Ay', 'Μήνας', 'ماه', 'Bulan', 'నెల', 'மாதம்', 'માસ', 'Miesiąc', 'Місяць', 'ਮਹੀਨਾ', 'Lună', 'လ', 'Oṣu', 'Watan'),
(264, 'a_positive', 'A+', 'এ পজিটিভ', 'A +', 'A +', 'A+', 'A+', 'A+', 'A+', 'A+', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +', 'A +'),
(265, 'a_negative', 'A-', 'এ নেগেটিভ', 'UN-', 'ا-', 'ए-', 'A-', '一个-', 'A-', 'UMA-', 'A-', 'A-', '에이-', 'EIN-', 'UN-', 'A-', 'A-', 'EEN-', 'A-', 'SEBUAH-', 'A-', 'ΕΝΑ-', 'A-', 'A-', 'ఒక-', 'ஏ', 'એ-', 'ZA-', 'A-', 'ਏ-', 'A-', 'A-', 'A-', 'A-'),
(266, 'b_positive', 'B+', 'বি পজিটিভ', 'B +', 'B +', 'बी +', 'B+', 'B+', 'B+', 'B+', 'B +', 'B+', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'பி', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +', 'B +'),
(267, 'b_negative', 'B-', 'বি নেগেটিভ', 'SEGUNDO-', 'ب-', 'बी', 'B-', 'B-', 'B-', 'B-', 'B-', 'B-', '비-', 'B-', 'B-', 'B-', 'B-', 'B-', 'Sed placerat scelerisque', 'B-', 'B-', 'ΣΙ-', 'B-', 'B-', 'B-', 'பி-', 'બી-', 'B-', 'B-', 'ਬੀ-', 'B-', 'ပါဘူးရှငျ', 'B-', 'B-'),
(268, 'o_positive', 'O+', 'ও পজিটিভ', 'O +', 'O +', 'O+', 'اے +', 'O+', 'O+', 'O+', 'O +', 'O+', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'Domine +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'O +', 'အို +', 'O +', 'O +'),
(269, 'o_negative', 'O-', 'ও নেগেটিভ', 'O-', 'O-', 'O-', 'O-', 'O-', 'O-', 'O-', 'O-', 'O-', '영형-', 'O-', 'O-', 'O-', 'O-', 'O-', 'O-', 'HAI-', 'O-', 'Ο-', 'O-', 'O-', 'O-', 'O-', 'ઓ-', 'O-', 'O-', 'ਓ-', 'O-', 'O-', 'O-', 'O-'),
(270, 'ab_positive', 'AB+', 'এবি পজিটিভ', 'AB +', 'AB +', 'एबी +', 'AB+', 'AB+', 'AB+', 'AB+', 'AB +', 'AB+', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'એબી +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +', 'AB +'),
(271, 'ab_negative', 'AB-', 'এবি নেগেটিভ', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB', 'AB', 'AB-', 'AB-', 'ΑΒ-', 'AB-', 'AB-', 'AB-', 'மோலின்', 'એબી-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-', 'AB-'),
(272, 'vendor', 'Vendor', 'বিক্রেতা', 'Vendedor', 'بائع', 'विक्रेता', 'وینڈر', 'AB-', 'ベンダー', 'Fornecedor', 'продавец', 'Vendeur', '공급 업체', 'Verkäufer', 'venditore', 'ผู้ขาย', 'Eladó', 'Verkoper', 'vendor', 'Penjaja', 'satıcı', 'Προμηθευτή', 'فروشنده', 'Penjual', 'Vendor', 'விற்பனையாளர்', 'વેન્ડર', 'Sprzedawca', 'Постачальник', 'ਵਿਕਰੇਤਾ', 'Vânzător', 'ရောင်းချသူ', 'Oluwo', 'Mai sayarwa'),
(273, 'relative', 'Relative', 'আত্মীয়', 'Relativo', 'نسبيا', 'सापेक्ष', 'رشتہ دار', '相对的', '相対', 'Relativo', 'Относительный', 'Relatif', '상대적인', 'Relativ', 'Parente', 'ญาติ', 'Relatív', 'Familielid', 'relativum', 'Relatif', 'bağıl', 'Συγγενής', 'نسبت فامیلی', 'Relatif', 'సంబంధిత', 'உறவினர்', 'સંબંધી', 'Krewny', 'Відносний', 'ਿਰਸ਼ਤੇਦਾਰ', 'Relativ', 'ဆွေမျိုး', 'ojulumo', 'Aboki'),
(274, 'friend', 'Friend', 'বন্ধু', 'Amigo', 'صديق', 'दोस्त', 'دوست', '朋友', '友人', 'Amigos', 'Друг', 'Ami', '친구', 'Freund', 'Amico', 'เพื่อน', 'Barát', 'Vriend', 'amica', 'Teman', 'Arkadaş', 'Φίλος', 'دوست', 'Kawan', 'స్నేహితుని', 'நண்பன்', 'મિત્ર', 'Przyjaciel', 'Друг', 'ਦੋਸਤ', 'Prieten', 'မိတျဆှေ', 'Ọrẹ', 'Aboki'),
(275, 'family', 'Family', 'পরিবার', 'Familia', 'أسرة', 'परिवार', 'خاندان', '家庭', '家族', 'Família', 'семья', 'Famille', '가족', 'Familie', 'Famiglia', 'ครอบครัว', 'Család', 'Familie', 'familia', 'Keluarga', 'Aile', 'Οικογένεια', 'خانواده', 'Keluarga', 'కుటుంబ', 'குடும்ப', 'કૌટુંબિક', 'Rodzina', 'Сімя', 'ਪਰਿਵਾਰ', 'Familie', 'မိသားစု', 'Ìdílé', 'Iyali'),
(276, 'interview', 'Interview', 'সাক্ষাত্কার', 'Entrevista', 'مقابلة', 'साक्षात्कार', 'انٹرویو', '访问', 'インタビュー', 'Entrevista', 'Интервью', 'Entretien', '회견', 'Interview', 'Colloquio', 'สัมภาษณ์', 'Interjú', 'Interview', 'colloquium', 'Wawancara', 'Röportaj', 'Συνέντευξη', 'مصاحبه', 'Temu bual', 'ఇంటర్వ్యూ', 'பேட்டி', 'મુલાકાત', 'Wywiad', 'Інтервю', 'ਇੰਟਰਵਿਊ', 'Interviu', 'အင်တာဗျူး', 'Ibarawe', 'Tambayar'),
(277, 'meeting', 'Meeting', 'সাক্ষাৎ', 'Reunión', 'لقاء', 'मुलाकात', 'اجلاس', '会议', '会議', 'encontro', 'Встреча', 'Réunion', '모임', 'Treffen', 'Incontro', 'การประชุม', 'Találkozó', 'Vergadering', 'occurrens', 'Pertemuan', 'Toplantı', 'Συνάντηση', 'ملاقات', 'Mesyuarat', 'సమావేశం', 'சந்தித்தல்', 'બેઠક', 'Spotkanie', 'Зустріч', 'ਮੀਟਿੰਗ', 'Întâlnire', 'အစည်းအဝေး', 'Ipade', 'Haduwa'),
(278, 'mandatory', 'Mandatory', 'বাধ্যতামূলক', 'Obligatorio', 'إلزامي', 'अनिवार्य', 'لازمی', '强制性', '必須', 'Obrigatório', 'Обязательное', 'Obligatoire', '필수', 'Verpflichtend', 'Obbligatorio', 'จำเป็น', 'Kötelező', 'Verplicht', 'amet', 'Wajib', 'Zorunlu', 'Επιτακτικός', 'اجباری', 'Mandatori', 'తప్పనిసరి', 'கட்டாயமாகும்', 'ફરજિયાત', 'Obowiązkowy', 'Обовязковий', 'ਲਾਜ਼ਮੀ', 'Obligatoriu', 'အတင်းအကျပ်ဖြစ်သော', 'Dandan', 'M'),
(279, 'optional', 'Optional', 'ঐচ্ছিক', 'Opcional', 'اختياري', 'ऐच्छिक', 'اختیاری', '可选的', 'オプション', 'Opcional', 'Необязательный', 'Optionnel', '선택 과목', 'Wahlweise', 'Opzionale', 'ไม่จำเป็น', 'Választható', 'facultatief', 'libitum', 'Pilihan', 'İsteğe bağlı', 'Προαιρετικός', 'اختیاری', 'Pilihan', 'ఐచ్ఛికము', 'விருப்ப', 'વૈકલ્પિક', 'Opcjonalny', 'Необовязково', 'ਵਿਕਲਪਿਕ', 'facultativ', 'optional', 'Aṣayan', 'Zabin'),
(280, 'science', 'Science', 'বিজ্ঞান', 'Ciencia', 'علم', 'विज्ञान', 'سائنس', '科学', '科学', 'Ciência', 'Наука', 'Science', '과학', 'Wissenschaft', 'Scienza', 'วิทยาศาสตร์', 'Tudomány', 'Wetenschap', 'scientia', 'Ilmu', 'Bilim', 'Επιστήμη', 'علوم پایه', 'Sains', 'సైన్స్', 'அறிவியல்', 'વિજ્ઞાન', 'Nauka', 'Наука', 'ਵਿਗਿਆਨ', 'Ştiinţă', 'သိပ္ပံ', 'Imọ', 'Kimiyya'),
(281, 'arts', 'Arts', 'কলা', 'Letras', 'فنون', 'कला', 'آرٹس', '艺术', '芸術', 'Artes', 'искусства', 'Arts', '기예', 'Kunst', 'Arts', 'ศิลปะ', 'Arts', 'Arts', 'artium', 'Seni', 'Sanat', 'Τέχνες', 'هنرها', 'Seni', 'ఆర్ట్స్', 'கலை', 'આર્ટસ', 'Sztuka', 'Мистецтво', 'ਆਰਟਸ', 'Arte', 'ဝိဇ္ဇာ', 'Ọgbọn', 'Arts'),
(282, 'commerce', 'Commerce', 'বাণিজ্য', 'Comercio', 'تجارة', 'व्यापार', 'کامرس', '商业', 'コマース', 'Comércio', 'коммерция', 'Commerce', '상업', 'Handel', 'Commercio', 'พาณิชย์', 'kereskedelem', 'Handel', 'Commerce', 'Perdagangan', 'Ticaret', 'Εμπόριο', 'بازرگانی', 'Perdagangan', 'కామర్స్', 'வர்த்தக', 'વાણિજ્ય', 'Handel', 'Торгівля', 'ਵਣਜ', 'Comerţ', 'ရောင်းဝယ်ဖေါက်ကားခြင်း', 'Okoowo', 'Kasuwanci'),
(283, 'saturday', 'Saturday', 'শনিবার', 'sábado', 'يوم السبت', 'शनिवार', 'ہفتہ', '星期六', '土曜日', 'sábado', 'суббота', 'samedi', '토요일', 'Samstag', 'Sabato', 'วันเสาร์', 'szombat', 'zaterdag', 'Saturni', 'Sabtu', 'Cumartesi', 'Σάββατο', 'شنبه', 'Sabtu', 'శనివారం', 'சனிக்கிழமை', 'શનિવાર', 'sobota', 'Субота', 'ਸ਼ਨੀਵਾਰ', 'sâmbătă', 'စနေနေ့', 'Ọjọ Satidee', 'Asabar'),
(284, 'sunday', 'Sunday', 'রবিবার', 'domingo', 'الأحد', 'रविवार', 'اتوار', '星期日', '日曜日', 'domingo', 'Воскресенье', 'dimanche', '일요일', 'Sonntag', 'Domenica', 'วันอาทิตย์', 'vasárnap', 'zondag', 'Solis', 'Minggu', 'Pazar', 'Κυριακή', 'یکشنبه', 'Ahad', 'ఆదివారం', 'ஞாயிறு', 'રવિવાર', 'niedziela', 'Неділя', 'ਐਤਵਾਰ', 'duminică', 'တနင်္ဂနွေ', 'Sunday', 'Lahadi'),
(285, 'monday', 'Monday', 'সোমবার', 'lunes', 'الإثنين', 'सोमवार', 'سوموار', '星期一', '月曜', 'Segunda-feira', 'понедельник', 'Lundi', '월요일', 'Montag', 'Lunedi', 'วันจันทร์', 'hétfő', 'maandag', 'dies Lunae', 'Senin', 'Pazartesi', 'Δευτέρα', 'دوشنبه', 'Isnin', 'సోమవారం', 'திங்கட்கிழமை', 'સોમવાર', 'poniedziałek', 'Понеділок', 'ਸੋਮਵਾਰ', 'luni', 'တနင်္လာနေ့', 'Awọn aarọ', 'Litinin'),
(286, 'tuesday', 'Tuesday', 'মঙ্গলবার', 'martes', 'الثلاثاء', 'मंगलवार', 'منگل', '星期二', '火曜日', 'terça', 'вторник', 'Mardi', '화요일', 'Dienstag', 'martedì', 'วันอังคาร', 'kedd', 'dinsdag', 'Martis', 'Selasa', 'Salı', 'Τρίτη', 'سهشنبه', 'Selasa', 'మంగళవారం', 'செவ்வாய்க்கிழமை', 'મંગળવારે', 'wtorek', 'Вівторок', 'ਮੰਗਲਵਾਰ', 'marţi', 'အင်္ဂါနေ့', 'Ojoba', 'Talata'),
(287, 'wednesday', 'Wednesday', 'বুধবার', 'miércoles', 'الأربعاء', 'बुधवार', 'بدھ', '星期三', '水曜日', 'Quarta-feira', 'среда', 'Mercredi', '수요일', 'Mittwoch', 'mercoledì', 'วันพุธ', 'szerda', 'woensdag', 'Mercurii', 'Rabu', 'Çarşamba', 'Τετάρτη', 'چهار شنبه', 'Rabu', 'బుధవారం', 'புதன்கிழமை', 'બુધવાર', 'środa', 'Середа', 'ਬੁੱਧਵਾਰ', 'miercuri', 'ဗုဒ္ဓဟူးနေ့', 'Ọjọrú', 'Laraba'),
(288, 'thursday', 'Thursday', 'বৃহস্পতিবার', 'jueves', 'الخميس', 'गुरूवार', 'جمعرات', '星期四', '木曜日', 'Quinta-feira', 'Четверг', 'Jeudi', '목요일', 'Donnerstag', 'giovedi', 'วันพฤหัสบดี', 'csütörtök', 'donderdag', 'Iovis', 'Kamis', 'Perşembe', 'Πέμπτη', 'پنج شنبه', 'Khamis', 'గురువారం', 'வியாழக்கிழமை', 'ગુરુવાર', 'czwartek', 'Четвер', 'ਵੀਰਵਾਰ', 'joi', 'ကြာသပတေးနေ့', 'Ojobo', 'Alhamis'),
(289, 'friday', 'Friday', 'শুক্রবার', 'viernes', 'يوم الجمعة', 'शुक्रवार', 'جمعہ', '星期五', '金曜日', 'Sexta-feira', 'пятница', 'Vendredi', '금요일', 'Freitag', 'Venerdì', 'วันศุกร์', 'péntek', 'vrijdag', 'Veneris', 'Jumat', 'Cuma', 'Παρασκευή', 'جمعه', 'Jumaat', 'శుక్రవారం', 'வெள்ளி', 'શુક્રવાર', 'piątek', 'Пятниця', 'ਸ਼ੁੱਕਰਵਾਰ', 'vineri', 'သောကြာနေ့', 'Ọjọ Ẹtì', 'Jummaa'),
(290, 'january', 'January', 'জানুয়ারী', 'enero', 'كانون الثاني', 'जनवरी', 'جنوری', '一月', '1月', 'janeiro', 'январь', 'janvier', '일월', 'Januar', 'gennaio', 'มกราคม', 'január', 'januari-', 'Ianuarii', 'Januari', 'Ocak', 'Ιανουάριος', 'ژانویه', 'Januari', 'జనవరి', 'ஜனவரி', 'જાન્યુઆરી', 'styczeń', 'Січень', 'ਜਨਵਰੀ', 'ianuarie', 'ဇန္နဝါရီလ', 'Oṣù', 'Janairu'),
(291, 'february', 'February', 'ফেব্রুয়ারি', 'febrero', 'شهر فبراير', 'फरवरी', 'فروری', '二月', '2月', 'fevereiro', 'февраль', 'février', '이월', 'Februar', 'febbraio', 'กุมภาพันธ์', 'február', 'februari', 'Februarius', 'Februari', 'Şubat', 'Φεβρουάριος', 'فوریه', 'Februari', 'ఫిబ్రవరి', 'பிப்ரவரி', 'ફેબ્રુઆરી', 'luty', 'Лютий', 'ਫਰਵਰੀ', 'februarie', 'ဖေဖေါ်ဝါရီလ', 'Kínní', 'Fabrairu'),
(292, 'march', 'March', 'মার্চ', 'marzo', 'مارس', 'मार्च', 'مارچ', '游行', '行進', 'marcha', 'Март', 'Mars', '행진', 'März', 'marzo', 'มีนาคม', 'március', 'maart', 'Martii', 'Maret', 'Mart', 'Μάρτιος', 'مارس', 'Mac', 'మార్చి', 'மார்ச்', 'કુચ', 'Marsz', 'Березень', 'ਮਾਰਚ', 'Martie', 'မတ်လ', 'Oṣù', 'Maris'),
(293, 'april', 'April', 'এপ্রিল', 'abril', 'أبريل', 'अप्रैल', 'اپریل', '四月', '4月', 'abril', 'апрель', 'avril', '4 월', 'April', 'aprile', 'เมษายน', 'április', 'april', 'Aprilis', 'April', 'Nisan', 'Απρίλιος', 'آوریل', 'April', 'ఏప్రిల్', 'ஏப்ரல்', 'એપ્રિલ', 'kwiecień', 'Квітень', 'ਅਪ੍ਰੈਲ', 'Aprilie', 'ဧပြီလ', 'Kẹrin', 'Afrilu'),
(294, 'may', 'May', 'মে', 'Mayo', 'قد', 'मई', 'مئی', '可能', '5月', 'Pode', 'май', 'mai', '할 수있다', 'Kann', 'potrebbe', 'อาจ', 'Lehet', 'mei', 'May', 'Mungkin', 'Mayıs ayı', 'Ενδέχεται', 'ممکن است', 'Mungkin', 'మే', 'மே', 'મે', 'Może', 'Може', 'ਮਈ', 'Mai', 'မေ', 'Ṣe', 'Mayu'),
(295, 'june', 'June', 'জুন', 'junio', 'يونيو', 'जून', 'جون', '六月', '六月', 'Junho', 'июнь', 'juin', '유월', 'Juni', 'giugno', 'มิถุนายน', 'június', 'juni-', 'June', 'Juni', 'Haziran', 'Ιούνιος', 'ژوئن', 'Jun', 'జూన్', 'ஜூன்', 'જૂન', 'czerwiec', 'Червень', 'ਜੂਨ', 'iunie', 'ဇွန်လ', 'Okudu', 'Yuni'),
(296, 'july', 'July', 'জুলাই', 'julio', 'يوليو', 'जुलाई', 'جولائی', '七月', '7月', 'Julho', 'июль', 'juillet', '칠월', 'Juli', 'luglio', 'กรกฎาคม', 'július', 'juli-', 'Iulii', 'Juli', 'Temmuz', 'Ιούλιος', 'جولای', 'Julai', 'జూలై', 'ஜூலை', 'જુલાઈ', 'lipiec', 'Липень', 'ਜੁਲਾਈ', 'iulie', 'ဇူလိုင်လ', 'Keje', 'Yuli'),
(297, 'august', 'August', 'অগাস্ট', 'agosto', 'أغسطس', 'अगस्त', 'اگست', '八月', '8月', 'agosto', 'августейший', 'août', '팔월', 'August', 'agosto', 'สิงหาคม', 'augusztus', 'augustus', 'August', 'Agustus', 'Ağustos', 'Αύγουστος', 'آگوست', 'Ogos', 'ఆగస్టు', 'ஆகஸ்ட்', 'ઓગસ્ટ', 'sierpień', 'Серпень', 'ਅਗਸਤ', 'August', 'သြဂုတ်လ', 'Oṣù Kẹjọ', 'Agusta'),
(298, 'september', 'September', 'সেপ্টেম্বর', 'septiembre', 'سبتمبر', 'सितंबर', 'ستمبر', '九月', '9月', 'setembro', 'сентябрь', 'septembre', '구월', 'September', 'settembre', 'กันยายน', 'szeptember', 'september', 'September', 'September', 'Eylül', 'Σεπτέμβριος', 'سپتامبر', 'September', 'సెప్టెంబర్', 'செப்டம்பர்', 'સપ્ટેમ્બર', 'wrzesień', 'Вересень', 'ਸਿਤੰਬਰ', 'Septembrie', 'စက်တင်ဘာလ', 'Oṣu Kẹsan', 'Satumba'),
(299, 'october', 'October', 'অক্টোবর', 'octubre', 'شهر اكتوبر', 'अक्टूबर', 'اکتوبر', '十月', '10月', 'Outubro', 'октября', 'octobre', '십월', 'Oktober', 'ottobre', 'ตุลาคม', 'október', 'oktober', 'Octobris', 'Oktober', 'Ekim', 'Οκτώβριος', 'اکتبر', 'Oktober', 'అక్టోబర్', 'அக்டோபர்', 'ઓક્ટોબર', 'październik', 'Жовтень', 'ਅਕਤੂਬਰ', 'octombrie', 'အောက်တိုဘာလ', 'Oṣu Kẹwa', 'Oktoba'),
(300, 'november', 'November', 'নভেম্বর', 'noviembre', 'شهر نوفمبر', 'नवंबर', 'نومبر', '十一月', '11月', 'novembro', 'ноябрь', 'novembre', '십일월', 'November', 'novembre', 'พฤศจิกายน', 'november', 'november', 'November', 'November', 'Kasım', 'Νοέμβριος', 'نوامبر', 'November', 'నవంబర్', 'நவம்பர்', 'નવેમ્બર', 'listopad', 'Листопад', 'ਨਵੰਬਰ', 'noiembrie', 'နိုဝင်ဘာလ', 'Kọkànlá Oṣù', 'Nuwamba'),
(301, 'december', 'December', 'ডিসেম্বর', 'diciembre', 'ديسمبر', 'दिसंबर', 'دسمبر', '十二月', '12月', 'dezembro', 'Декабрь', 'décembre', '12 월', 'Dezember', 'dicembre', 'ธันวาคม', 'december', 'december', 'December', 'Desember', 'Aralık', 'Δεκέμβριος', 'دسامبر', 'Disember', 'డిసెంబర్', 'டிசம்பர்', 'ડિસેમ્બર', 'grudzień', 'Грудень', 'ਦਸੰਬਰ', 'decembrie', 'ဒီဇင်ဘာလ', 'Oṣù Kejìlá', 'Disamba'),
(302, 'boys', 'Boy', 'ছেলে', 'Chico', 'صبي', 'लड़का', 'لڑکا', '男孩', '男の子', 'Garoto', 'мальчик', 'Garçon', '소년', 'Junge', 'Ragazzo', 'เด็กผู้ชาย', 'Fiú', 'Jongen', 'Puer', 'Anak laki-laki', 'Oğlan', 'Αγόρι', 'پسر', 'Budak lelaki', 'బాయ్', 'சிறுவன்', 'બોય', 'Chłopak', 'Хлопчик', 'ਮੁੰਡਾ', 'Băiat', 'ယောက်ျားလေး', 'Ọmọkunrin', 'Yaro'),
(303, 'girls', 'Girl', 'মেয়ে', 'Niña', 'فتاة', 'लड़की', 'لڑکی', '女孩', '女の子', 'Menina', 'девушка', 'Fille', '소녀', 'Mädchen', 'Ragazza', 'สาว', 'Lány', 'Meisje', 'puella', 'Gadis', 'Kız', 'Κορίτσι', 'دختر', 'Gadis', 'గర్ల్', 'பெண்', 'ગર્લ', 'Dziewczyna', 'Дівчина', 'ਕੁੜੀ', 'Fată', 'မိန်းကလေး', 'Ọdọmọbìnrin', 'Yarinya '),
(304, 'combine', 'Combine', 'যৌথ', 'Combinar', 'دمج', 'जोड़ना', 'یکجا', '结合', '結合する', 'Combinar', 'скомбинировать', 'Combiner', '콤바인', 'Kombinieren', 'combinare', 'รวมกัน', 'Kombájn', 'Combineren', 'miscere', 'Menggabungkan', 'birleştirmek', 'Συνδυασμός', 'ترکیب کردن', 'Gabung', 'మిళితం', 'இணைக்க', 'ભેગું કરો', 'Połączyć', 'Комбінувати', 'ਜੁੜੋ', 'Combina', 'ပေါင်းစပ်', 'Darapọ', 'Haɗa'),
(305, 'ac', 'AC', 'এসি', 'C.A.', 'AC', 'एसी', 'AC', 'AC', '交流', 'AC', 'переменный ток', 'AC', '교류', 'Wechselstrom', 'AC', 'ไฟฟ้ากระแสสลับ', 'AC', 'AC', 'n:', 'AC', 'AC', 'ΜΕΤΑ ΧΡΙΣΤΟΝ', 'AC', 'AC', 'AC', 'ஏசி', 'એસી', 'AC', 'AC', 'AC', 'AC', 'AC အ', 'AC', 'AC'),
(306, 'non_ac', 'Non AC', 'নন এসি', 'No AC', 'غير أس', 'गैर एसी', 'غیر AC', '非交流', '非AC', 'Não AC', 'Non AC', 'Pas ca', '비 AC', 'Nicht Wechselstrom', 'Non AC', 'ไม่ใช่ AC', 'Nem AC', 'Niet AC', 'non Passage', 'Non AC', 'AC olmayan', 'Μη AC', 'غیر AC', 'Bukan AC', 'నాన్ AC', 'அல்லாத ஏசி', 'બિન એસી', 'Bez klimatyzacji', 'Не AC', 'ਗੈਰ ਏਸੀ', 'Non AC', 'non AC အ', 'Ko si AC', 'Ba AC'),
(307, 'male', 'Male', 'পুরুষ', 'Masculino', 'الذكر', 'नर', 'مرد', '男', '男性', 'Masculino', 'мужчина', 'Mâle', '남성', 'Männlich', 'Maschio', 'ชาย', 'Férfi', 'Mannetje', 'Masculum', 'Pria', 'Erkek', 'Αρσενικός', 'نر', 'Lelaki', 'మగ', 'ஆண்', 'પુરૂષ', 'Męski', 'Чоловік', 'ਮਰਦ', 'Masculin', 'အထီး', 'Okunrin', 'Namiji'),
(308, 'female', 'Female', 'মহিলা', 'Hembra', 'إناثا', 'महिला', 'عورت', '女', '女性', 'Fêmea', 'женский', 'Femelle', '여자', 'Weiblich', 'Femmina', 'หญิง', 'Női', 'Vrouw', 'feminam', 'Wanita', 'Kadın', 'Θηλυκός', 'زن', 'Perempuan', 'మహిళ', 'பெண்', 'સ્ત્રી', 'Płeć żeńska', 'Жінка', 'ਔਰਤ', 'Femeie', 'အမြိုးသမီး', 'Obinrin', 'Mace'),
(309, 'unpaid', 'Unpaid', 'অপরিশোধিত', 'No pagado', 'غير مدفوع', 'अवैतनिक', 'نام نہاد', '未付', '未払い', 'Não remunerado', 'неоплаченный', 'Non payé', '지불되지 않은', 'Unbezahlt', 'non pagato', 'ยังไม่ได้ชำระ', 'Kifizetetlen', 'onbetaald', 'insolutis', 'Tidak dibayar', 'ödenmemiş', 'Απλήρωτος', 'بدون پرداخت هزینه', 'Tidak dibayar', 'చెల్లించని', 'செலுத்தப்படாத', 'અવેતન', 'Nie zapłacony', 'Несплачені', 'ਅਵੇਤਨਕ', 'neplătit', 'မရတဲ့', 'Aisanwo', 'Ba a biya'),
(310, 'partial', 'Partial', 'আংশিক', 'Parcial', 'جزئي', 'आंशिक', 'جزوی', '局部', '部分', 'Parcial', 'частичный', 'Partiel', '부분', 'Teilweise', 'Parziale', 'เป็นบางส่วน', 'Részleges', 'partieel', 'sive partiales', 'Sebagian', 'Kısmi', 'Μερικός', 'جزئي', 'Separa', 'పాక్షికం', 'பகுதி', 'આંશિક', 'Częściowy', 'Частково', 'ਅਧੂਰਾ', 'Parțial', 'တစိတ်တဒေသဖြစ်သော', 'Apa kan', 'M'),
(311, 'father', 'Father', 'পিতা', 'Padre', 'الآب', 'पिता', 'باپ', '父亲', 'お父さん', 'Pai', 'Отец', 'Père', '아버지', 'Father', 'Padre', 'พ่อ', 'Apa', 'Vader', 'Pater', 'Ayah', 'baba', 'Πατέρας', 'پدر', 'Bapa', 'తండ్రి', 'அப்பா', 'પિતા', 'Ojciec', 'Батько', 'ਪਿਤਾ ਜੀ', 'Tată', 'ဖခင်', 'Baba', 'Uba'),
(312, 'mother', 'Mother', 'মাতা', 'Madre', 'أم', 'मां', 'ماں', '母亲', '母', 'Mãe', 'Мама', 'Mère', '어머니', 'Mutter', 'Madre', 'แม่', 'Anya', 'Moeder', 'Mater', 'Ibu', 'anne', 'Μητέρα', 'مادر', 'Ibu', 'తల్లి', 'தாய்', 'મધર', 'Mama', 'Мама', 'ਮਾਤਾ ਜੀ', 'Mamă', 'မိခင်', 'Iya', 'Uwar'),
(313, 'sister', 'Sister', 'বোন', 'Hermana', 'أخت', 'बहन', 'دیدی', '妹妹', 'シスター', 'Irmã', 'Сестра', 'sœur', '여자 형제', 'Schwester', 'Sorella', 'น้องสาว', 'lánytestvér', 'Zus', 'Soror', 'Saudara', 'Kız kardeş', 'Αδελφή', 'خواهر', 'Kakak', 'సోదరి', 'சகோதரி', 'બહેન', 'Siostra', 'Сестра', 'ਭੈਣ', 'soră', 'အစ်မ', 'Arabinrin', 'yaruwa'),
(314, 'brother', 'Brother', 'ভাই', 'Hermano', 'شقيق', 'भाई', 'بھائی', '哥哥', '兄', 'Irmão', 'Брат', 'frère', '동료', 'Bruder', 'Fratello', 'พี่ชาย', 'fiú testvér', 'Broer', 'Frater', 'Saudara', 'Erkek kardeş', 'Αδελφός', 'برادر', 'adik', 'బ్రదర్', 'சகோதரன்', 'ભાઈ', 'Brat', 'Брат', 'ਭਰਾ', 'Frate', 'အစ်ကို', 'Arakunrin', 'ɗanuwana'),
(315, 'uncle', 'Uncle', 'চাচা', 'Tío', 'اخو الام', 'चाचा', 'چاچا', '叔叔', '叔父', 'Tio', 'Дядя', 'Oncle', '삼촌', 'Onkel', 'Zio', 'ลุง', 'Nagybácsi', 'Oom', 'avunculus', 'Paman', 'Amca dayı', 'Θείος', 'دایی', 'Paman', 'అంకుల్', 'மாமா', 'અંકલ', 'Wujek', 'Дядько', 'ਅੰਕਲ', 'unchi', 'ဘကြီး', 'aburo', 'kawuna'),
(316, 'maternal_uncle', 'Maternal Uncle', 'মামা', 'Tío materno', 'الخال', 'मा मा', 'ماموں', '舅', '母方の叔父', 'Tio materno', 'Дядя по матери', 'Oncle maternel', '임산부 삼촌', 'Onkel mütterlicherseits', 'Zio materno', 'คุณแม่ลุง', 'Anyai nagybátyja', 'Moeder oom', 'AVONCULUS', 'Paman ibu', 'Annelik Amca', 'Ο μητρικός θείος', 'دایی', 'Bapa saudara', 'మేనమామ', 'தாய் மாமா', 'માતૃત્વ અંકલ', 'Wujek od strony matki', 'Материнський дядько', 'ਮਾਵਾਂ ਦਾ ਅੰਕਲ', 'Unchiul matern', 'မိခင်ဦးလေး', 'obi aburo', 'Mahaifiyar uwa'),
(317, 'other_relative', 'Other Relative', 'অন্যান্য আত্মীয়', 'Otro pariente', 'قريب اخر', 'अन्य रिश्तेदार', 'دوسرے رشتے دار', '其他亲属', 'その他の相対', 'Outro parente', 'Другой родственник', 'Autre Relatif', '다른 친척', 'Anderer Verwandter', 'Altro parente', 'ญาติอื่น ๆ', 'Másik rokon', 'Ander familielid', 'aliud Relativum', 'Relatif lainnya', 'Diğer akraba', 'Αλλος συγγενης', 'خویشاوند دیگر', 'Saudara lain', 'మరొక బంధువు', 'மற்ற உறவினர்', 'અન્ય સંબંધી', 'Inne względne', 'Інший родич', 'ਹੋਰ ਰਿਸ਼ਤੇਦਾਰ', 'Altă rudă', 'ဆွေမျိုးကတခြား', 'Ebi miiran', 'Wasu dangi'),
(318, 'cash', 'Cash', 'নগদ', 'Efectivo', 'السيولة النقدية', 'कैश', 'نقد', '现金', '現金', 'Dinheiro', 'Денежные средства', 'En espèces', '현금', 'Kasse', 'Contanti', 'เงินสด', 'Készpénz', 'Contant geld', 'Cash', 'Kas', 'Nakit', 'Μετρητά', 'نقدی', 'Tunai', 'క్యాష్', 'பணம்', 'કેશ', 'Gotówka', 'Готівка', 'ਨਕਦ', 'Bani gheata', 'ငွေသား', 'Owo owo', 'tsabar kudi'),
(319, 'cheque', 'Cheque', 'চেক', 'Comprobar', 'التحقق من', 'चेक', 'چیک کریں', '检查', 'チェック', 'Verifica', 'Проверить', 'Vérifier', '검사', 'Prüfen', 'Dai unocchiata', 'ตรวจสอบ', 'Jelölje be', 'Controleren', 'represserat', 'Memeriksa', 'Kontrol', 'Ελεγχος', 'بررسی', 'Semak', 'తనిఖీ', 'சரிபார்க்கவும்', 'તપાસો', 'Czek', 'Перевірте', 'ਚੈਕ', 'Verifica', 'စစ်ဆေးခြင်း', 'Ṣayẹwo', 'Duba'),
(320, 'paypal', 'Paypal', 'পেপ্যাল', 'Paypal', 'باي بال', 'Paypal', 'پے پال', '贝宝', 'Paypal', 'Paypal', 'Paypal', 'Pay Pal', '페이팔', 'Paypal', 'Paypal', 'Paypal', 'Paypal', 'Paypal', 'Coin Paypal', 'Paypal', 'Paypal', 'Paypal', 'پی پال', 'Paypal', 'Paypal', 'பேபால்', 'પેપલ', 'Paypal', 'Paypal', 'ਪੇਪਾਲ', 'Paypal', 'paypal', 'PayPal', 'Paypal'),
(321, 'stripe', 'Stripe', 'এস্ট্রিপ', 'Raya', 'شريط', 'पट्टी', 'پٹی', '条纹', 'ストライプ', 'Listra', 'нашивка', 'Bande', '줄무늬', 'Streifen', 'Banda', 'ริ้ว', 'Csík', 'Streep', 'clavo', 'Garis', 'Şerit', 'Ταινία', 'خط خطی', 'Stripe', 'గీత', 'கோடுகள்', 'ગેરુનો', 'Naszywka', 'Смуга', 'ਧੱਬਾ', 'Dunga', 'အစင်း', 'adikala', 'Stripe'),
(322, 'payumoney', 'PayUMoney', 'পে ইউ মানি', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'Payumoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'PayUMoney', 'Payumoney', 'PayUMoney', 'PayUMoney', 'પેયમની', 'PayUMoney', 'PayUMoney', 'ਪੈਰਾਮਮਨੀ', 'PayUMoney', 'PayUMoney', 'PayIMEMB', 'PayPony'),
(323, 'clicktell', 'Clicktell', 'ক্লিকটেল', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', '클릭', 'Klicken', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'کلیک کنید', 'Clicktell', 'Clicktell', 'Clicktell', 'ક્લિકટેલ', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'Clicktell', 'TẹTẹ', 'Clicktell'),
(324, 'twilio', 'Twilio', 'টুইলিও', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'Twilio', 'ટ્વીલો', 'Twilio', 'Твіліо', 'ਟਵਿਲੀਓ', 'Twilio', 'Twilio', 'Twilio', 'Twilio'),
(325, 'bulk', 'Bulk', 'বাল্ক', 'Abultar', 'حجم', 'थोक', 'بلک', '块', 'バルク', 'Massa', 'насыпной', 'masse', '대부분', 'Bulk', 'Massa', 'ขนาดใหญ่', 'tömeg', 'massa', 'mole', 'Jumlah besar', 'yığın', 'Ογκος', 'فله', 'Pukal', 'బల్క్', 'மொத்த', 'બલ્ક', 'Objętość', 'Масова частка', 'ਬਲਕ', 'masă', 'ထုထည်', 'olopobobo', 'Girma');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(326, 'msg91', 'MSG91', 'এমএসজি 91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91', 'MSG91'),
(327, 'plivo', 'Plivo', 'প্লিবও', 'Plivo', 'Plivo', 'Plivo', 'پلیو', 'Plivo', 'Plivo', 'Plivo', 'Plivo', 'Pliva', '플라 보', 'Plivo', 'Plivo', 'Plivo', 'Plivo', 'Plivo', 'Plivo', 'Plivo', 'Plivo', 'Πλίβο', 'پلویو', 'Plivo', 'Plivo', 'Plivo', 'પ્લિવો', 'Plivo', 'Пліво', 'ਪਲਵਾ', 'Plivo', 'Plivo', 'Plivo', 'Plivo'),
(328, 'second', 'Second', 'সেকেন্ড', 'Segundo', 'ثانيا', 'दूसरा', 'دوسرا', '第二', '二番目', 'Segundo', 'второй', 'Seconde', '둘째', 'Zweite', 'Secondo', 'ที่สอง', 'Második', 'Tweede', 'secundi', 'Kedua', 'İkinci', 'Δεύτερος', 'دومین', 'Kedua', 'రెండవ', 'இரண்டாவது', 'બીજું', 'druga', 'Другий', 'ਦੂਜਾ', 'Al doilea', 'ဒုတိယ', 'Keji', 'Na biyu'),
(329, 'minute', 'Minute', 'মিনিট', 'Minuto', 'اللحظة', 'मिनट', 'منٹ', '分钟', '分', 'Minuto', 'минут', 'Minute', '분', 'Minute', 'minuto', 'นาที', 'Perc', 'Minuut', 'minute', 'Menit', 'Dakika', 'Λεπτό', 'دقیقه', 'Minit', 'నిమిషం', 'மினிட்', 'મિનિટ', 'Minuta', 'Хвилина', 'ਮਿੰਟ', 'Minut', 'မိနစ်', 'Iṣẹju', 'Minti'),
(330, 'hour', 'Hour', 'ঘন্টা', 'Hora', 'ساعة', 'घंटा', 'قیامت', '小时', '時間', 'Hora', 'Час', 'Heure', '시간', 'Stunde', 'Ora', 'ชั่วโมง', 'Óra', 'Uur', 'hora', 'Jam', 'Saat', 'Ωρα', 'ساعت', 'Jam', 'అవర్', 'ஹவர்', 'કલાક', 'Godzina', 'Година', 'ਘੰਟੇ', 'Ora', 'နာရီ', 'Wakati', 'Saa'),
(331, 'week', 'Week', 'সপ্তাহ', 'Semana', 'أسبوع', 'सप्ताह', 'ہفتہ', '周', '週間', 'Semana', 'Неделю', 'La semaine', '주', 'Woche', 'Settimana', 'สัปดาห์', 'Hét', 'Week', 'week', 'Minggu', 'Hafta', 'Εβδομάδα', 'هفته', 'Minggu', 'వారం', 'வீக்', 'અઠવાડિયું', 'Tydzień', 'Тиждень', 'ਹਫਤਾ', 'Săptămână', 'ရက်သတ္တပတ်', 'Osu', 'mako'),
(332, 'decade', 'Decade', 'দশক', 'Década', 'عقد', 'दशक', 'دہائی', '十', '10年', 'Década', 'десятилетие', 'Décennie', '로사리오 염주', 'Dekade', 'Decennio', 'ทศวรรษ', 'Évtized', 'Decennium', 'decennium', 'Dasawarsa', 'Onyıl', 'Δεκαετία', 'دهه', 'Dekad', 'దశాబ్దం', 'பத்தாண்டின்', 'દાયકા', 'Dekada', 'Десятиліття', 'ਦਹਾਕੇ', 'Deceniu', 'ဆယ်နှစ်', 'Ọdun mẹwa', 'Shekaru goma'),
(333, 'ago', 'Ago', 'পূর্বে', 'Hace', 'منذ', 'पूर्व', 'پہلے', '前', '前', 'Atrás', 'Тому назад', 'Depuis', '전에', 'Vor', 'Fa', 'มาแล้ว', 'Ezelőtt', 'Geleden', 'ante', 'Ago', 'Önce', 'Πριν', 'پیش', 'Ago', 'క్రితం', 'முன்பு', 'પહેલાં', 'Temu', 'Нарешті', 'ਪਹਿਲਾਂ', 'În urmă', 'လွန်ခဲ့တဲ့', 'Aago', 'da suka wuce'),
(334, 'from_now', 'From Now', 'এখন থেকে', 'Desde ahora', 'من الان', 'अब से', 'ابھی سے', '现在起', '今から', 'A partir de agora', 'Отныне', 'À partir de maintenant', '지금부터', 'In', 'Da adesso', 'จากนี้', 'Mostantól', 'Vanaf nu', 'Nunc', 'Mulai sekarang', 'Şu andan itibaren', 'Από τώρα', 'از حالا', 'Dari sekarang', 'ఇప్పటి నుండి', 'இப்போது இருந்து', 'હવેથી', 'Od teraz', 'Від тепер', 'ਹੁਣ ਤੋ', 'De acum', 'ယခုကနေ', 'Lati Bayi', 'Daga Yanzu'),
(335, 'bill_to', 'Bill To', 'বিল টু', 'Cobrar a', 'فاتورة الى', 'बिल प्राप्तकर्ता', 'کا بل', '记账到', '請求書送付先', 'Projeto de lei para', 'Плательщик', 'Facturer', '청구서 수신', 'Gesetzesentwurf für', 'Fatturare a', 'ส่งเบิกไปที่', 'Bill To', 'Rekening naar', 'Ad Bill', 'Pembayaran kepada', 'Ya fatura edilecek', 'Bill To', 'بیل تا', 'Bill To', 'బిల్ టు', 'பில் செய்ய', 'માટે બિલ', 'rachunek do', 'Білл Тод', 'ਬਿਲ ਕਰੋ', 'Proiect de lege pentru', 'ထံငွေတောင်းခံသည်', 'Isanowo fun', 'Lissafta zuwa'),
(336, 'password', 'Password', 'পাসওয়ার্ড', 'Contraseña', 'كلمه السر', 'पारण शब्द', 'پاس ورڈ', '密码', 'パスワード', 'Senha', 'пароль', 'Mot de passe', '암호', 'Passwort', 'Parola dordine', 'รหัสผ่าน', 'Jelszó', 'Wachtwoord', 'Password', 'Kata sandi', 'Parola', 'Κωδικός πρόσβασης', 'کلمه عبور', 'Kata laluan', 'పాస్వర్డ్', 'கடவுச்சொல்', 'પાસવર્ડ', 'Hasło', 'Пароль', 'ਪਾਸਵਰਡ', 'Parola', 'Password ကို', 'Ọrọigbaniwọle', 'Kalmar sirri'),
(337, 'manage_theme', 'Manage Theme', 'থিম পরিচালনা', 'Administrar el tema', 'إدارة الموضوع', 'थीम को प्रबंधित करें', 'تھیم کا نظم کریں', '管理主题', 'テーマを管理する', 'Gerenciar Tema', 'Управление темой', 'Gérer le thème', '테마 관리', 'Thema verwalten', 'Gestisci temi', 'จัดการธีม', 'Téma kezelése', 'Thema beheren', 'curo Natus', 'Kelola Tema', 'Temayı Yönet', 'Διαχείριση Θέματος', 'مدیریت تم', 'Uruskan Tema', 'థీమ్ను నిర్వహించండి', 'தீம் நிர்வகி', 'થીમ સંચાલિત કરો', 'Zarządzaj motywem', 'Управління темою', 'ਥੀਮ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați tema', 'အဓိကအကြောင်းအရာစီမံခန့်ခွဲရန်', 'Ṣakoso Akori', 'Sarrafa Jigo'),
(338, 'manage_language', 'Manage Language', 'ভাষা পরিচালনা করুন', 'Administrar el lenguaje', 'إدارة اللغة', 'भाषा प्रबंधित करें', 'زبان کا نظم کریں', '管理语言', '言語の管理', 'Gerenciar Idioma', 'Управление языком', 'Gérer la langue', '언어 관리', 'Sprache verwalten', 'Gestisci la lingua', 'จัดการภาษา', 'A nyelv kezelése', 'Taal beheren', 'Lingua curo', 'Kelola Bahasa', 'Dili Yönet', 'Διαχείριση γλώσσας', 'مدیریت زبان', 'Uruskan Bahasa', 'భాషను నిర్వహించండి', 'மொழி நிர்வகி', 'ભાષા મેનેજ કરો', 'Zarządzaj językiem', 'Управління мовою', 'ਭਾਸ਼ਾ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați limba', 'ဘာသာစကားများကိုစီမံခန့်ခွဲ', 'Ṣakoso Ede', 'Sarrafa Harshe'),
(339, 'manage_academic_year', 'Manage Academic Year', 'একাডেমিক বছর পরিচালনা করুন', 'Administrar el año académico', 'إدارة السنة الدراسية', 'अकादमिक वर्ष का प्रबंधन करें', 'تعلیمی سال کا نظم کریں', '管理学年', 'アカデミックイヤーを管理する', 'Gerenciar o Ano Acadêmico', 'Управление учебным годом', 'Gérer lannée académique', '학습 연도 관리', 'Akademisches Jahr verwalten', 'Gestisci lanno accademico', 'จัดการปีการศึกษา', 'Tanulmányi év kezelése', 'Academisch jaar beheren', 'Curo Academic Year', 'Mengelola Tahun Akademik', 'Akademik Yılı Yönet', 'Διαχειριστείτε το ακαδημαϊκό έτος', 'مدیریت سال تحصیلی', 'Urus Tahun Akademik', 'విద్యా సంవత్సరం నిర్వహించండి', 'கல்வி ஆண்டு நிர்வகி', 'શૈક્ષણિક વર્ષનું સંચાલન કરો', 'Zarządzaj Rokiem akademickim', 'Управління навчальним року', 'ਅਕਾਦਮਿਕ ਸਾਲ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați anul academic', 'ပညာရေးဆိုင်ရာတစ်နှစ်တာစီမံခန့်ခွဲရန်', 'Ṣakoso ọdun ẹkọ', 'Sarrafa Shekarar Kwalejin'),
(340, 'manage_role', 'Manage Role', 'রোল পরিচালনা করুন', 'Administrar rol', 'إدارة الدور', 'रोल प्रबंधित करें', 'رول کا نظم کریں', '管理角色', '役割の管理', 'Gerenciar o papel', 'Управление ролью', 'Manage Role', '역할 관리', 'Rolle verwalten', 'Gestisci il ruolo', 'จัดการบทบาท', 'A szerep kezelése', 'Rol beheren', 'Partes quas curo', 'Kelola Peran', 'Rolü Yönet', 'Διαχείριση ρόλου', 'مدیریت نقش', 'Mengurus Peranan', 'పాత్రను నిర్వహించండి', 'ரோல் நிர்வகி', 'રોલ મેનેજ કરો', 'Zarządzaj rolą', 'Управління роллю', 'ਭੂਮਿਕਾ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați rolul', 'အခန်းက္ပကိုစီမံခန့်ခွဲ', 'Ṣakoso Ipa', 'Sarrafa Matsayi'),
(341, 'manage_user', 'Manage User', 'ব্যবহারকারী পরিচালনা করুন', 'Administrar usuario', 'إدارة المستخدم', 'उपयोगकर्ता को प्रबंधित करें', 'صارف کا نظم کریں', '管理用户', 'ユーザーを管理する', 'Gerenciar Usuário', 'Управление пользователями', 'Manage User', '사용자 관리', 'Benutzer verwalten', 'Gestisci utente', 'จัดการผู้ใช้', 'Felhasználó kezelése', 'Beheer gebruiker', 'usorum regere', 'Kelola Pengguna', 'Kullanıcıyı Yönet', 'Διαχείριση χρήστη', 'مدیریت کاربر', 'Urus Pengguna', 'వినియోగదారుని నిర్వహించండి', 'பயனர் நிர்வகி', 'વપરાશકર્તાને મેનેજ કરો', 'Zarządzaj Użytkownikiem', 'Керувати користувачем', 'ਯੂਜ਼ਰ ਨੂੰ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați utilizatorul', 'အသုံးပြုသူကိုစီမံခန့်ခွဲ', 'Ṣakoso olumulo', 'Sarrafa Mai amfani'),
(342, 'manage_designation', 'Manage Designation', 'পদবী পরিচালনা করুন', 'Administrar Designación', 'إدارة التعيين', 'पदनाम प्रबंधित करें', 'عہدہ کا انتظام کریں', '管理指定', '指定管理', 'Gerenciar Designação', 'Управление обозначением', 'Gérer la désignation', '지정 관리', 'Benennung verwalten', 'Gestire la designazione', 'จัดการการกำหนด', 'A kijelölés kezelése', 'Aanwijzing beheren', 'curo VOCABULUM', 'Kelola Penunjukan', 'Tanımlamayı Yönetin', 'Διαχείριση ονομασίας', 'مدیریت تعیین', 'Urus Jawatan', 'హోదాను నిర్వహించండి', 'நிர்வகித்தலை நிர்வகி', 'હોદ્દો મેનેજ કરો', 'Zarządzaj oznaczeniem', 'Керування позначенням', 'ਡਿਜ਼ਾਈਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați desemnarea', 'သတ်မှတ်ပေးထားခြင်းကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Apẹrẹ', 'Sarrafa Zama'),
(343, 'manage_employee', 'Manage Employee', 'কর্মচারী পরিচালনা করুন', 'Administrar Empleado', 'إدارة الموظف', 'कर्मचारी को प्रबंधित करें', 'ملازم کا انتظام کریں', '管理员工', '従業員を管理する', 'Gerenciar Empregado', 'Управление сотрудниками', 'Gérer lemployé', '직원 관리', 'Mitarbeiter verwalten', 'Gestisci dipendente', 'จัดการพนักงาน', 'Alkalmazottak kezelése', 'Beheer werknemer', 'Aliquam curo', 'Mengelola Karyawan', 'Çalışanı Yönet', 'Διαχειριστείτε τον υπάλληλο', 'مدیریت کارمند', 'Urus Pekerja', 'ఉద్యోగిని నిర్వహించండి', 'பணியாளரை நிர்வகி', 'કર્મચારીનું સંચાલન કરો', 'Zarządzaj pracownikiem', 'Управління працівником', 'ਕਰਮਚਾਰੀ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați angajatul', 'ထမ်းများကိုစီမံကွပ်ကဲ', 'Ṣakoso awọn Abáni', 'Sarrafa Maaikata'),
(344, 'manage_teacher', 'Manage Teacher', 'শিক্ষক পরিচালনা করুন', 'Administra al maestro', 'إدارة المعلم', 'शिक्षक का प्रबंधन करें', 'ٹیچر کا نظم کریں', '管理教师', '教師を管理する', 'Gerenciar professor', 'Управление учителем', 'Gérer lenseignant', '교사 관리', 'Lehrer verwalten', 'Gestisci insegnante', 'จัดการครู', 'Tanár kezelése', 'Beheer de docent', 'curo Teacher', 'Kelola Guru', 'Öğretmen Yönet', 'Διαχειριστείτε τον Δάσκαλο', 'مدیریت معلم', 'Menguruskan Guru', 'టీచర్ని నిర్వహించండి ', 'ஆசிரியர் நிர்வகி', 'શિક્ષકનું સંચાલન કરો', 'Zarządzaj nauczycielem', 'Управління вчителем', 'ਅਧਿਆਪਕ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați învățătorul', 'အရှင်ဘုရားကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Olukọni', 'Sarrafa Malam'),
(345, 'manage_class', 'Manage Class', 'ক্লাস পরিচালনা করুন', 'Administrar clase', 'إدارة الفئة', 'क्लास को प्रबंधित करें', 'کلاس کا نظم کریں', '管理班级', 'クラスを管理する', 'Gerenciar Classe', 'Управление классом', 'Gérer la classe', '수업 관리', 'Klasse verwalten', 'Gestisci classe', 'จัดการ Class', 'Osztály kezelése', 'Beheer klasse', 'curo Paleonemertea Class', 'Kelola Kelas', 'Sınıfı Yönet', 'Διαχείριση της κλάσης', 'مدیریت کلاس', 'Urus Kelas', 'క్లాస్ని నిర్వహించండి', 'வகுப்பை நிர்வகி', 'ક્લાસ મેનેજ કરો', 'Zarządzaj klasą', 'Управління класом', 'ਕਲਾਸ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați clasa', 'Class ကိုစီမံခန့်ခွဲရန်', 'Ṣakoso Kilasi', 'Sarrafa Kundin'),
(346, 'manage_section', 'Manage Section', 'শাখা পরিচালনা করুন', 'Administrar la Sección', 'إدارة القسم', 'अनुभाग प्रबंधित करें', 'سیکشن کا نظم کریں', '管理部分', 'セクションを管理する', 'Gerenciar Seção', 'Управление разделами', 'Gérer la section', '섹션 관리', 'Abschnitt verwalten', 'Gestisci sezione', 'จัดการส่วน', 'Szekció kezelése', 'Beheer sectie', 'curo sect', 'Kelola Bagian', 'Bölümü Yönet', 'Διαχείριση της ενότητας', 'مدیریت بخش', 'Urus Seksyen', 'విభాగం నిర్వహించండి', 'பிரிவு நிர்வகி', 'વિભાગ મેનેજ કરો', 'Zarządzaj sekcją', 'Управління розділом', 'ਸੈਕਸ਼ਨ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați secțiunea', 'ပုဒ်မစီမံခန့်ခွဲရန်', 'Ṣakoso Apakan', 'Sarrafa Sashe'),
(347, 'manage_subject', 'Manage Subject', 'বিষয় পরিচালনা করুন', 'Administrar Asunto', 'إدارة الموضوع', 'विषय प्रबंधित करें', 'موضوع کا نظم کریں', '管理主题', '件名を管理する', 'Gerenciar Assunto', 'Управление предметами', 'Gérer le sujet', '주제 관리', 'Betreff verwalten', 'Gestisci soggetto', 'จัดการหัวเรื่อง', 'Subject kezelése', 'Beheer het onderwerp', 'curo Subject', 'Kelola Subjek', 'Konuyu Yönet', 'Διαχείριση θέματος', 'مدیریت موضوع', 'Uruskan Subjek', 'విషయాన్ని నిర్వహించండి', 'தலைப்பு நிர்வகி', 'વિષય સંચાલિત કરો', 'Zarządzaj tematem', 'Керувати темою', 'ਵਿਸ਼ਾ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați subiectul', 'အကြောင်းအရာစီမံခန့်ခွဲရန်', 'Ṣakoso Koko-ọrọ', 'Sarrafa Takardar'),
(348, 'manage_syllabus', 'Manage Syllabus', 'সিলেবাস পরিচালনা করুন', 'Administrar plan de estudios', 'إدارة المنهج', 'विषय प्रबंधित करें', 'Syllabus کو منظم کریں', '管理教学大纲', 'シラバスを管理する', 'Gerenciar o Syllabus', 'Управлять программой', 'Gérer le syllabus', '강의 계획서 관리', 'Syllabus verwalten', 'Gestisci il Sillabo', 'จัดการ Syllabus', 'A tanterv kezelése', 'Syllabus beheren', 'curo Syllabus', 'Mengelola Silabus', 'Ders Planını Yönet', 'Διαχείριση της διδακτέας ύλης', 'مدیریت برنامه درسی', 'Uruskan Sukatan pelajaran', 'సిలబస్ని నిర్వహించండి', 'பாடத்திட்டத்தை நிர்வகி', 'અભ્યાસક્રમ મેનેજ કરો', 'Zarządzaj programem Syllabus', 'Управління навчальним планом', 'ਸਿਲੇਬਸ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați programa', 'သင်ရိုးမာတိကာများကိုစီမံကွပ်ကဲ', 'Ṣakoso awọn Syllabus', 'Sarrafa Syllabus'),
(349, 'manage_routine', 'Manage Routine', 'রূটিন পরিচালনা করুন', 'Administrar la rutina', 'إدارة الروتينية', 'नियमित रूप से प्रबंधित करें', 'روٹین کا نظم کریں', '管理例程', 'ルーチンを管理する', 'Gerenciar rotina', 'Управление регулярностью', 'Gérer les routines', '루틴 관리', 'Routine verwalten', 'Gestisci routine', 'จัดการประจำ', 'Rutinkezelés', 'Beheer routine', 'curo DEFUNCTORIUS', 'Kelola Rutin', 'Rutini Yönet', 'Διαχείριση της ρουτίνας', 'مدیریت معمول', 'Urus Rutin', 'రొటీన్ నిర్వహించండి', 'வழக்கமான நிர்வகி', 'નિયમિત રૂપે મેનેજ કરો', 'Zarządzaj procedurą', 'Управління звичайним', 'ਰੁਟੀਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați rutina', 'ပုံမှန်စီမံခန့်ခွဲရန်', 'Ṣakoso Iṣakoso', 'Sarrafa Gyara'),
(350, 'manage_guardian', 'Manage Guardian', 'অভিভাবক পরিচালনা করুন', 'Administrar Guardian', 'إدارة الجارديان', 'संरक्षक प्रबंधन करें', 'گارڈین کا انتظام کریں', '管理监护人', 'Guardianを管理する', 'Manage Guardian', 'Управление опекуном', 'Manage Guardian', 'Guardian 관리', 'Wächter verwalten', 'Gestisci il guardiano', 'จัดการ Guardian', 'Guardian kezelése', 'Beheer Guardian', 'curo Custodes', 'Mengelola wali', 'Koruyucuyu yönet', 'Διαχειριστείτε τον Κηδεμόνα', 'مدیریت نگهبان', 'Urus Guardian', 'గార్డియన్ను నిర్వహించండి', 'கார்டியன் நிர்வகி', 'ગાર્ડિયન મેનેજ કરો', 'Zarządzaj opiekunem', 'Управління охоронцем', 'ਗਾਰਡੀਅਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați Gardianul', 'ဂါးဒီးယန်းသတင်းစာကိုစီမံခန့်ခွဲ', 'Ṣakoso Iṣakoso', 'Sarrafa Guardian'),
(351, 'manage_student', 'Manage Student', 'ছাত্র পরিচালনা করুন', 'Administrar estudiante', 'دارة الطالب', 'छात्र को प्रबंधित करें', 'طالب علم کا انتظام کریں', '管理学生', '学生を管理する', 'Gerenciar aluno', 'Управление Студентом', 'Gérer létudiant', '학생 관리', 'Schüler verwalten', 'Gestisci studente', 'จัดการนักเรียน', 'Diák kezelése', 'Beheer de student', 'Discipulus curo', 'Kelola Siswa', 'Öğrenciyi Yönet', 'Διαχείριση Φοιτητών', 'مدیریت دانش آموز', 'Uruskan Pelajar', 'విద్యార్థిని నిర్వహించండి', 'மாணவர் நிர்வகி', 'વિદ્યાર્થીનું સંચાલન કરો', 'Zarządzaj uczniem', 'Управління студентом', 'ਵਿਦਿਆਰਥੀ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați elevul', 'ကျောင်းသားစီမံခန့်ခွဲရန်', 'Ṣakoso awọn ọmọ-iwe', 'Sarrafa dalibi'),
(352, 'manage_assignment', 'Manage Assignment', 'অ্যাসাইনমেন্ট পরিচালনা করুন', 'Administrar la asignación', 'إدارة التعيين', 'असाइनमेंट प्रबंधित करें', 'اہتمام کا نظم کریں', '管理作业', '割り当てを管理する', 'Gerenciar Atribuição', 'Управление назначением', 'Gérer laffectation', '배정 관리', 'Zuordnung verwalten', 'Gestire lincarico', 'จัดการการมอบหมาย', 'Hozzárendelés kezelése', 'Toewijzing beheren', 'curo adsignatione', 'Kelola Penugasan', 'Ödev Yönetimi', 'Διαχείριση της εκχώρησης', 'تخصیص مدیریت', 'Urus Tugasan', 'అప్పగింతని నిర్వహించండి', 'பணியை நிர்வகி', 'સોંપણીનું સંચાલન કરો', 'Zarządzaj przypisaniem', 'Управління завданням', 'ਨਿਰਧਾਰਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați asignarea', 'တာဝန်စီမံခန့်ခွဲရန်', 'Ṣakoso awọn iṣẹ', 'Sarrafa Ayyukan'),
(353, 'manage_submission', 'Manage Submission', 'সাবমিশন পরিচালনা করুন', 'Administrar presentación', 'إدارة الإرسال', 'सबमिशन प्रबंधित करें', 'جمع کرانے کا انتظام کریں', '管理提交', '提出を管理する', 'Gerenciar Envio', 'Управление представлением', 'Gérer la soumission', '제출 관리', 'Einreichung verwalten', 'Gestisci invio', 'จัดการการส่ง', 'Feladat kezelése', 'Inzending beheren', 'curo Submission', 'Mengelola Pengiriman', 'Göndermeyi Yönet', 'Διαχείριση υποβολής', 'مدیریت ارسال', 'Urus Penyerahan', 'సమర్పణను నిర్వహించండి', 'சமர்ப்பிப்பு நிர்வகி', 'સબમિશન મેનેજ કરો', 'Zarządzaj przesłaniem', 'Управління поданням', 'ਸਬਮਿ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați depunerea', 'တင်ပြမှုကိုစီမံခန့်ခွဲရန်', 'Ṣakoso awọn Gbigbanilaaye', 'Sarrafa Yarjejeniya'),
(354, 'manage_grade', 'Manage Grade', 'গ্রেড পরিচালনা করুন', 'Administrar Grado', 'إدارة الصف', 'ग्रेड प्रबंधित करें', 'گریڈ کا انتظام کریں', '管理成绩', 'グレード管理', 'Gerenciar classificação', 'Управление классом', 'Gérer la note', '학년 관리', 'Klasse verwalten', 'Gestisci Grado', 'จัดการระดับ', 'Kezelje a fokozatot', 'Beheer Grade', 'curo Romani', 'Kelola Grade', 'Sınıfı Yönet', 'Διαχείριση βαθμού', 'مدیریت درجه', 'Urus Gred', 'గ్రేడ్ నిర్వహించండి', 'தரம் நிர்வகி', 'ગ્રેડ મેનેજ કરો', 'Zarządzaj oceną', 'Управління оцінкою', 'ਗਰੇਡ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați gradul', 'အဆင့်စီမံခန့်ခွဲရန်', 'Ṣakoso Iwọn', 'Sarrafa sauti'),
(355, 'manage_exam_term', 'Manage Exam Term', 'পরীক্ষার টার্ম পরিচালনা করুন', 'Administrar el término del examen', 'إدارة مدة الامتحان', 'परीक्षा अवधि का प्रबंधन करें', 'امتحان کی اصطلاح کا انتظام کریں', '管理考试期限', '試験期間を管理する', 'Termo de gerenciamento de exames', 'Управление сроком рассмотрения', 'Gérer le terme dexamen', '시험 기간 관리', 'Prüfungsbedingung verwalten', 'Gestisci il termine dellesame', 'จัดการระยะสอบ', 'Vizsgaidőszak kezelése', 'Beheer examenperiode', 'Curo termino IV', 'Mengelola Ujian Term', 'Sınav Süresini Yönet', 'Διαχειριστείτε τον όρο εξέτασης', 'مدیریت دوره امتحان', 'Mengurus Terma Ujian', 'పరీక్షా టర్మ్ నిర్వహించండి', 'தேர்வு கால நிர்வகி', 'પરીક્ષા મુદતની વ્યવસ્થા કરો', 'Zarządzaj egzaminem', 'Управління терміном іспиту', 'ਪ੍ਰੀਖਿਆ ਮਿਆਦ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați termenul de examinare', 'စာမေးပွဲကာလစီမံခန့်ခွဲရန်', 'Ṣakoso akoko Aawo', 'Sarrafa Jarrabawa'),
(356, 'manage_exam_schedule', 'Manage Exam Schedule', 'পরীক্ষার শিডিউল পরিচালনা করুন', 'Administrar el horario del examen', 'إدارة جدول الامتحانات', 'परीक्षा अनुसूची का प्रबंधन करें', 'امتحان شیڈول کا نظم کریں', '管理考试时间表', '試験スケジュールを管理する', 'Manejar o horário do Exame', 'Управление расписанием экзаменов', 'Gérer le calendrier des examens', '시험 일정 관리', 'Prüfungsablauf verwalten', 'Gestisci il calendario degli esami', 'จัดการกำหนดการสอบ', 'A vizsgaütemezés kezelése', 'Beheer examenschema', 'Curo Test Morbi rhoncus', 'Kelola Jadwal Ujian', 'Sınav Takvimini Yönet', 'Διαχειριστείτε το πρόγραμμα εξετάσεων', 'مدیریت برنامه امتحانات', 'Mengurus Jadual Peperiksaan', 'పరీక్షా షెడ్యూల్ నిర్వహించండి', 'தேர்வு அட்டவணை நிர்வகி', 'પરીક્ષાનું શેડ્યૂલ મેનેજ કરો', 'Zarządzaj harmonogramem egzaminu', 'Управління розкладом іспитів', 'ਪ੍ਰੀਖਿਆ ਅਨੁਸੂਚੀ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați programul de examen', 'စီမံခန့်ခွဲရန်စာမေးပွဲအချိန်ဇယား', 'Ṣakoso Akadii Akadọ', 'Sarrafa Jirgin Nazarin'),
(357, 'manage_suggestion', 'Manage Suggestion', 'সাজেশন পরিচালনা করুন', 'Administrar sugerencia', 'إدارة الاقتراح', 'सुझाव प्रबंधित करें', 'تجویز کا انتظام کریں', '管理建议', '提案を管理する', 'Gerenciar sugestão', 'Управление предложением', 'Gérer la suggestion', '제안 관리', 'Vorschläge verwalten', 'Gestire suggerimenti', 'จัดการคำแนะนำ', 'Javaslat kezelése', 'Suggestie beheren', 'curo Suggestion', 'Kelola Saran', 'Öneriyi Yönet', 'Διαχείριση της πρότασης', 'مدیریت پیشنهادی', 'Uruskan Cadangan', 'సూచన నిర్వహించండి', 'பரிந்துரை நிர்வகி', 'સૂચન મેનેજ કરો', 'Zarządzaj sugestią', 'Керувати пропозицією', 'ਸੁਝਾਅ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați sugestiile', 'အကြံပြုချက်များကိုစီမံကွပ်ကဲ', 'Ṣakoso Ọrọ', 'Sarrafa Bayani'),
(358, 'manage_exam_attendance', 'Manage Exam Attendance', 'পরীক্ষার উপস্থিতি পরিচালনা করুন', 'Administrar la asistencia al examen', 'إدارة امتحان الحضور', 'परीक्षा उपस्थिति का प्रबंधन करें', 'امتحان کی حاضری کا نظم کریں', '管理考试考勤', '試験出席を管理する', 'Gerenciar atendimento ao exame', 'Управление экзаменом', 'Gérer la présence aux examens', '시험 출석 관리', 'Prüfungsbesuch verwalten', 'Gestisci la frequenza degli esami', 'จัดการการเข้าร่วมการสอบ', 'Vizsgálati részvétel kezelése', 'Beheer examen aanwezigheid', 'Curo IV Attendance', 'Mengelola Kehadiran Ujian', 'Sınav Katılımını Yönet', 'Διαχείριση συμμετοχής στις εξετάσεις', 'مدیریت حضور در آزمون', 'Menguruskan Kehadiran Peperiksaan', 'పరీక్షా హాజరు నిర్వహించండి', 'தேர்வுப் பணிகளை நிர்வகி', 'પરીક્ષા એટેન્ડન્સ મેનેજ કરો', 'Zarządzaj uczestnictwem w egzaminie', 'Керування відвідуванням іспитів', 'ਪ੍ਰੀਖਿਆ ਹਾਜ਼ਰੀ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați participarea la examene', 'စာမေးပွဲတက်ရောက်စီမံခန့်ခွဲရန်', 'Ṣakoso akoko isinwo', 'Sarrafa Harkokin Binciken'),
(359, 'manage_mark', 'Manage Mark', 'মার্ক পরিচালনা করুন', 'Administrar marca', 'إدارة مارك', 'मार्क को प्रबंधित करें', 'مارک کا نظم کریں', '管理标记', 'マークを管理する', 'Gerenciar marca', 'Управление меткой', 'Gérer la marque', '마크 관리', 'Mark verwalten', 'Gestisci Marco', 'จัดการ Mark', 'Mark kezelése', 'Beheer Mark', 'Mark curo', 'Kelola Mark', 'Markı Yönet', 'Διαχείριση σήματος', 'مدیریت علامت گذاری', 'Urus Mark', 'మార్క్ని నిర్వహించండి', 'மார்க் நிர்வகி', 'માર્ક મેનેજ કરો', 'Zarządzaj Markem', 'Керувати знаком', 'ਮਾਰਕ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați marca', 'မာကုကိုစီမံခန့်ခွဲ', 'Ṣakoso Samisi', 'Sarrafa Alama'),
(360, 'manage_mark_sheet', 'Manage Mark Sheet', 'মার্ক শীট পরিচালনা করুন', 'Administrar la hoja de marca', 'إدارة علامة ورقة', 'मार्क शीट को प्रबंधित करें', 'مارک شیٹ کا انتظام کریں', '管理标记表', 'マークシートを管理する', 'Manage Mark Sheet', 'Управление меткой', 'Gérer la feuille de marque', '마크 시트 관리', 'Mark Sheet verwalten', 'Gestisci Mark Sheet', 'จัดการแผ่นมาร์ค', 'Márkajelzés kezelése', 'Markeringsblad beheren', 'Curo Mark Sheet', 'Kelola Lembar Mark', 'Marka Sayfasını Yönet', 'Διαχείριση φύλλου σημείων', 'مدیریت برگه علامت گذاری', 'Urus Mark Sheet', 'మార్క్ షీట్ని నిర్వహించండి', 'மார்க் தாளை நிர்வகி', 'માર્કશીટ મેનેજ કરો', 'Zarządzaj arkuszem markerów', 'Керування таблицею маркування', 'ਮਾਰਕ ਸ਼ੀਟ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați foaia de marcă', 'မာကုစာရွက်စီမံခန့်ခွဲရန်', 'Ṣakoso Ṣiṣisi Marisi', 'Sarrafa Takardar Market'),
(361, 'manage_exam_result', 'Manage Exam Result', 'পরীক্ষার ফলাফল পরিচালনা করুন', 'Administrar el resultado del examen', 'إدارة نتيجة الامتحان', 'परीक्षा परिणाम प्रबंधित करें', 'امتحان کے نتائج کا نظم کریں', '管理考试结果', '試験結果を管理する', 'Gerenciar Resultado do Exame', 'Управлять результатом экзамена', 'Gérer le résultat dexamen', '시험 결과 관리', 'Prüfungsergebnis verwalten', 'Gestisci risultato esame', 'จัดการผลลัพธ์การสอบ', 'Vizsgálati eredmény kezelése', 'Beheer examenresultaat', 'Curo Test Result', 'Mengelola Hasil Ujian', 'Sınav Sonuçlarını Yönet', 'Διαχείριση Αποτέλεσμα Εξετάσεων', 'مدیریت نتیجه آزمون', 'Urus Keputusan Peperiksaan', 'పరీక్ష ఫలితం నిర్వహించండి', 'தேர்வு முடிவு நிர்வகி', 'પરીક્ષાનું પરિણામ મેનેજ કરો', 'Zarządzaj wynikami egzaminu', 'Управління результатом іспиту', 'ਪ੍ਰੀਖਿਆ ਨਤੀਜੇ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați rezultatul examenului', 'စာမေးပွဲရလဒ်စီမံခန့်ခွဲရန်', 'Ṣakoso abajade abajade', 'Sarrafa sakamakon binciken'),
(362, 'manage_promotion', 'Manage Promotion', 'পদোন্নতি পরিচালনা করুন', 'Administrar promoción', 'إدارة الترويج', 'पदोन्नति प्रबंधित करें', 'فروغ کا انتظام کریں', '管理推广', 'プロモーションの管理', 'Gerenciar Promoção', 'Управление продвижением', 'Gérer la promotion', '프로모션 관리', 'Werbung verwalten', 'Gestisci la promozione', 'จัดการโปรโมชัน', 'A promóció kezelése', 'Promotie beheren', 'curo Promotio', 'Kelola Promosi', 'Promosyonu Yönetin', 'Διαχείριση προώθησης', 'مدیریت تبلیغ', 'Uruskan Promosi', 'ప్రచారం నిర్వహించండి', 'விளம்பரத்தை நிர்வகி', 'પ્રમોશન મેનેજ કરો', 'Zarządzaj promocją', 'Керування просуванням', 'ਤਰੱਕੀ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați promovarea', 'မြှင့်တင်ရေးစီမံခန့်ခွဲရန်', 'Ṣakoso Ipolowo', 'Sarrafa gabatarwa'),
(363, 'manage_book', 'Manage Book', 'বই পরিচালনা করুন', 'Administrar libro', 'إدارة الكتاب', 'पुस्तक को प्रबंधित करें', 'کتاب کا نظم کریں', '管理书籍', '書籍を管理する', 'Manage Book', 'Управление книгой', 'Gérer le livre', '도서 관리', 'Buch verwalten', 'Gestisci il libro', 'จัดการหนังสือ', 'Könyv kezelése', 'Beheer het boek', 'curo Books', 'Kelola Buku', 'Kitabı Yönet', 'Διαχείριση Βιβλίου', 'مدیریت کتاب', 'Urus Buku', 'బుక్ని నిర్వహించండి', 'புத்தகத்தை நிர்வகி', 'બુક મેનેજ કરો', 'Zarządzaj książką', 'Керувати книгою', 'ਬੁੱਕ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați cartea', 'စာအုပ်များကိုစီမံကွပ်ကဲ', 'Ṣakoso Iwe', 'Sarrafa Littafin'),
(364, 'manage_library_member', 'Manage Library Member', 'লাইব্রেরি সদস্য পরিচালনা করুন', 'Administrar miembro de la biblioteca', 'إدارة عضو المكتبة', 'लाइब्रेरी सदस्य को प्रबंधित करें', 'لائبریری اراکین کو منظم کریں', '管理图书馆成员', '図書館員を管理する', 'Gerenciar Membro da Biblioteca', 'Управление членом библиотеки', 'Gérer un membre de bibliothèque', '도서관 회원 관리', 'Bibliotheksmitglied verwalten', 'Gestisci membro della biblioteca', 'จัดการสมาชิกห้องสมุด', 'A könyvtári tagok kezelése', 'Beheer bibliotheeklid', 'Curo library Member', 'Kelola Anggota Perpustakaan', 'Kütüphane Üyesini Yönet', 'Διαχείριση μέλους μέλους βιβλιοθήκης', 'مدیریت عضو کتابخانه', 'Urus Ahli Perpustakaan', 'లైబ్రరీ సభ్యుడిని నిర్వహించండి', 'நூலக உறுப்பினர் நிர்வகி', 'લાઇબ્રેરી સભ્ય મેનેજ કરો', 'Zarządzaj członkiem biblioteki', 'Керування членом бібліотеки', 'ਲਾਇਬ੍ਰੇਰੀ ਮੈਂਬਰ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați membrul bibliotecii', 'စာကြည့်တိုက်အဖွဲ့ဝင်ကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Ìkàwé Ẹgbẹ', 'Sarrafa Library Member'),
(365, 'manage_issue_and_return', 'Manage Issue & Return', 'ইস্যু এবং রিটার্ন পরিচালনা করুন', 'Administrar problema y devolución', 'إدارة المشكلة والعودة', 'अंक और वापसी का प्रबंधन करें', 'مسئلہ اور واپسی کا انتظام کریں', '管理问题和退货', '問題とリターンを管理する', 'Gerenciar Problema e Retorno', 'Управление выпуском и возвратом', 'Gérer le problème et le retour', '문제 및 반환 관리', 'Problem und Rückgabe verwalten', 'Gestisci problema e ritorno', 'จัดการปัญหาและการส่งคืน', 'A kibocsátás és a visszatérés kezelése', 'Beheer kwestie en terugkeer', 'Curo Part et Redi', 'Kelola Masalah dan Kembali', 'Sayı ve İadeyi Yönetin', 'Διαχείριση της έκδοσης και της επιστροφής', 'مدیریت مسئله و بازگشت', 'Menguruskan Isu dan Pulangan', 'ఇష్యూ మరియు రిటర్న్ని నిర్వహించండి', 'Issue & Return ஐ நிர்வகி', 'અંક અને રીટર્ન મેનેજ કરો', 'Zarządzaj problemem i zwrotem', 'Управління проблемою та поверненням', 'ਸਮੱਸਿਆ ਅਤੇ ਵਾਪਸੀ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați emisiunea și returnarea', 'စီမံခန့်ခွဲ Issue & ပြန်သွား', 'Ṣakoso oro & Pada', 'Sarrafa Fitawa & Komawa'),
(366, 'manage_vehicle', 'Manage Vehicle', 'যানবাহন পরিচালনা করুন', 'Administrar vehículo', 'إدارة المركبات', 'वाहन को प्रबंधित करें', 'گاڑی کا نظم کریں', '管理车辆', '車両を管理する', 'Gerenciar veículo', 'Управление транспортным средством', 'Gérer le véhicule', '차량 관리', 'Fahrzeug verwalten', 'Gestisci veicolo', 'จัดการยานพาหนะ', 'Jármű kezelése', 'Beheer voertuig', 'curo vehiculum', 'Kelola Kendaraan', 'Aracı Yönet', 'Διαχειριστείτε το όχημα', 'مدیریت خودرو', 'Menguruskan Kenderaan', 'వాహనాన్ని నిర్వహించండి', 'வாகனத்தை நிர்வகி', 'વાહનનું સંચાલન કરો', 'Zarządzaj pojazdem', 'Управління транспортним засобом', 'ਵਾਹਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați vehiculul', 'ယာဉ်များကိုစီမံကွပ်ကဲ', 'Ṣakoso ọkọ', 'Sarrafa abin hawa'),
(367, 'manage_route', 'Manage Route', 'রুট পরিচালনা করুন', 'Administrar ruta', 'إدارة الطريق', 'रूट प्रबंधित करें', 'روٹ کا نظم کریں', '管理路线', 'ルートを管理する', 'Gerencie a rota', 'Управление маршрутом', 'Gérer la route', '경로 관리', 'Route verwalten', 'Gestisci percorso', 'จัดการเส้นทาง', 'Útvonal kezelése', 'Beheer route', 'curo itineris', 'Kelola Rute', 'Güzergahı Yönet', 'Διαχείριση διαδρομής', 'مدیریت مسیر', 'Urus Laluan', 'మార్గాన్ని నిర్వహించండి', 'வழி நிர்வகி', 'રૂટનું સંચાલન કરો', 'Zarządzaj trasą', 'Керувати маршрутом', 'ਰੂਟ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați rută', 'လမ်းကြောင်းများကိုစီမံကွပ်ကဲ', 'Ṣakoso Itọsọna', 'Sarrafa Hanya'),
(368, 'manage_transport_member', 'Manage Transport Member', 'পরিবহন সদস্য পরিচালনা করুন', 'Administrar miembro de transporte', 'إدارة عضو النقل', 'परिवहन सदस्य को प्रबंधित करें', 'ٹرانسپورٹ اراکین کا انتظام کریں', '管理交通会员', '移送メンバーの管理', 'Gerenciar o Membro do Transporte', 'Управление транспортом', 'Manage Transport Member', '전송 구성원 관리', 'Transportmitglied verwalten', 'Gestisci membro di trasporto', 'จัดการสมาชิกการขนส่ง', 'A közlekedési képviselő kezelése', 'Beheer transportlid', 'Curo onerariam Member', 'Kelola Anggota Transport', 'Taşıyıcı Üyeyi Yönet', 'Διαχειριστείτε το μέλος μεταφοράς', 'مدیریت حمل و نقل', 'Urus Ahli Pengangkutan', 'రవాణా సభ్యునిని నిర్వహించండి', 'போக்குவரத்து உறுப்பினர் நிர்வகி', 'પરિવહન સભ્યને મેનેજ કરો', 'Zarządzaj członkiem transportu', 'Керувати членом транспорту', 'ਟਰਾਂਸਪੋਰਟ ਮੈਂਬਰ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați transportul membru', 'ပို့ဆောင်ရေးအဖွဲ့ဝင်ကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Ọkọ-ajo', 'Sarrafa Sanya Manyan'),
(369, 'manage_hostel', 'Manage Hostel', 'ছাত্রাবাস পরিচালনা করুন', 'Administrar Hostel', 'إدارة نزل', 'होस्टल को प्रबंधित करें', 'ہالینڈ کا نظم کریں', '管理旅馆', 'ホステルを管理する', 'Manage Hostel', 'Управление хостелом', 'Gérer lauberge', '호스텔 관리', 'Hostel verwalten', 'Gestisci lostello', 'จัดการ Hostel', 'Kezelheti a Hostelet', 'Beheer Hostel', 'curo Hostel', 'Kelola Hostel', 'Pansiyon Yönet', 'Διαχειριστείτε τον ξενώνα', 'مدیریت خوابگاه', 'Urus Asrama', 'హాస్టల్ను నిర్వహించండి', 'Hostel நிர்வகி', 'છાત્રાલયનું સંચાલન કરો', 'Zarządzaj Hostelem', 'Управління хостел', 'ਹੋਸਟਲ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați Pensiune', 'ဘော်ဒါဆောင်စီမံခန့်ခွဲရန်', 'Ṣakoso awọn ile ayagbe', 'Sarrafa dakunan kwanan dalibai'),
(370, 'manage_room', 'Manage Room', 'কক্ষ পরিচালনা করুন', 'Administrar habitación', 'إدارة الغرفة', 'कक्ष को प्रबंधित करें', 'کمرے کا نظم کریں', '管理室', '部屋を管理する', 'Manage Room', 'Управление комнатой', 'Gérer la pièce', '방 관리', 'Raum verwalten', 'Gestisci stanza', 'จัดการห้อง', 'A szoba kezelése', 'Beheer kamer', 'curo volutpat', 'Kelola Ruang', 'Oda Yönet', 'Διαχείριση δωματίου', 'مدیریت اتاق', 'Urus Bilik', 'గదిని నిర్వహించండి', 'அறை நிர்வகி', 'રૂમ મેનેજ કરો', 'Zarządzaj pokojem', 'Управління кімнатою', 'ਕਮਰਾ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați camera', 'အခန်းကိုစီမံခန့်ခွဲ', 'Ṣakoso yara', 'Sarrafa dakin'),
(371, 'manage_hostel_member', 'Manage Hostel Member', 'ছাত্রাবাস  সদস্য পরিচালনা করুন', 'Manage Hostel Member', 'إدارة عضو في هوستيل', 'छात्रावास का सदस्य प्रबंधित करें', 'ہالینڈ کے رکن کا انتظام کریں', '管理旅馆会员', 'ホステルメンバーの管理', 'Manage Hostel Member', 'Управление хостелом', 'Gérer le membre dauberge', '호스텔 회원 관리', 'Hostel-Mitglied verwalten', 'Gestisci membro dellostello', 'จัดการสมาชิก Hostel', 'Kezelőtagok kezelése', 'Beheer Hostel Lid', 'Curo Member Hostel', 'Kelola anggota asrama', 'Yönetici Hostel Üyeliği', 'Διαχειριστείτε το μέλος του ξενώνα', 'مدیریت اشتراکی', 'Menguruskan Ahli Asrama', 'హాస్టల్ సభ్యునిని నిర్వహించండి', 'Hostel உறுப்பினர் நிர்வகி', 'છાત્રાલય સભ્યને મેનેજ કરો', 'Zarządzaj Hostelem', 'Керувати членом гуртом', 'ਹੋਸਟਲ ਮੈਂਬਰ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați un membru al căminului', 'ဘော်ဒါဆောင်အဖွဲ့ဝင်ကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn ọmọ ẹgbẹ ile-ogun', 'Sarrafa Dakunan kwanan dalibai Member'),
(372, 'manage_message', 'Manage Message', 'বার্তা পরিচালনা করুন', 'Administrar mensaje', 'إدارة الرسالة', 'संदेश प्रबंधित करें', 'پیغام کا نظم کریں', '管理消息', 'メッセージを管理する', 'Gerenciar Mensagem', 'Управление сообщением', 'Gérer le message', '메시지 관리', 'Nachricht verwalten', 'Gestisci il messaggio', 'จัดการข้อความ', 'Üzenet kezelése', 'Beheer bericht', 'curo Nuntius', 'Kelola pesan', 'İletiyi Yönet', 'Διαχείριση μηνυμάτων', 'مدیریت پیام', 'Uruskan Mesej', 'సందేశాన్ని నిర్వహించండి', 'செய்தியை நிர்வகிக்கவும்', 'સંદેશ મેનેજ કરો', 'Zarządzaj wiadomością', 'Управління повідомленням', 'ਸੁਨੇਹਾ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați mesajul', 'ကို Message များကိုစီမံကွပ်ကဲ', 'Ṣakoso Ifiranṣẹ', 'Sarrafa Saƙo'),
(373, 'manage_email', 'Manage Email', 'ইমেল পরিচালনা করুন', 'Administrar correo electrónico', 'إدارة البريد الإلكتروني', 'ईमेल प्रबंधित करें', 'ای میل کا انتظام کریں', '管理邮件', 'メールを管理する', 'Gerenciar Email', 'Управление электронной почтой', 'Gérer lemail', '이메일 관리', 'E-Mail verwalten', 'Gestisci email', 'จัดการอีเมล', 'E-mail kezelése', 'Beheer e-mail', 'curo Email', 'Kelola Email', 'E-postayı Yönet', 'Διαχείριση μηνυμάτων ηλεκτρονικού ταχυδρομείου', 'مدیریت ایمیل', 'Urus E-mel', 'ఇమెయిల్ను నిర్వహించండి', 'மின்னஞ்சல் நிர்வகி', 'ઇમેઇલ સંચાલિત કરો', 'Zarządzaj pocztą e-mail', 'Керувати електронною поштою', 'ਈਮੇਲ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați e-mailul', 'အီးမေးလ်ကိုစီမံခန့်ခွဲ', 'Ṣakoso Imeeli', 'Sarrafa Imel'),
(374, 'manage_sms', 'Manage SMS', 'এসএমএস পরিচালনা করুন', 'Administrar SMS', 'إدارة سمز', 'एसएमएस प्रबंधित करें', 'ایس ایم ایس کا نظم کریں', '管理短信', 'SMSの管理', 'Gerenciar SMS', 'Управление SMS', 'Gérer les SMS', 'SMS 관리', 'SMS verwalten', 'Gestisci SMS', 'จัดการ SMS', 'SMS kezelése', 'Beheer SMS', 'curo SMS', 'Kelola SMS', 'SMSi Yönet', 'Διαχείριση SMS', 'مدیریت اس ام اس', 'Uruskan SMS', 'SMS ను నిర్వహించండి', 'SMS ஐ நிர்வகி', 'એસએમએસ મેનેજ કરો', 'Zarządzaj SMS-em', 'Управління SMS', 'SMS ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați SMS-ul', 'SMS ကိုစီမံခန့်ခွဲရန်', 'Ṣakoso SMS', 'Sarrafa SMS'),
(375, 'manage_notice', 'Manage Notice', 'বিজ্ঞপ্তি পরিচালনা করুন', 'Administrar aviso', 'إدارة الإشعار', 'नोटिस प्रबंधित करें', 'نوٹس کا نظم کریں', '管理通知', '通知の管理', 'Gerenciar Aviso', 'Управление уведомлением', 'Gérer lavis', '공지 관리', 'Benachrichtigung verwalten', 'Gestisci avviso', 'จัดการประกาศ', 'Értesítés kezelése', 'Beheer Kennisgeving', 'curo Notitia', 'Mengelola Pemberitahuan', 'Bildirimi Yönet', 'Διαχειριστείτε την ειδοποίηση', 'مدیریت اطلاعیه', 'Urus Notis', 'నోటీసుని నిర్వహించండి', 'அறிவிப்பை நிர்வகி', 'નોટિસ મેનેજ કરો', 'Zarządzaj zawiadomieniem', 'Керувати повідомленням', 'ਨੋਟਿਸ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați notificarea', 'သတိပြုပါစီမံခန့်ခွဲရန်', 'Ṣakoso Akiyesi', 'Sarrafa sanarwa'),
(376, 'manage_news', 'Manage News', 'সংবাদ পরিচালনা করুন', 'Administrar noticias', 'إدارة الأخبار', 'समाचार प्रबंधित करें', 'خبریں انتظام کریں', '管理新闻', 'ニュースを管理する', 'Gerenciar Notícias', 'Управление новостями', 'Gérer les actualités', '뉴스 관리', 'Nachrichten verwalten', 'Gestisci notizie', 'จัดการข่าวสาร', 'Hírek kezelése', 'Beheer nieuws', 'curo News', 'Kelola Berita', 'Haberleri Yönet', 'Διαχείριση ειδήσεων', 'مدیریت اخبار', 'Urus Berita', 'వార్తలను నిర్వహించండి', 'செய்திகள் நிர்வகி', 'સમાચાર મેનેજ કરો', 'Zarządzaj wiadomościami', 'Керувати новинами', 'ਖ਼ਬਰਾਂ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați știrile', 'သတင်းကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Iroyin', 'Sarrafa labarai'),
(377, 'manage_holiday', 'Manage Holiday', 'ছুটি পরিচালনা করুন', 'Administrar vacaciones', 'إدارة عطلة', 'छुट्टी का प्रबंधन करें', 'چھٹیوں کا نظم کریں', '管理假期', '休日を管理する', 'Gerenciar férias', 'Управление отдыхом', 'Gérer les vacances', '휴일 관리', 'Feiertage verwalten', 'Gestisci le vacanze', 'จัดการวันหยุด', 'Nyaralás kezelése', 'Vakantie beheren', 'curo Holiday', 'Kelola Liburan', 'Tatili Yönet', 'Διαχείριση Διακοπών', 'مدیریت تعطیلات', 'Urus Percutian', 'హాలిడే నిర్వహించండి', 'விடுமுறை நிர்வகி', 'હોલિડે મેનેજ કરો', 'Zarządzaj wakacjami', 'Управління відпочинком', 'ਹਾਲੀਆ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați sărbătorile', 'အားလပ်ရက်များကိုစီမံကွပ်ကဲ', 'Ṣakoso Isinmi', 'Sarrafa hutu'),
(378, 'manage_event', 'Manage Event', 'ইভেন্ট পরিচালনা করুন', 'Administrar evento', 'إدارة الحدث', 'ईवेंट प्रबंधित करें', 'ایونٹ کا نظم کریں', '管理事件', 'イベントを管理する', 'Gerenciar Evento', 'Управление событием', 'Gérer lévénement', '이벤트 관리', 'Ereignis verwalten', 'Gestisci evento', 'จัดการกิจกรรม', 'Esemény kezelése', 'Beheer evenement', 'curo Vicis', 'Kelola Acara', 'Etkinliği Yönet', 'Διαχείριση του συμβάντος', 'مدیریت رویداد', 'Uruskan Acara', 'ఈవెంట్ను నిర్వహించండి', 'நிகழ்வு நிர்வகி', 'ઇવેન્ટ મેનેજ કરો', 'Zarządzaj wydarzeniem', 'Управління подією', 'ਇਵੈਂਟ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați evenimentul', 'Event ကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Ti oyan', 'Sarrafa Ayyukan'),
(379, 'manage_visitor', 'Manage Visitor', 'আগন্তুক তথ্য পরিচালনা করুন', 'Administrar visitante', 'إدارة الزائر', 'विज़िटर को प्रबंधित करें', 'وزیٹر کا نظم کریں', '管理访问者', '訪問者を管理する', 'Gerenciar visitantes', 'Управление посетителем', 'Gérer le visiteur', '방문자 관리', 'Besucher verwalten', 'Gestisci visitatore', 'จัดการผู้เข้าชม', 'A látogató kezelése', 'Beheer bezoeker', 'curo Visitor', 'Kelola Pengunjung', 'Ziyaretçiyi Yönet', 'Διαχείριση επισκεπτών', 'مدیریت بازدید کننده', 'Urus Pelawat', 'సందర్శకులని నిర్వహించండి', 'பார்வையாளர் நிர்வகி', 'મુલાકાતીને મેનેજ કરો', 'Zarządzaj odwiedzającym', 'Керувати відвідувачем', 'ਵਿਜ਼ਿਟਰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați vizitatorul', 'ဧည့်သည်ကိုစီမံခန့်ခွဲ', 'Ṣakoso Alejo', 'Sarrafa baƙo'),
(380, 'manage_fee_type', 'Manage Fee Type', 'ফি টাইপ পরিচালনা করুন', 'Administrar tipo de tarifa', 'إدارة نوع الرسوم', 'शुल्क प्रकार का प्रबंधन करें', 'فیس قسم کا انتظام کریں', '管理费用类型', '手数料タイプの管理', 'Gerenciar Tipo de Taxa', 'Управление платежом', 'Gérer le type de frais', '수수료 유형 관리', 'Gebührenart verwalten', 'Gestisci tipo di tariffa', 'จัดการประเภทค่าธรรมเนียม', 'Kezelési díj kezelése', 'Beheer Fee Type', 'Curo Save Type', 'Mengelola Jenis Biaya', 'Ücret Tipini Yönetin', 'Διαχείριση τύπου αμοιβής', 'مدیریت نوع هزینه', 'Urus Jenis Bayaran', 'ఫీజు రకం నిర్వహించండి', 'கட்டணம் வகை நிர்வகி', 'ફી પ્રકારનું સંચાલન કરો', 'Zarządzaj typem opłaty', 'Управління формами оплати', 'ਫੀਸ ਦੀ ਕਿਸਮ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați tipul de taxă', 'ကြေးအမျိုးအစားကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn iru owo sisan', 'Sarrafa Nauin Farashin'),
(381, 'manage_invoice', 'Manage Invoice', 'চালান পরিচালনা করুন', 'Administrar Factura', 'إدارة الفاتورة', 'चालान प्रबंधित करें', 'انوائس کا انتظام کریں', '管理发票', '請求書の管理', 'Gerenciar Fatura', 'Управление счетом', 'Gérer la facture', '송장 관리', 'Rechnung verwalten', 'Gestisci la fattura', 'จัดการใบแจ้งหนี้', 'Számla kezelése', 'Factuur beheren', 'curo cautionem', 'Kelola Faktur', 'Fatura Yönetimi', 'Διαχείριση τιμολογίου', 'مدیریت فاکتور', 'Urus Invois', 'వాయిస్ని నిర్వహించండి', 'விலைப்பட்டியல் நிர்வகி', 'ઇન્વૉઇસ મેનેજ કરો', 'Zarządzaj fakturą', 'Керувати рахунком-фактурою', 'ਚਲਾਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați factura', 'ငွေတောင်းခံလွှာကိုစီမံခန့်ခွဲ', 'Ṣakoso Iširo', 'Sarrafa daftari'),
(382, 'manage_due_invoice', 'Manage Due Invoice', 'বাকি চালান পরিচালনা করুন', 'Administrar la factura adeudada', 'إدارة الفاتورة المستحقة', 'नियत चालान प्रबंधित करें', 'ذمہ داری انوائس کا نظم کریں', '管理到期发票', '支払請求の管理', '`Gerenciar a Fatura devida', 'Управление счет-фактурой', 'Gérer la facture due', '송장 처리', 'Fällige Rechnung verwalten', 'Gestire la dovuta fattura', 'จัดการใบแจ้งหนี้ที่ครบกำหนด', 'Betöltési számla kezelése', 'Beheer de verschuldigde factuur', 'Ob cautionem Curo', 'Kelola Tagihan Karena', 'Ödenen Fatura Yönetimi', 'Διαχείριση του οφειλόμενου τιμολογίου', 'مدیریت حساب فوری', 'Urus Invois yang Dikehendaki', 'వాయిస్ వాయిస్ని నిర్వహించండి', 'காரணமாக விலைப்பட்டியல் நிர்வகி', 'કારણે ભરતિયું મેનેજ કરો', 'Zarządzaj niezobowiązującą fakturą', 'Керувати належним рахунком-фактурою', 'ਬਾਹਰੀ ਚਲਾਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați factura datorată', 'ကြောင့်ငွေတောင်းခံလွှာကိုစီမံခန့်ခွဲ', 'Ṣakoso Iširo Ibẹrẹ', 'Sarrafa Ƙari Bayarwa'),
(383, 'manage_expenditure_head', 'Manage Expenditure Head', 'ব্যয় হেড পরিচালনা করুন', 'Administrar Jefe de Gastos', 'إدارة النفقات رئيس', 'व्यय प्रमुख का प्रबंधन करें', 'اخراجات کا انتظام کریں', '管理支出主管', '支出頭を管理する', 'Gerenciar Cabeça de Despesas', 'Управление руководителем расходов', 'Gérer le chef des dépenses', '지출 헤드 관리', 'Ausgabenleiter verwalten', 'Gestisci il capo delle spese', 'จัดการหัวหน้าค่าใช้จ่าย', 'Kezelési költség kezelése', 'Beheer uitgavenhoofd', 'Curo capite sis crustum', 'Mengelola Kepala Biaya', 'Harcama Kafasını Yönet', 'Διαχείριση επικεφαλής δαπανών', 'مدیریت سر هزینه', 'Menguruskan Ketua Perbelanjaan', 'వ్యయ హెడ్ని నిర్వహించండి', 'செலவுத் தலைப்பை நிர்வகி', 'ખર્ચ હેડનું સંચાલન કરો', 'Zarządzaj głową wydatków', 'Управління витратами голови', 'ਖ਼ਰਚੇ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați șeful cheltuielilor', 'အသုံးစရိတ်ဌာနမှူးများကိုစီမံကွပ်ကဲ', 'Ṣakoso ori oṣuwọn', 'Sarrafa Shugaban Kuɗi'),
(384, 'manage_expenditure', 'Manage Expenditure', 'ব্যয় পরিচালনা করুন', 'Administrar el gasto', 'إدارة النفقات', 'व्यय प्रबंधित करें', 'اخراجات کا انتظام کریں', '管理支出', '支出の管理', 'Gerenciar Despesas', 'Управление расходами', 'Gérer les dépenses', '지출 관리', 'Ausgaben verwalten', 'Gestisci le spese', 'จัดการค่าใช้จ่าย', 'A kiadások kezelése', 'Uitgaven beheren', 'curo Custus', 'Mengelola Pengeluaran', 'Harcamaları Yönetin', 'Διαχείριση των δαπανών', 'مدیریت هزینه ها', 'Urus Perbelanjaan', 'వ్యయాలను నిర్వహించండి', 'செலவுகளை நிர்வகி', 'ખર્ચ મેનેજ કરો', 'Zarządzaj wydatkami', 'Управління витратами', 'ਖਰਚ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați cheltuielile', 'အသုံးစရိတ်စီမံခန့်ခွဲရန်', 'Ṣakoso owo sisan', 'Sarrafa Kuɗi'),
(385, 'manage_income_head', 'Manage Income Head', 'আয় হেড পরিচালনা করুন', 'Administrar cabeza de ingresos', 'إدارة رأس الدخل', 'आय हेड प्रबंधन करें', 'انکم سر کا انتظام کریں', '管理收入负责人', '所得管理をする', 'Gerencie o Chefe de Renda', 'Управление доходом', 'Gérer le revenu', '소득 헤드 관리', 'Einkommenskopf verwalten', 'Gestisci il reddito', 'จัดการหัวหน้ารายได้', 'A jövedelemfej kezelése', 'Beheer inkomstenstroom', 'Reditus in caput Curo', 'Mengelola Kepala Pendapatan', 'Gelir Kafasını Yönetin', 'Διαχείριση κεφαλής εισοδήματος', 'مدیریت درآمد سر', 'Urus Ketua Pendapatan', 'ఆదాయం హెడ్ని నిర్వహించండి', 'வருமானத் தலைப்பை நிர்வகி', 'ઇન્કમ હેડ મેનેજ કરો', 'Zarządzaj głową przychodów', 'Управління головою доходів', 'ਇਨਕਮ ਹੈਡ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați capul venitului', 'ဝင်ငွေခွန်ဌာနမှူးများကိုစီမံကွပ်ကဲ', 'Ṣakoso Ori-ori Owo Oya', 'Sarrafa Shugaban Asusun'),
(386, 'manage_income', 'Manage Income', 'আয় পরিচালনা করুন', 'Administrar ingresos', 'إدارة الدخل', 'आय प्रबंधित करें', 'آمدنی کا انتظام کریں', '管理收入', '収入を管理する', 'Gerar Renda', 'Управление доходом', 'Gérer le revenu', '소득 관리', 'Einkommen verwalten', 'Gestire il reddito', 'จัดการรายได้', 'Kezelje a jövedelmet', 'Beheer het inkomen', 'curo Reditus', 'Mengelola Penghasilan', 'Geliri Yönet', 'Διαχείριση εσόδων', 'مدیریت درآمد', 'Urus Pendapatan', 'ఆదాయాన్ని నిర్వహించండి', 'வருமானத்தை நிர்வகி', 'આવકનું સંચાલન કરો', 'Zarządzaj dochodem', 'Управління доходом', 'ਆਮਦਨੀ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați Venitul', 'ဝင်ငွေခွန်များကိုစီမံကွပ်ကဲ', 'Ṣakoso awọn Owo-ori', 'Sarrafa samun kudin shiga'),
(387, 'responsibility', 'Responsibility', 'দায়িত্ব', 'Responsabilidad', 'المسئولية', 'ज़िम्मेदारी', 'ذمہ داری', '责任', '責任', 'Responsabilidade', 'Обязанность', 'Responsabilité', '책임', 'Verantwortung', 'Responsabilità', 'ความรับผิดชอบ', 'Felelősség', 'Verantwoordelijkheid', 'responsibility', 'Tanggung jawab', 'sorumluluk', 'Ευθύνη', 'مسئوليت', 'Tanggungjawab', 'బాధ్యత', 'பொறுப்பு', 'જવાબદારી', 'Odpowiedzialność', 'Відповідальність', 'ਜ਼ਿੰਮੇਵਾਰੀ', 'Responsabilitate', 'တာဝန်', 'Ojúṣe', 'alhakin'),
(388, 'new', 'New', 'নতুন', 'Nuevo', 'الجديد', 'नया', 'نئی', '新', '新しい', 'Novo', 'новый', 'Nouveau', '새로운', 'Neu', 'Nuovo', 'ใหม่', 'Új', 'nieuwe', 'novus', 'Baru', 'Yeni', 'Νέος', 'جدید', 'Baru', 'న్యూ', 'புதிய', 'નવું', 'Nowy', 'Новий', 'ਨਵਾਂ', 'Nou', 'နယူး', 'Titun', 'sabon'),
(389, 'private_messaging', 'Private Messaging', 'ব্যক্তিগত বার্তা', 'Mensajería privada', 'الرسائل الخاصة', 'निजी मेसेजिंग', 'ذاتی پیغام رسانی', '私人消息', 'プライベートメッセージング', 'Mensagens privadas', 'Частные сообщения', 'Messagerie privée', '비공개 메시지', 'Private Nachrichten', 'Messaggistica privata', 'ข้อความส่วนตัว', 'Privát üzenetküldés', 'Privéberichten', 'Secretum Nuntius', 'Pesan Pribadi', 'Özel Mesajlaşma', 'Ιδιωτικά μηνύματα', 'پیام خصوصی', 'Mesej Persendirian', 'ప్రైవేట్ సందేశం', 'தனியார் செய்தி', 'ખાનગી મેસેજિંગ', 'Prywatne wiadomości', 'Приватні повідомлення', 'ਪ੍ਰਾਈਵੇਟ ਸੁਨੇਹਾ', 'Mesageria privată', 'ပုဂ္ဂလိက Messaging ကို', 'Fifiranṣẹ Aladani', 'Private Saƙo'),
(390, 'activate_now', 'Activate Now', 'সক্রিয় করুন', 'Activar ahora', 'نشط الآن', 'अब सक्रिय करें', 'ابھی چالو کریں', '立即激活', '今すぐアクティブにする', 'Ative agora', 'Активировать сейчас', 'Activer maintenant', '지금 실행 시켜라', 'Jetzt aktivieren', 'Attivare ora', 'เปิดใช้งานเดี๋ยวนี้', 'Aktiváld most', 'Activeer nu', 'Nunc strenuus', 'Sekarang aktif', 'Şimdi aktifleştir', 'Ενεργοποίηση τώρα', 'هم اکنون فعال کن', 'Aktifkan sekarang', 'ఇప్పుడు సక్రియం చేయండి', 'இப்போது செயல்படுத்தவும்', 'હમણાં સક્રિય કરો', 'Aktywuj teraz', 'Активувати зараз', 'ਹੁਣ ਸਰਗਰਮ ਕਰੋ', 'Activeaza acum', 'အခုတော့ကိုသက်ဝင်', 'Muu Nisisiyi ṣiṣẹ', 'Kunna Yanzu'),
(391, 'in_activate_now', 'Inactivate Now', 'নিষ্ক্রিয় করুন', 'Inactivate ahora', 'تعطيل الآن', 'अब निष्क्रिय करें', 'اب غیر فعال', '立即停用', '今すぐ非アクティブ化する', 'Inactive agora', 'Инактивировать сейчас', 'Désactiver maintenant', '지금 비활성화', 'Inaktivieren Sie jetzt', 'Inactivate Now', 'ยกเลิกการใช้งานเดี๋ยวนี้', 'Inaktiválás most', 'Inactiveren nu', 'Nunc inactivate', 'Nonaktifkan Sekarang', 'Şimdi devre dışı bırak', 'Απενεργοποιήστε τώρα', 'غیرفعال کن', 'Tidak aktif sekarang', 'ఇప్పుడే నిష్క్రియం చేయండి', 'இப்போது முடக்கு', 'હવે નિષ્ક્રિય કરો', 'Dezaktywuj teraz', 'Інактивувати зараз', 'ਹੁਣ ਅਯੋਗ ਕਰੋ', 'Dezactivați acum', 'အခုတော့ Inactivate', 'Inactivate Bayi', 'Ƙasashe Yanzu'),
(392, 'non_member', 'Non Member', 'সদস্য নয়', 'No es miembro', 'غير الأعضاء', 'गैर - सदस्य', 'غیر رکن', '非会员', '非会員', 'Não membro', 'Не участник', 'Non membre', '비 멤버', 'Nicht-Mitglied', 'Non membro', 'ไม่ใช่สมาชิก', 'Nem tag', 'Geen lid', 'non Member', 'Bukan anggota', 'Üye olmayan', 'Μη μέλος', 'غیرعضو', 'Bukan Ahli', 'సభ్యుడు కాదు', 'உறுப்பினர் இல்லை', 'બિન સભ્ય', 'bez członka', 'Не учасник', 'ਗੈਰ ਮੈਂਬਰ', 'Nu e membru', 'non အဖွဲ့ဝင်', 'Ko omo', 'Ba Memba'),
(393, 'sender', 'Sender', 'প্রেরক', 'Remitente', 'مرسل', 'प्रेषक', 'مرسل', '所有', '送信者', 'Remetente', 'отправитель', 'Expéditeur', '보내는 사람', 'Absender', 'Mittente', 'ผู้ส่ง', 'Feladó', 'Afzender', 'mittens', 'Pengirim', 'Gönderen', 'Αποστολέας', 'فرستنده', 'Pengirim', 'పంపినవారు', 'அனுப்புநர்', 'પ્રેષક', 'Nadawca', 'Відправник', 'ਭੇਜਣ ਵਾਲਾ', 'Expeditor', 'ပေးပို့သူ', 'Oluṣẹ', 'Mai aikawa'),
(394, 'all', 'All', 'সকল', 'Todas', 'الكل', 'सब', 'سب', '所有', 'すべて', 'Todos', 'Все', 'Tout', '모든', 'Alle', 'Tutti', 'ทั้งหมด', 'Minden', 'Alle', 'Omnis', 'Semua', 'Herşey', 'Ολα', 'همه', 'Semua', 'అన్ని', 'அனைத்து', 'બધા', 'Wszystko', 'Все', 'ਸਭ', 'Toate', 'အားလုံး', 'Gbogbo', 'Duk'),
(395, 'bank', 'Bank', 'ব্যাংক', 'Banco', 'بنك', 'बैंक', 'بینک', 'Bank', 'バンク', 'Banco', 'Банка', 'Banque', '은행', 'Bank', 'Banca', 'ธนาคาร', 'Bank', 'Bank', 'Bank', 'Bank', 'Banka', 'Τράπεζα', 'بانک', 'Bank', 'బ్యాంక్', 'வங்கி', 'બેન્ક', 'Bank', 'Банк', 'ਬੈਂਕ', 'bancă', 'ကမ်း', 'ifowo pamo', 'Bank'),
(396, 'first_name', 'First Name', 'নামের প্রথম অংশ', 'Nombre de pila', 'الاسم الاول', 'पहला नाम', 'پہلا نام', '名字', 'ファーストネーム', 'Primeiro nome', 'Имя', 'Prénom', '이름', 'Vorname', 'Nome di battesimo', 'ชื่อจริง', 'Keresztnév', 'Voornaam', 'Praenomen', 'Nama depan', 'İsim', 'Ονομα', 'نام کوچک', 'Nama pertama', 'మొదటి పేరు', 'முதல் பெயர்', 'પ્રથમ નામ', 'Imię', 'Імя', 'ਪਹਿਲਾ ਨਾਂ', 'Nume', 'နာမည်', 'Orukọ kini', 'Sunan rana'),
(397, 'expire', 'Expire', 'মেয়াদোত্তীর্ণ', 'Expirar', 'تنقضي', 'समय सीमा समाप्त', 'میعاد ختم', '到期', '失効', 'Expirar', 'истекать', 'Expirer', '내쉬다', 'Verfallen', 'scadere', 'หมดอายุ', 'Lejár', 'vervallen', 'exspirare', 'Berakhir', 'sona ermek', 'Εκπνέω', 'Expire', 'Tamat tempoh', 'గడువు', 'காலாவதி', 'સમાપ્તિ', 'Wygasać', 'Закінчується', 'ਮਿਆਦ ਖਤਮ', 'Expira', 'ထွက်သက်ရှူ', 'Ti pari', 'ya ƙare'),
(398, 'card', 'Card', 'কার্ড', 'Tarjeta', 'بطاقة', 'कार्ड', 'کارڈ', '卡', 'カード', 'Cartão', 'Карта', 'Carte', '카드', 'Karte', 'Carta', 'บัตร', 'Kártya', 'Kaart', 'Card', 'Kartu', 'kart', 'Κάρτα', 'کارت', 'Kad', 'కార్డ్', 'அட்டை', 'કાર્ડ', 'Karta', 'Карта', 'ਕਾਰਡ', 'Card', 'ကဒ်', 'Kaadi', 'Katin'),
(399, 'cvv', 'CVV', 'সিভিভি', 'CVV', 'CVV', 'सीवीवी', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'CVV', 'સીવીવી', 'CVV', 'CVV', 'ਸੀਵੀਵੀ', 'CVV', 'CVV', 'CVV', 'CVV'),
(400, 'year', 'Year', 'বছর', 'Año', 'عام', 'साल', 'سال', '年', '年', 'Ano', 'Год', 'An', '년', 'Jahr', 'Anno', 'ปี', 'Év', 'Jaar', 'annos singulos', 'Tahun', 'Yıl', 'Ετος', 'سال', 'Tahun', 'ఇయర్', 'ஆண்டு', 'વર્ષ', 'Rok', 'Рік', 'ਸਾਲ', 'An', 'ခုနှစ်', 'Odun', 'Shekara'),
(401, 'quick', 'Quick', 'সরাসরি', 'Rápido', 'بسرعة', 'शीघ्र', 'فوری', '快', 'クイック', 'Rápido', 'Быстро', 'Rapide', '빨리', 'Schnell', 'Presto', 'รวดเร็ว', 'Gyors', 'Snel', 'Velox', 'Cepat', 'Hızlı', 'Γρήγορα', 'سریع', 'Cepat', 'శీఘ్ర', 'விரைவு', 'ઝડપી', 'Szybki', 'Швидкий', 'ਤੇਜ਼', 'Rapid', 'လျင်မြန်သော', 'Awọn ọna', 'Da sauri'),
(402, 'daily', 'Daily', 'দৈনিক', 'Diario', 'اليومي', 'रोज', 'روزانہ', '日常', '毎日', 'Diariamente', 'Ежедневно', 'du quotidien', '매일', 'Täglich', 'Quotidiano', 'ประจำวัน', 'Napi', 'Dagelijks', 'Daily', 'Harian', 'Günlük', 'Καθημερινά', 'روزانه', 'Harian', 'డైలీ', 'டெய்லி', 'દૈનિક', 'Codziennie', 'Щодня', 'ਰੋਜ਼ਾਨਾ', 'Zilnic', 'နေ့စဉ်', 'Lojoojumọ', 'kowace rana'),
(403, 'monthly', 'Monthly', 'মাসিক', 'Mensual', 'شهريا', 'महीने के', 'ماہانہ', '每月一次', '毎月', 'Por mês', 'ежемесячно', 'Mensuel', '월간 간행물', 'Monatlich', 'Mensile', 'รายเดือน', 'Havi', 'Maandelijks', 'Vestibulum', 'Bulanan', 'Aylık', 'Μηνιαίος', 'ماهانه', 'Bulanan', 'మంత్లీ', 'மாதாந்திர', 'માસિક', 'Miesięczny', 'Щомісяця', 'ਮਹੀਨਾਵਾਰ', 'Lunar', 'လစဉ်', 'Oṣooṣu', 'Kwanan wata'),
(404, 'group_by_data', 'Group by Data', 'গ্রুপ বাই ডাটা', 'Agrupar por datos', 'المجموعة حسب البيانات', 'समूह द्वारा डेटा', 'ڈیٹا کی طرف سے گروپ', '按数据分组', 'データでグループ化する', 'Agrupar por Dados', 'Группа по данным', 'Grouper par données', '데이터로 그룹화', 'Nach Daten gruppieren', 'Raggruppa per dati', 'จัดกลุ่มตามข้อมูล', 'Csoport adatok szerint', 'Groeperen op gegevens', 'Ordina Data', 'Kelompokkan menurut Data', 'Veri Gruplama', 'Ομαδοποιήστε με Δεδομένα', 'گروه با داده ها', 'Kumpulan mengikut Data', 'డేటా ద్వారా సమూహం', 'தரவு மூலம் குழு', 'ડેટા દ્વારા ગ્રુપ', 'Grupuj według danych', 'Групувати за даними', 'ਡੈਟਾ ਦੁਆਰਾ ਸਮੂਹ', 'Grup după date', 'ဒေတာများသဖြင့် Group မှ', 'Agbegbe nipasẹ Data', 'Ƙungiya ta hanyar Data'),
(405, 'resign_date', 'Resign Date', 'পদত্যাগ তারিখ', 'Fecha de renuncia', 'استقالة التاريخ', 'इस्तीफा तारीख', 'استعفی کی تاریخ', '辞职日期', '辞職日', 'Data de rescisão', 'Дата списания', 'Date de démission', '사임 날짜', 'Datum zurückgeben', 'Data di dimettersi', 'ลาออกวันที่', 'Lemondás dátuma', 'Ontslagdatum', 'Date abdicare', 'Tanggal pengunduran diri', 'Ayrılış Tarihi', 'Ημερομηνία παραίτησης', 'تاریخ استعفا', 'Tarikh Mengundurkan', 'తేదీని రాజీనామా చేయండి', 'தேதி விலக்கு', 'રાજીનામું તારીખ', 'Data rezygnacji', 'Дата відставки', 'ਦਾਨ ਕਰਨ ਦੀ ਮਿਤੀ', 'Data renunțării', 'နေ့စွဲနုတ်ထွက်', 'Fi ọjọ silẹ', 'murabus Kwanan wata');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(406, 'invalid_login', 'Invalid Email OR password.', 'ভুল ইমেল বা পাসওয়ার্ড', 'Correo electrónico o contraseña inválidos', 'البريد الإلكتروني أو كلمة السر خاطئة.', 'अमान्य ईमेल या पासवर्ड।', 'غلط ای میل یا پاس ورڈ.', '无效的电子邮件或密码。', '無効なメールアドレスまたはパスワード。', 'Email ou senha inválida.', 'Неправильный адрес электронной почты или пароль.', 'Email ou mot de passe invalide.', '이메일 또는 비밀번호가 잘못되었습니다.', 'Ungültige E-Mail oder Passwort.', 'E-mail o password non validi.', 'อีเมลหรือรหัสผ่านไม่ถูกต้อง', 'Rossz email cím vagy jelszó.', 'Ongeldig e-mailadres of wachtwoord.', 'Aliquam-mailem scribeant vel tessera fuit.', 'Email atau kata sandi tidak valid', 'Geçersiz e-posta veya şifre.', 'Λάθος διεύθυνση ηλεκτρονικού ταχυδρομείου ή κωδικός πρόσβασης.', 'ایمیل یا کلمه عبور نامعتبر است', 'Email atau kata laluan tidak sah.', 'చెల్లని ఇమెయిల్ లేదా పాస్వర్డ్.', 'தவறான மின்னஞ்சல் அல்லது கடவுச்சொல்.', 'ઈ મેઈલ અથવા પાસવર્ડ ખોટો છે.', 'Nieprawidłowy e-mail lub hasło.', 'Невірна адреса електронної пошти або пароль.', 'ਗਲਤ ਈਮੇਲ ਜਾਂ ਪਾਸਵਰਡ.', 'E-mail nevalidă sau parola.', 'မှားနေသောအီးမေးလ်သို့မဟုတ်စကားဝှက်ကို။', 'Imeeli Invalid TABI ọrọigbaniwọle.', 'Imel mara inganci ko kalmar sirri.'),
(407, 'remember_me', 'Remember Me', 'আমাকে মনে রাখুন', 'Recuérdame', 'تذكرنى', 'मुझे याद रखना', 'مجھے پہچانتے ہو', '记住我', '私を覚えてますか', 'Lembre de mim', 'Запомни меня', 'Souviens-toi de moi', '날 기억해', 'Erinnere dich an mich', 'Ricordati di me', 'จดจำฉัน', 'Emlékezz rám', 'Onthoud me', 'memento mihi', 'Ingat saya', 'Beni hatırla', 'Θυμήσου με', 'مرا به خاطر بسپار', 'Ingat saya', 'నన్ను గుర్తు పెట్టుకో', 'என்னை நினைவில் கொள்ளுங்கள்', 'મને યાદ', 'Zapamiętaj mnie', 'Памятай мене', 'ਮੇਰੀ ਯਾਦ ਹੈ', 'Amintește-ți de mine', 'ငါ့ကိုသတိရပါ', 'Ranti mi', 'Ka tuna da ni'),
(408, 'lost_your_password', 'Lost your password?', 'আপনার পাসওয়ার্ড হারিয়েছেন?', '¿Perdiste tu contraseña?', 'فقدت كلمة المرور الخاصة بك؟', 'आपका पासवर्ड खो गया है?', 'اپنا پاس ورڈ بھول گئے؟', '忘记密码？', 'パスワードを忘れましたか？', 'Perdeu sua senha?', 'Забыли пароль?', 'Mot de passe perdu?', '비밀번호를 잊어 버렸습니까?', 'Passwort vergessen?', 'Hai perso la password?', 'ลืมรหัสผ่าน?', 'Elvesztetted a jelszavadat?', 'Wachtwoord vergeten?', 'Perdidit vestri password?', 'Kehilangan password?', 'Şifreni mi unuttun?', 'Έχασες τον κωδικό σου?', 'رمز عبور خود را فراموش کرده اید؟', 'Lupa kata kunci?', 'మీ పాస్వర్డ్ను కోల్పోయారా?', 'உங்கள் கடவுச்சொல்லை இழந்தீர்களா?', 'તમારો પાસવર્ડ ખોવાઈ ગયો?', 'Zgubiłeś hasło?', 'Забули свій пароль?', 'ਤੁਹਾਡਾ ਪਾਸਵਰਡ ਭੁੱਲ ਗਏ ਹੋ?', 'Ti-ai pierdut parola?', 'သင့်ရဲ့စကားဝှက်ကိုဆုံးရှုံးခဲ့ရ?', 'Ti padanu ọrọ igbaniwọle rẹ?', 'Ka manta kalmarka ta sirri?'),
(409, 'back_to_login', 'Back to Login', 'ব্যাক টু লগইন', 'Atrás para iniciar sesión', 'العودة إلى تسجيل الدخول', 'लॉगिन पर वापस जाएं', 'لاگ ان پر واپس', '回到登入', 'ログインに戻る', 'Volte ao login', 'Вернуться на страницу входа', 'Retour connexion', '로그인으로 돌아 가기', 'Zurück zur Anmeldung', 'Torna al login', 'กลับไปที่ล็อกอิน', 'Vissza a bejelentkezéshez', 'Terug naar Inloggen', 'Back to Login', 'Kembali untuk masuk', 'Giriş sayfasına dön', 'Επιστροφή στην σελίδα εισόδου', 'بازگشت به صفحه ورود', 'Kembali ke Log masuk', 'తిరిగి లాగిన్ అవ్వండి', 'மீண்டும் உள்நுழையவும்', 'લૉગિન પર પાછા જાઓ', 'Powrót do logowania', 'Повернутися до Login', 'ਲੌਗਿਨ ਤੇ ਵਾਪਸ', 'Înapoi la autentificare', 'နောက်ကျောဝင်မည်မှ', 'Pada si Wiwọle', 'Komawa zuwa shiga'),
(410, 'instruction', 'Instruction', 'নির্দেশাবলী', 'Instrucción', 'تعليمات', 'अनुदेश', 'ہدایات', '指令', '命令', 'Instrução', 'инструкция', 'Instruction', '교수', 'Anweisung', 'istruzione', 'คำแนะนำ', 'Utasítás', 'Instructie', 'Disciplinam', 'Petunjuk', 'Talimat', 'Εντολή', 'دستورالعمل', 'Arahan', 'ఇన్స్ట్రక్షన్', 'வழிமுறை', 'સૂચના', 'Instrukcja', 'Інструкція', 'ਨਿਰਦੇਸ਼', 'instrucție', 'ညွှန်ကြားချက်', 'Ilana', 'Umarni'),
(411, 'manage_user_instruction', 'Please add Teacher, Employee, Student and Guardian before manage users.', 'ব্যবহারকারীদের পরিচালনা করার আগে শিক্ষক, কর্মচারী, ছাত্র এবং অভিভাবক যোগ করুন।', 'Agregue Maestro, Empleado, Estudiante y Tutor antes de administrar usuarios.', 'يرجى إضافة المعلم والموظف والطالب والجارديان قبل إدارة المستخدمين.', 'उपयोगकर्ताओं को प्रबंधित करने से पहले कृपया शिक्षक, कर्मचारी, छात्र और संरक्षक जोड़ें।', 'براہ کرم صارفین کو منظم کرنے سے قبل استاد، ملازم، طالب علم اور گارڈین شامل کریں.', '在管理用户之前，请添加教师，员工，学生和监护人。', 'ユーザーを管理する前に教師、従業員、学生、保護者を追加してください。', 'Por favor, adicione Professor, Empregado, Estudante e Guardião antes de administrar usuários.', 'Перед тем, как управлять пользователями, добавьте Учителя, Работника, Студента и Хранителя.', 'Veuillez ajouter un enseignant, un employé', '사용자를 관리하기 전에 교사, 직원, 학생 및 보호자를 추가하십시오.', 'Bitte fügen Sie Teacher, Employee, Student und Guardian hinzu, bevor Sie Benutzer verwalten.', 'Prima di gestire gli utenti, aggiungi Insegnante, Dipendente, Studente e Guardiano.', 'โปรดเพิ่ม Teacher, Employee, Student และ Guardian ก่อนที่จะจัดการผู้ใช้', 'Kérjük, add hozzá tanár, alkalmazott, tanuló és gondnok, mielőtt kezelné a felhasználókat.', 'Voeg docent, medewerker, student en bewaker toe voordat u gebruikers beheert.', 'Placere addere: Magister bone, Aliquam, antequam student et episcopum administrare users.', 'Tolong tambahkan Guru, Karyawan, Pelajar dan Wali sebelum mengelola pengguna.', 'Kullanıcıları yönetmeden önce lütfen Öğretmen, Çalışan, Öğrenci ve Koruyucuyu ekleyin.', 'Προσθέστε δάσκαλο, υπάλληλο, φοιτητή και φύλακα πριν διαχειριστείτε τους χρήστες.', 'قبل از مدیریت کاربران، لطفا معلم، کارمند، دانشجو و نگهبان را اضافه کنید.', 'Sila tambah Guru, Pekerja, Pelajar dan Penjaga sebelum mengurus pengguna.', 'దయచేసి వినియోగదారులను నిర్వహించడానికి ముందు Teacher, ఉద్యోగి, స్టూడెంట్ మరియు గార్డియన్లను జోడించండి.', 'பயனர்களை நிர்வகிக்க முன் ஆசிரியர், பணியாளர், மாணவர் மற்றும் கார்டியன் ஆகியோரைச் சேர்க்கவும்.', 'વપરાશકર્તાઓ મેનેજ કરો તે પહેલાં શિક્ષક, કર્મચારી, વિદ્યાર્થી અને વાલીઓ ઉમેરો.', 'Przed zarządzaniem użytkownikami dodaj Nauczyciela, Pracownika, Studenta i Opiekuna.', 'До того, як керувати користувачами, додайте ', 'ਉਪਭੋਗਤਾਵਾਂ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਅਧਿਆਪਕ, ਕਰਮਚਾਰੀ, ਵਿਦਿਆਰਥੀ ਅਤੇ ਗਾਰਡੀਅਨ ਜੋੜੋ', 'Adăugați profesor, angajat, student și gardian înainte de a administra utilizatorii.', 'အရှင်ဘုရား, ထမ်း, ကျောင်းသားနှင့်ဂါးဒီးယန်းမတိုင်မီအသုံးပြုသူများကိုစီမံခန့်ခွဲ add ပေးပါ။', 'Jọwọ fi Olukọ, Olukọni, Akeko ati Olutọju ṣaju Ṣakoso awọn olumulo.', 'Da fatan a ƙara malami, maaikaci, dalibi da kuma tsare kafin gudanar da masu amfani.'),
(413, 'add_employee_instruction', 'Please add Designation before add Employee.', 'কর্মচারী যোগ করার আগে অনুগ্রহপূর্বক পদবী যোগ করুন', 'Agregue Designación antes de agregar Empleado.', 'يرجى إضافة تعيين قبل إضافة موظف.', 'कृपया कर्मचारी जोड़ें जोड़ने से पहले पदनाम जोड़ें।', 'ملازمت کو شامل کرنے سے قبل عہدہ شامل کریں.', '请在添加员工之前添加指定。', '従業員を追加する前に指定を追加してください。', 'Por favor, adicione Designação antes de adicionar Empregado.', 'Пожалуйста, добавьте Обозначение, прежде чем добавить Сотрудника.', 'Veuillez ajouter la désignation avant dajouter un employé.', 'Employee를 추가하기 전에 지정을 추가하십시오.', 'Bitte fügen Sie die Bezeichnung hinzu, bevor Sie Mitarbeiter hinzufügen.', 'Aggiungi la designazione prima di aggiungere un dipendente.', 'โปรดเพิ่มการกำหนดก่อนเพิ่ม Employee', 'Kérjük, add hozzá a jelölést, mielőtt hozzáadja a Munkavállalót.', 'Voeg een aanwijzing toe voordat u werknemer toevoegt.', 'Aliquam VOCABULUM addere placet in conspectu add.', 'Harap tambahkan Penunjukan sebelum menambahkan Karyawan.', 'Lütfen Çalışan eklemeden önce Adlandırma ekleyin.', 'Προσθέστε Προσδιορισμός πριν προσθέσετε Υπάλληλο.', 'قبل از افزودن کارمند لطفا نامگذاری را اضافه کنید.', 'Sila tambah Jawatan sebelum menambah Pekerja.', 'ఉద్యోగిని చేర్చడానికి ముందు హోదాను జత చేయండి.', 'பணியாளரை சேர்க்க முன் நியமனத்தைச் சேர்க்கவும்.', 'એમ્પ્લોયી ઉમેરો પહેલાં કૃપા કરીને હોદ્દો ઉમેરો.', 'Dodaj Oznaczenie przed dodaniem pracownika.', 'Будь ласка, додайте позначення, перш ніж додати співробітника.', 'ਕਰਮਚਾਰੀ ਨੂੰ ਸ਼ਾਮਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਕਿਰਪਾ ਕਰਕੇ ਪ੍ਰਸ਼ੰਸਾ ਸ਼ਾਮਲ ਕਰੋ', 'Adăugați o denumire înainte de a adăuga un angajat.', 'သတ်မှတ်ပေးထားခြင်းမတိုင်မီန်ထမ်းပေါင်းထည့်ပေါင်းထည့်ပေးပါ။', 'Jowo fi Ami silẹ ṣaaju ki o to fi Abáni ṣiṣẹ.', 'Da fatan a kara Zabin kafin ƙara maaikaci.'),
(414, 'add_class_instruction', 'Please add Teacher before add Class.', 'ক্লাস যোগ করার আগে শিক্ষক যোগ করুন', 'Por favor agregue Maestro antes de agregar Clase.', 'الرجاء إضافة معلم قبل إضافة الفصل الدراسي.', 'कृपया कक्षा जोड़ें से पहले शिक्षक जोड़ें।', 'کلاس شامل کرنے سے قبل ٹیچر شامل کریں.', '请在添加课程之前添加教师', 'クラスを追加する前に教師を追加してください。', 'Adicione o professor antes de adicionar a classe.', 'Пожалуйста, добавьте Учителя перед добавлением класса.', 'Veuillez ajouter un enseignant avant dajouter une classe.', '수업을 추가하기 전에 선생님을 추가하십시오.', 'Bitte fügen Sie den Lehrer hinzu, bevor Sie die Klasse hinzufügen.', 'Aggiungi linsegnante prima di aggiungere la lezione.', 'โปรดเพิ่มครูก่อนเพิ่มระดับ', 'Add hozzá a Tanárt, mielőtt hozzáadná az osztályt.', 'Voeg docent toe voordat u lesgroep toevoegt.', 'Magister add addere placet in conspectu Ps.', 'Tolong tambahkan Guru sebelum menambahkan Kelas.', 'Sınıfı eklemeden önce lütfen Öğretmen ekleyin.', 'Παρακαλούμε προσθέστε Δάσκαλο πριν προσθέσετε την κατηγορία.', 'قبل از افزودن کلاس، لطفا معلم را اضافه کنید.', 'Sila tambahkan Guru sebelum menambah Kelas.', 'క్లాస్ ను జోడించుటకు ముందుగా టీచర్ని చేర్చుము.', 'வர்க்கம் சேர்க்க முன் ஆசிரியர் சேர்க்க.', 'ઍડ ક્લાસ પહેલાં શિક્ષક ઉમેરો.', 'Dodaj Nauczyciela przed dodaniem klasy.', 'Будь ласка, додайте Учителя перед додаванням Класу.', 'ਕਿਰਪਾ ਕਰਕੇ ਐਡ ਕਲਾਸ ਤੋਂ ਪਹਿਲਾਂ ਅਧਿਆਪਕ ਸ਼ਾਮਲ ਕਰੋ.', 'Adăugați profesor înainte de a adăuga Clasa.', 'Class ကို add မတိုင်မီဆရာ add ပေးပါ။', 'Jọwọ fi Olukọ ṣaaju ki o to fi Kilasi sii.', 'Da fatan a kara Malam kafin ƙara Class.'),
(427, 'add_section_instruction', 'Please add Teacher & Class before add Section.', 'বিভাগ যোগ করার আগে শিক্ষক ও শ্রেণী যোগ করুন', 'Por favor agregue Maestro y Clase antes de agregar la Sección.', 'يرجى إضافة معلم وفئة قبل إضافة قسم.', 'अनुभाग जोड़ने से पहले शिक्षक और कक्षा जोड़ें', 'سیکشن میں شامل کرنے سے قبل ٹیچر اور کلاس شامل کریں.', '在添加部分之前，请添加教师和班级。', 'セクションを追加する前に教師とクラスを追加してください。', 'Por favor, adicione professor e classe antes de adicionar seção.', 'Пожалуйста, добавьте Teacher & Class перед добавлением раздела.', 'Veuillez ajouter lenseignant et la classe avant dajouter la section.', '섹션을 추가하기 전에 교사와 수업을 추가하십시오.', 'Bitte fügen Sie Lehrer und Klasse hinzu, bevor Sie Abschnitt hinzufügen.', 'Aggiungi insegnante e classe prima di aggiungere la sezione.', 'โปรดเพิ่ม Teacher & Class ก่อนเพิ่มส่วน', 'Add add Teacher & Class hozzáadása előtt szekció.', 'Voeg docent en klas toe voordat u sectie toevoegt.', 'Genus: Magister add & sectionem addere velit ante.', 'Tolong tambahkan Guru & Kelas sebelum menambahkan Bagian.', 'Bölüm eklemeden önce lütfen Öğretmen ve Sınıf ekleyin.', 'Παρακαλούμε προσθέστε το δάσκαλο και την τάξη πριν προσθέσετε ενότητα.', 'لطفا قبل از افزودن بخش معلم و کلاس اضافه کنید', 'Sila tambah Guru & Kelas sebelum menambah Seksyen.', 'దయచేసి విభాగాన్ని జోడించే ముందు Teacher & Class జోడించండి.', 'பிரிவு சேர்வதற்கு முன்னர் ஆசிரியர் மற்றும் வகுப்பைச் சேர்க்கவும்.', 'વિભાગ ઉમેરો પહેલાં શિક્ષક અને વર્ગ ઉમેરો.', 'Dodaj nauczyciela i zajęcia, zanim dodasz sekcję.', 'Додайте розділ ', 'ਕਿਰਪਾ ਕਰਕੇ ਸੈਕਸ਼ਨ ਜੋੜਨ ਤੋਂ ਪਹਿਲਾਂ ਅਧਿਆਪਕ ਅਤੇ ਕਲਾਸ ਸ਼ਾਮਲ ਕਰੋ.', 'Vă rugăm să adăugați un profesor și o clasă înainte de a adăuga secțiunea.', 'add ပုဒ်မမတိုင်မီအရှင်ဘုရား & Class ကို add ပေးပါ။', 'Jọwọ fi Olukọ ati Kilasi ṣaaju ki o to fi Abala kan kun.', 'Da fatan a ƙara Malami da Class kafin ƙara Sashe.'),
(428, 'class_add_alert', 'Please add Class', 'ক্লাস যোগ করুন', 'Por favor agrega Clase', 'يرجى إضافة فئة', 'कृपया कक्षा जोड़ें', 'براہ مہربانی کلاس شامل کریں', '请添加Class', 'クラスを追加してください', 'Por favor, adicione Classe', 'Пожалуйста, добавьте класс', 'Veuillez ajouter une classe', '수업을 추가하십시오.', 'Bitte fügen Sie Klasse hinzu', 'Per favore aggiungi Class', 'โปรดเพิ่ม Class', 'Add osztály', 'Voeg alstublieft Klasse toe', 'Placere addere Paleonemertea Class', 'Tolong tambahkan Kelas', 'Lütfen Sınıf ekle', 'Προσθέστε την κλάση', 'لطفا کلاس را اضافه کنید', 'Sila tambah Kelas', 'దయచేసి క్లాస్ను జోడించు', 'வகுப்பு சேர்க்கவும்', 'કૃપા કરીને વર્ગ ઉમેરો', 'Dodaj klasę', 'Будь ласка, додайте клас', 'ਕਲਾਸ ਸ਼ਾਮਿਲ ਕਰੋ ਜੀ', 'Adăugați Clasa', 'Class ကို add ပေးပါ', 'Jọwọ fi Kilasi sii', 'Da fatan a kara Class'),
(429, 'add_student_instruction', 'Please add Guardian, Class & Section before add Student.', 'ছাত্র যোগ করার আগে অভিভাবক, ক্লাস এবং বিভাগ যোগ করুন', 'Agregue Guardián, Clase y Sección antes de agregar Estudiante.', 'يرجى إضافة الجارديان، فئة وقسم قبل إضافة طالب.', 'कृपया छात्र जोड़ने से पहले अभिभावक, कक्षा और अनुभाग जोड़ें।', 'برائے مہربانی طالب علم کو شامل کرنے سے پہلے گارڈین، کلاس اور سیکشن شامل کریں.', '添加学生前请添加监护人，课程和科室。', '生徒を追加する前にGuardian、Class＆Sectionを追加してください。', 'Por favor, adicione Guardian, Class & Section antes de adicionar Student.', 'Пожалуйста, добавьте Guardian, Class & Section перед добавлением Студента.', 'Veuillez ajouter Guardian, Class & Section avant dajouter Student.', '학생을 추가하기 전에 Guardian, Class & Section을 추가하십시오.', 'Bitte fügen Sie Guardian, Class & Section hinzu, bevor Sie Student hinzufügen.', 'Aggiungi Guardian, Class & Section prima di aggiungere Student.', 'กรุณาเพิ่ม Guardian, Class & Section ก่อนเพิ่ม Student', 'Add hozzá Guardian, Class & Section hozzáadása előtt Add Student.', 'Voeg Guardian, Class & Section toe voordat je Student toevoegt.', 'Adde sis custos, adde prius Discipulus Class sect.', 'Tolong tambahkan Guardian, Class & Section sebelum menambahkan Student.', 'Öğrenci eklemeden önce lütfen Guardian, Class & Sectionu ekleyin.', 'Παρακαλούμε προσθέστε Guardian, Class & Section πριν προσθέσετε Student.', 'قبل از افزودن دانش آموز، لطفا Guardian، Class & Section را اضافه کنید.', 'Sila tambah Guardian, Kelas & Seksyen sebelum menambah Pelajar.', 'దయచేసి విద్యార్థిని జోడించే ముందు గార్డియన్, క్లాస్ & సెక్షన్ని జోడించండి.', 'மாணவர் சேர்க்கும் முன்பு கார்டியன், வகுப்பு & பகுதி சேர்க்கவும்.', 'ઉમેરો વિદ્યાર્થી પહેલાં ગાર્ડિયન, વર્ગ અને વિભાગ ઉમેરો.', 'Przed dodaniem ucznia dodaj opiekuna, klasę i sekcję.', 'Перш ніж додати Студент, додайте Guardian, Class & Section.', 'ਕਿਰਪਾ ਕਰਕੇ ਵਿਦਿਆਰਥੀ ਸ਼ਾਮਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਗਾਰਡੀਅਨ, ਕਲਾਸ ਅਤੇ ਸੈਕਸ਼ਨ ਸ਼ਾਮਿਲ ਕਰੋ.', 'Vă rugăm să adăugați Guardian, Class & Section înainte de a adăuga Student.', 'ဂါးဒီးယန်း, အတန်းအစား & ပုဒ်မမတိုင်မီကျောင်းသား add add ပေးပါ။', 'Jowo fi Olutọju, Kilasi & Abala šaaju ki o to fi ọmọ-iwe kun.', 'Da fatan a kara Guardian, Class & Sashe kafin ƙara Student.'),
(430, 'add_assignment_instruction', 'Please add Class & Subject before add Assignment.', 'যোগদান যোগ করার আগে ক্লাস এবং বিষয় যোগ করুন', 'Agregue Clase y Asunto antes de agregar Asignación.', 'الرجاء إضافة الفئة والموضوع قبل إضافة التعيين.', 'कृपया असाइनमेंट जोड़ने से पहले कक्षा और विषय जोड़ें।', 'تفویض شامل کرنے سے پہلے کلاس اور مضمون شامل کریں.', '请在添加作业之前添加课程和主题。', '割り当てを追加する前にクラスと件名を追加してください。', 'Por favor, adicione Class & Subject antes de adicionar Atribuição.', 'Пожалуйста, добавьте Class & Subject перед добавлением Assignment.', 'Veuillez ajouter la classe et le sujet avant dajouter une affectation.', '과제를 추가하기 전에 수업 및 과제를 추가하십시오.', 'Bitte fügen Sie Klasse und Betreff hinzu, bevor Sie die Zuweisung hinzufügen.', 'Per favore aggiungi Class & Subject prima di aggiungere Assignment.', 'โปรดเพิ่ม Class & Subject ก่อนที่จะเพิ่ม Assignment', 'Add hozzá az Osztályt és a témát, mielőtt hozzárendelheti.', 'Voeg Klasse en Onderwerp toe voordat u Toewijzing toevoegt.', 'Class placet, adde prius adsignatione add.', 'Harap tambahkan Kelas & Subjek sebelum menambahkan Penugasan.', 'Ödev eklemek için lütfen Sınıf ve Konuyu ekleyin.', 'Προσθέστε την κλάση και το θέμα πριν προσθέσετε την επιλογή Αντιστοίχιση.', 'لطفا کلاس و موضوع را قبل از اضافه شدن اضافه کنید.', 'Sila tambah Kelas & Subjek sebelum menambah Tugasan.', 'దయచేసి అసైన్మెంట్ను జోడించే ముందు క్లాస్ & సబ్జెక్ట్ జోడించండి.', 'ஒதுக்கீட்டைச் சேர்க்கும் முன்பு வகுப்பு & தலைப்பு சேர்க்கவும்.', 'મહેરબાની કરીને ઉમેરતા પહેલા સભા અને વિષય ઉમેરો.', 'Przed dodaniem zadania dodaj klasę i temat.', 'Будь ласка, додайте клас і тему, перш ніж додати асигнування.', 'ਕਿਰਪਾ ਕਰਕੇ ਅਸਾਈਨਮੈਂਟ ਤੋਂ ਪਹਿਲਾਂ ਕਲਾਸ ਅਤੇ ਵਿਸ਼ਾ ਜੋੜੋ.', 'Adăugați Clasă și Subiect înainte de a adăuga Atribuire.', 'add တာဝန်မတိုင်မီအတန်းအစား & အကြောင်းအရာ add ပေးပါ။', 'Jọwọ fi Kilasi & Koko ṣaaju ki o to fi iṣẹ-ṣiṣe kun.', 'Da fatan a kara Class & Rubutun kafin ƙara Matsayi.'),
(431, 'add_exam_schedule_instruction', 'Please add Exam, Class & Subject before add Exm Schedule.', 'পরীক্ষার সময়সূচী যোগ করার আগে পরীক্ষা, শ্রেণী ও বস্তু যুক্ত করুন।', 'Agregue Examen, Clase y Objeto antes de agregar el Horario del Examen.', 'الرجاء إضافة امتحان، فئة & كائن قبل إضافة جدول الامتحان.', 'परीक्षा परीक्षा अनुसूची जोड़ें से पहले परीक्षा, कक्षा और वस्तु जोड़ें', 'امتحان شیڈول میں شامل کرنے سے پہلے، امتحان، کلاس اور آبجیکٹ شامل کریں.', '在添加考试时间表之前，请添加考试，课程和对象。', 'Exam Scheduleを追加する前に、Exam、Class＆Objectを追加してください。', 'Por favor, adicione o Exame, Classe e Objeto antes de adicionar o Programa de Exames.', 'Пожалуйста, добавьте Экзамен, Класс и Объект, прежде чем добавить График экзамена.', 'Veuillez ajouter lexamen, la classe et lobjet avant dajouter lhoraire dexamen.', 'Exam Schedule을 추가하기 전에 Exam, Class & Object를 추가하십시오.', 'Bitte fügen Sie Prüfung, Klasse und Objekt hinzu, bevor Sie den Prüfungsplan hinzufügen.', 'Aggiungi esame, classe e oggetto prima di aggiungere la pianificazione degli esami.', 'โปรดเพิ่มการสอบวิชา & วัตถุก่อนเพิ่มตารางการสอบ', 'Add Exam, Class & Object hozzáadása az Exam Schedule hozzáadásához.', 'Voeg Examen, Klasse & Object toe voordat u het Exam Schedule toevoegt.', 'Placere addere IV, addere IV Class Object coram arcu.', 'Harap tambahkan Ujian, Kelas & Objek sebelum menambahkan Jadwal Ujian.', 'Sınav Takvimi eklemeden önce lütfen Sınav, Sınıf ve Nesneyi ekleyin.', 'Παρακαλούμε προσθέστε Εξετάσεις, Τάξη & Αντικείμενο πριν προσθέσετε το Πρόγραμμα Εξετάσεων.', 'قبل از افزودن برنامه آزمون، لطفا امتحان، کلاس و شیء را اضافه کنید.', 'Sila tambah Peperiksaan, Kelas & Objek sebelum menambah Jadual Peperiksaan.', 'పరీక్షా షెడ్యూల్ను జోడించే ముందు పరీక్ష, క్లాస్ & ఆబ్జెక్ట్ చేర్చండి.', 'தேர்வு அட்டவணை சேர்க்க முன் முன், வகுப்பு & பொருள் சேர்க்க தயவு செய்து.', 'પરીક્ષા શેડ્યૂલ ઉમેરો પહેલાં પરીક્ષાની, વર્ગ અને ઑબ્જેક્ટ ઉમેરો', 'Dodaj egzamin, klasę i obiekt przed dodaniem harmonogramu egzaminu.', 'Додайте іспит, клас і обєкт перед додаванням графіка іспиту.', 'ਕਿਰਪਾ ਕਰਕੇ ਪ੍ਰੀਖਿਆ ਸ਼ਡਿਊਲ ਸ਼ਾਮਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਪ੍ਰੀਖਿਆ, ਕਲਾਸ ਅਤੇ ਔਬਜੈਕਟ ਸ਼ਾਮਲ ਕਰੋ.', 'Adăugați examen, clasă și obiect înainte de a adăuga programul de examinare.', 'အတန်းအစား & အရာဝတ္ထုမတိုင်မီစာမေးပွဲအချိန်ဇယားကိုထည့်သွင်း, စာမေးပွဲ add ပေးပါ။', 'Jọwọ fi kẹhìn, Kilasi & Ohun ṣaaju ki o to ṣayẹwo Akẹkọ Idaduro.', 'Da fatan a kara gwadawa, Class & Object kafin ƙara Nazarin Jarrabawa.'),
(432, 'add_exam_suggestion_instruction', 'Please add Exam, Class & Subject before add Exam Suggestion.', 'পরীক্ষা পরামর্শ যোগ করার আগে পরীক্ষা, শ্রেণী এবং বিষয় যুক্ত করুন।', 'Agregue Examen, Clase y Asunto antes de agregar Exm Sugerencia.', 'يرجى إضافة امتحان، فئة & الموضوع قبل إضافة اقتراح إكسم.', 'Exm सुझाव जोड़ने से पहले परीक्षा, कक्षा और विषय जोड़ें।', 'اے ایم ایم تجاویز کو شامل کرنے سے قبل امتحان، کلاس اور مضمون شامل کریں.', '在添加Exm建议之前，请添加考试，课程和主题。', 'Exm提案を追加する前に、Exam、Class＆Subjectを追加してください。', 'Por favor, adicione Exame, Classe e Assunto antes de adicionar Exm Sugestão.', 'Пожалуйста, добавьте Экзамен, Класс и Тема, прежде чем добавить предложение Exm.', 'Sil vous plaît ajouter lexamen, la classe et le sujet avant dajouter la suggestion dExm.', 'Exm 제안을 추가하기 전에 Exam, Class & Subject를 추가하십시오.', 'Bitte fügen Sie Exam, Class & Subject hinzu, bevor Sie Exm Suggestion hinzufügen.', 'Aggiungi Exam, Class e Subject prima di aggiungere Exm Suggestion.', 'โปรดเพิ่มการสอบวิชา & หัวเรื่องก่อนเพิ่มคำแนะนำ Exm', 'Add Exam, Class & Subject hozzáadása az Exm Suggestion hozzáadásához', 'Voeg examen, klasse en onderwerp toe voordat u Exm-suggestie toevoegt.', 'IV addere placet, adde prius Class Exm Suggestion.', 'Harap tambahkan Ujian, Kelas & Subjek sebelum menambahkan Saran Muka.', 'Exm Öneri eklemeden önce lütfen Sınav, Sınıf ve Konuyu ekleyin.', 'Παρακαλούμε προσθέστε την εξέταση, την κλάση και το θέμα πριν προσθέσετε την πρόταση Exm.', 'لطفا قبل از افزودن پیشنهاد Exm، امتحان، کلاس و موضوع را اضافه کنید.', 'Sila tambah Peperiksaan, Kelas & Subjek sebelum menambah Cadangan Exm.', 'దయచేసి Exm సూచనను జోడించే ముందు పరీక్ష, క్లాస్ & విషయం జోడించండి.', 'Exm பரிந்துரைகளை சேர்க்கும் முன் தேர், வகுப்பு & தலைப்பு சேர்க்கவும்.', 'Exm સૂચન ઉમેરતા પહેલાં પરીક્ષા, વર્ગ અને વિષય ઉમેરો.', 'Dodaj Exam, Class & Subject, zanim dodasz Exm Suggestion.', 'Додайте Exm Suggestion, додайте іспит, клас і тему.', 'ਐਕਸਮ ਸੁਝਾਅ ਸ਼ਾਮਲ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਐਗਜ਼ੁਖ, ਕਲਾਸ ਅਤੇ ਵਿਸ਼ਾ ਜੋੜੋ.', 'Vă rugăm să adăugați Exam, Class & Subject înainte de a adăuga Sugestie Exm.', 'အတန်းအစား & အကြောင်းအရာမတိုင်မီ Exm အကြံပြုချက်ထပ်ထည့်, စာမေးပွဲ add ပေးပါ။', 'Jọwọ fi kẹhìn, Kilasi & Koko ṣaaju ki o to fi Alaye pataki sii.', 'Da fatan a sake gwada jarrabawa, Class & Subject kafin ƙara Exm Shawarwari.'),
(433, 'login_success', 'You have successfully logged In.', 'আপনি সফলভাবে লগ ইন করেছেন.', 'Has iniciado sesión correctamente.', 'لقد قمت بتسجيل الدخول بنجاح.', 'आप सफलता पूर्वक प्रवेश कर चुके हैं।', 'آپ نے کامیابی سے ان میں لاگ ان کیا ہے.', '您已成功登录。', 'あなたは正常にログインしました。', 'Você fez login com sucesso.', 'Вы успешно вошли в.', 'Vous avez réussi à vous connecter', '로그인했습니다.', 'Sie haben sich erfolgreich angemeldet.', 'Hai effettuato il log in con successo.', 'คุณเข้าสู่ระบบเรียบร้อยแล้ว', 'Sikeresen bejelentkezett.', 'Je bent succesvol ingelogd.', 'Et tu bene initium.', 'Anda berhasil masuk', 'Başarıyla giriş yaptınız.', 'Έχετε επιτυχώς συνδεθεί.', 'شما با موفقیت وارد شدید.', 'Anda berjaya melog masuk.', 'మీరు విజయవంతంగా లాగిన్ చేసారు.', 'நீங்கள் உள்நுழைந்துள்ளீர்கள்.', 'તમે સફળતાપૂર્વક લોગ ઇન કર્યું છે.', 'Logowanie zakończone powodzeniem.', 'Ви успішно ввійшли в систему.', 'ਤੁਸੀਂ ਸਫਲਤਾਪੂਰਵਕ ਲਾਗ ਇਨ ਕੀਤਾ ਹੈ.', 'Ați fost conectat (ă) cu succes.', 'သင့်အလယ်၌အောင်မြင်စွာ logged ပါပြီ။', 'O ti wọle Wole ni ilọsiwaju.', 'An samu nasarar shiga cikin.'),
(434, 'wrong_email', 'You have entered wrong email address', 'আপনি ভুল ইমেল ঠিকানা প্রবেশ করেছেন', 'Ingresó una dirección de correo electrónico incorrecta', 'لقد أدخلت عنوان بريد إلكتروني خاطئا', 'आपने गलत ईमेल पता दर्ज किया है', 'آپ نے غلط ای میل پتہ درج کیا ہے', '您输入了错误的电子邮件地址', 'あなたは間違った電子メールアドレスを入力しました', 'Você digitou um endereço de e-mail incorreto', 'Вы ввели неправильный адрес электронной почты', 'Vous avez entré une adresse e-mail incorrecte', '잘못된 이메일 주소를 입력했습니다.', 'Sie haben eine falsche E-Mail-Adresse eingegeben', 'Hai inserito un indirizzo email errato', 'คุณป้อนที่อยู่อีเมลผิด', 'Rossz e-mail címet adott meg', 'U hebt een verkeerd e-mailadres ingevoerd', 'Et ingressi sunt nefas inscriptio', 'Anda telah memasukkan alamat email salah', 'Yanlış e-posta adresini girdiniz', 'Έχετε εισάγει λάθος διεύθυνση ηλεκτρονικού ταχυδρομείου', 'شما آدرس ایمیل اشتباه وارد کرده اید', 'Anda telah memasukkan alamat e-mel yang salah', 'మీరు తప్పు ఇమెయిల్ చిరునామాను నమోదు చేసారు', 'நீங்கள் தவறான மின்னஞ்சல் முகவரியை உள்ளிட்டுள்ளீர்கள்', 'તમે ખોટો ઇમેઇલ સરનામું દાખલ કર્યું છે', 'Podałeś zły adres e-mail', 'Ви ввели неправильну адресу електронної пошти', 'ਤੁਸੀਂ ਗਲਤ ਈਮੇਲ ਪਤਾ ਦਾਖਲ ਕੀਤਾ ਹੈ', 'Ați introdus o adresă de e-mail greșită', 'သငျသညျမှားယွင်းတဲ့အီးမေးလ်လိပ်စာထဲသို့ဝင်ခဲ့ကြ', 'O ti tẹ adirẹsi imeeli ti ko tọ', 'An shigar da adireshin email bata daidai'),
(435, 'reset_email_success', 'Password reset email sent successfully. Please check you email', ' 62/5000 পাসওয়ার্ড রিসেট ইমেল সফলভাবে পাঠানো হয়েছে আপনি ইমেল চেক করুন', 'El correo electrónico de restablecimiento de contraseña se envió correctamente. Por favor revisa tu correo electrónico', 'تم إرسال البريد الإلكتروني لإعادة تعيين كلمة المرور بنجاح. يرجى التحقق من بريدك الإلكتروني', 'पासवर्ड रीसेट ईमेल सफलतापूर्वक भेजा गया कृपया आपको ईमेल जांचें', 'پاس ورڈ دوبارہ ترتیب ای میل کامیابی سے بھیجا گیا. براہ کرم آپ کو ای میل چیک کریں', '密码重置邮件发送成功。 请检查你的电子邮件', 'パスワードリセットメールが正常に送信されました。 メールをチェックしてください', 'Senha de redefinição de senha enviada com sucesso. Verifique seu e-mail', 'Сброс пароля был успешно отправлен. Пожалуйста, проверьте электронную почту', 'Password reset email sent successfully. Please check you email', '비밀번호 재설정 이메일이 성공적으로 전송되었습니다. 이메일을 확인하십시오.', 'E-Mail zur Zurücksetzung des Kennworts erfolgreich gesendet Bitte überprüfen Sie Ihre E-Mail', 'Email di reimpostazione della password inviata correttamente. Per favore controlla la tua email', 'อีเมลรีเซ็ตรหัสผ่านถูกส่งเรียบร้อยแล้ว โปรดตรวจสอบอีเมลของคุณ', 'A jelszó-visszaállító e-mail sikeresen elküldve. Kérjük, ellenőrizze az e-mailt', 'Wachtwoord reset e-mail succesvol verzonden. Controleer je e-mail', 'Reddere email password misit tincidunt. Placere reprehendo vestri email', 'Email reset password berhasil dikirim Silahkan cek email anda', 'Şifre sıfırlama e-postası başarıyla gönderildi. Lütfen e-postayı kontrol et', 'Το μήνυμα ηλεκτρονικού ταχυδρομείου επαναφοράς κωδικού πρόσβασης έγινε με επιτυχία Παρακαλώ ελέγξτε το email σας', 'ایمیل ارسالی با موفقیت ارسال شد. لطفا ایمیل را بررسی کنید', 'E-mel tetapan semula kata laluan berjaya dihantar. Sila semak e-mel anda', 'పాస్వర్డ్ రీసెట్ ఇమెయిల్ విజయవంతంగా పంపబడింది. దయచేసి మీకు ఇమెయిల్ తనిఖీ చేయండి', 'கடவுச்சொல் மீட்டமைப்பு மின்னஞ்சல் வெற்றிகரமாக அனுப்பப்பட்டது. தயவுசெய்து மின்னஞ்சலை சரிபார்க்கவும்', 'પાસવર્ડ રીસેટ ઇમેઇલ સફળતાપૂર્વક મોકલ્યો કૃપા કરીને તમને ઇમેઇલ તપાસો', 'E-mail z resetem hasła został wysłany pomyślnie. Proszę sprawdzić e-mail', 'Електронна адреса для відновлення пароля успішно відправлено. Будь-ласка, перевірте, чи є вам електронною поштою', 'ਪਾਸਵਰਡ ਰੀਸੈਟ ਈਮੇਲ ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ ਕਿਰਪਾ ਕਰਕੇ ਤੁਹਾਨੂੰ ਈਮੇਲ ਦੀ ਜਾਂਚ ਕਰੋ', 'Emailul de resetare a parolei a fost trimis cu succes Vă rugăm să verificați prin e-mail', 'စကားဝှက်ပြန်ညှိအီးမေးလ်ကိုအောင်မြင်စွာစေလွှတ်ခဲ့သည်။ သငျသညျကိုအီးမေးလ်စစ်ဆေးပါ', 'Ọrọigbaniwọle atunto imeeli ti firanṣẹ ni ifijišẹ Jowo ṣayẹwo o imeeli', 'Sake saitin imel kalmar sirri da aka aika. Da fatan a duba ku email'),
(436, 'unexpected_error', 'Unexpected error occured', 'অপ্রত্যাশিত ত্রুটি ঘটেছে', 'Ocurrió un error inesperado', 'حدث خطأ غير متوقع', 'अनपेक्षित त्रुटि हुई', 'غیر متوقع غلطی ہوئی', '意外的错误发生', '予期しないエラーが発生しました', 'Ocorreu um erro inesperado', 'Произошла непредвиденная ошибка', 'Une erreur inattendue sest produite', '예기치 않은 오류가 발생했습니다.', 'Unerwarteter Fehler ist aufgetreten', 'Si è verificato un errore imprevisto', 'เกิดข้อผิดพลาดที่ไม่คาดคิด', 'Váratlan hiba történt', 'Er is een onverwachte fout opgetreden', 'Error occurrit inopinatum', 'Terjadi kesalahan tak terduga', 'Beklenmedik bir hata oluştu', 'Παρουσιάστηκε μη αναμενόμενο σφάλμα', 'خطای غیرمنتظره رخ داده است', 'Ralat tidak dijangka berlaku', 'ఊహించని లోపం సంభవించింది', 'எதிர்பாராத பிழை ஏற்பட்டது', 'અનપેક્ષિત ભૂલ આવી', 'Pojawił się nieoczekiwany błąd', 'Несподівана помилка', 'ਅਚਾਨਕ ਤਰੁੱਟੀ ਉਤਪੰਨ ਹੋਈ', 'A apărut o eroare neașteptată', 'မမျှော်လင့်ဘဲအမှားဖြစ်ပွားခဲ့သည်', 'Aṣiṣe airotẹlẹ kan ṣẹlẹ', 'An sami kuskure marar kuskure'),
(437, 'password_reset_error', 'Password length must be 6-12 Character and match with Confirm password', 'পাসওয়ার্ডের দৈর্ঘ্য 6-12 অক্ষর এবং নিশ্চিত পাসওয়ার্ডের সাথে মেলে', 'La longitud de la contraseña debe ser de 6-12 caracteres y coincide con Confirmar contraseña', 'يجب أن يكون طول كلمة المرور 6-12 حرف وتطابق مع تأكيد كلمة المرور', 'पासवर्ड की लंबाई 6-12 वर्ण और पासवर्ड की पुष्टि के साथ मैच होना चाहिए', 'پاس ورڈ کی لمبائی 6-12 ہونا ضروری ہے اور اس کی تصدیق کی پاس ورڈ کے ساتھ میچ ہونا چاہیے', '密码长度必须是6-12个字符并且与确认密码相匹配', 'パスワードの長さは6〜12文字で、パスワードの確認と一致する必要があります', 'O comprimento da senha deve ser de 6 a 12 caracteres e combinar com Confirmar senha', 'Длина пароля должна быть 6-12 символов и соответствовать паролю подтверждения.', 'la longueur du mot de passe doit être comprise entre 6 et 12 caractères et correspondre avec Confirmer le mot de passe', '비밀번호 길이는 6-12 자 여야하며 비밀번호 확인과 일치해야합니다.', 'Die Passwortlänge muss 6-12 Zeichen lang sein und mit Passwort bestätigen übereinstimmen', 'La lunghezza della password deve essere di 6-12 caratteri e corrisponde a Conferma password', 'รหัสผ่านต้องยาว 6-12 ตัวอักษรและตรงกับรหัสยืนยัน', 'A jelszó hosszúságának 6-12 karakterből kell állnia, és meg kell egyeznie a Jelszó megerősítésével', 'Wachtwoordlengte moet 6-12 tekens zijn en overeenkomen met Wachtwoord bevestigen', '6-12 longitudinem esse pares ignoro Character Confirm ignoro', 'Panjang kata sandi harus 6-12 Karakter dan cocok dengan Confirm password', 'Şifre uzunluğu 6-12 karakter olmalıdır ve Parolayı onayla ile eşleşmelidir.', 'Το μήκος του κωδικού πρόσβασης πρέπει να είναι 6-12 χαρακτήρες και να ταιριάζει με τον κωδικό επιβεβαίωσης', 'طول رمز عبور باید 6 تا 12 حرف باشد و با تایید رمز عبور مطابقت دارد', 'Panjang kata laluan mesti 6-12 Watak dan padan dengan Sahkan kata laluan', 'పాస్ వర్డ్ పొడవు 6-12 ఉండాలి', 'கடவுச்சொல் நீளம் இருக்க வேண்டும் 6-12 எழுத்து மற்றும் கடவுச்சொல்லை உறுதிப்படுத்தல் பொருந்தவில்லை', 'પાસવર્ડની લંબાઈ 6-12 અક્ષર હોવા જોઈએ અને પાસવર્ડની પુષ્ટિ કરો', 'Długość hasła musi wynosić 6-12 Znak i dopasowanie z Potwierdź hasło', 'Довжина пароля повинна бути 6-12 символів і відповідати з підтвердженням пароля', 'ਪਾਸਵਰਡ ਦੀ ਲੰਬਾਈ 6-12 ਅੱਖਰ ਹੋਣੀ ਚਾਹੀਦੀ ਹੈ ਅਤੇ ਪਾਸਵਰਡ ਨਾਲ ਪੁਸ਼ਟੀ ਕਰੋ', 'Lungimea parolei trebuie să fie 6-12 Caracter și să se potrivească cu Confirmare parolă', 'Password ကိုအရှည် Confirm password ကိုအတူ 6-12 အက္ခရာနှင့်ပွဲစဉ်ဖြစ်ရပါမည်', 'Ipari ipari ọrọigbaniwọle gbọdọ jẹ 6-12 Ti ohun kikọ ati baramu pẹlu Jẹrisi ọrọigbaniwọle', 'Dole ne kalmar wucewa ta kasance ta 6-12 Haɗi da wasa tare da Tabbatar da kalmar sirri'),
(438, 'in_active', 'Inactive', 'নিষ্ক্রিয়', 'Inactivo', 'غير نشط', 'निष्क्रिय', 'غیر فعال', '待用', '非アクティブ', 'Inativo', 'Неактивный', 'Inactif', '비활성', 'Inaktiv', 'Inattivo', 'เฉื่อยชา', 'tétlen', 'Inactief', 'Ut ultrices vestibulum', 'Tidak aktif', 'etkisiz', 'Αδρανής', 'غیر فعال', 'Tidak aktif', 'క్రియారహిత', 'செயல்படா', 'નિષ્ક્રિય', 'Nieaktywny', 'Неактивний', 'ਨਿਸ਼ਕਿਰਿਆ', 'Inactiv', 'မလှုပ်ရှားတတ်သော', 'Inactive', 'Mai aiki'),
(440, 'fill_out_all_data', 'Please fill up all field data', 'সমস্ত ক্ষেত্রের তথ্য পূরণ করুন দয়া করে', 'Complete todos los datos de campo', 'يرجى ملء جميع البيانات الميدانية', 'कृपया सभी फ़ील्ड डेटा भरें', 'براہ کرم تمام فیلڈ ڈیٹا کو بھریں', '请填写所有的现场数据', 'すべてのフィールドデータを入力してください', 'Complete todos os dados de campo', 'Пожалуйста, заполните все полевые данные', 'Sil vous plaît remplir toutes les données de terrain', '모든 필드 데이터를 입력하십시오.', 'Bitte füllen Sie alle Felddaten aus', 'Si prega di compilare tutti i dati del campo', 'โปรดกรอกข้อมูลฟิลด์ทั้งหมด', 'Kérjük, töltse ki az összes mezőadatot', 'Vul alle veldgegevens in', 'Obsecro, universi agri data fillup', 'Silahkan isi semua data lapangan', 'Lütfen tüm alan verilerini doldurun', 'Παρακαλούμε συμπληρώστε όλα τα δεδομένα πεδίου', 'لطفا تمام اطلاعات فیلد را پر کنید', 'Sila mengisi semua data medan', 'దయచేసి అన్ని క్షేత్ర డేటాను పూరించండి', 'அனைத்து புல தரவு நிரப்பவும்', 'કૃપા કરીને તમામ ફીલ્ડ ડેટા ભરો', 'Proszę odflukować wszystkie dane pola', 'Будь ласка, заповніть всі дані поля', 'ਕਿਰਪਾ ਕਰਕੇ ਸਾਰੇ ਫੀਲਡ ਡਾਟਾ ਭਰ ਦਿਓ', 'Completați toate datele câmpului', 'အားလုံးလယ်ကွင်းဒေတာ fillup ကျေးဇူးပြု.', 'Jowo fi gbogbo data aaye kun', 'Da fatan a cika dukkan bayanan filin'),
(441, 'email_send_failed', 'Email sent failed. Please try again.', 'ইমেল পাঠানো ব্যর্থ হয়েছে। অনুগ্রহপূর্বক আবার চেষ্টা করুন.', 'El correo electrónico enviado falló. Inténtalo de nuevo.', 'أخفق إرسال البريد الإلكتروني. حاول مرة اخرى.', 'ईमेल भेजा विफल रहा। कृपया पुन: प्रयास करें।', 'ای میل بھیجا گیا. دوبارہ کوشش کریں.', '电子邮件发送失败 请再试一次。', '送信されたメールは失敗しました もう一度お試しください。', 'E-mail enviado falhou. Por favor, tente novamente.', 'Не удалось отправить сообщение по электронной почте. Пожалуйста, попробуйте еще раз.', 'Email envoyé a échoué. Veuillez réessayer.', '전송 된 이메일이 실패했습니다. 다시 시도하십시오.', 'E-Mail sendet fehlgeschlagen. Bitte versuchen Sie es.', 'Email inviata fallita. Per favore riprova.', 'อีเมลที่ส่งล้มเหลว กรุณาลองอีกครั้ง.', 'Az elküldött e-mail nem sikerült. Kérlek próbáld újra.', 'E-mail verzonden mislukt. Probeer het opnieuw.', 'Misimus defecit. Quaero, iterum conare.', 'Email terkirim gagal Silahkan coba lagi', 'E-posta gönderilemedi. Lütfen tekrar deneyin.', 'Το ηλεκτρονικό ταχυδρομείο που στάλθηκε απέτυχε ΠΑΡΑΚΑΛΩ προσπαθησε ξανα.', 'ایمیل ارسال نشد. لطفا دوباره تلاش کنید.', 'E-mel dihantar gagal. Sila cuba lagi.', 'ఇమెయిల్ పంపడం విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి.', 'மின்னஞ்சல் அனுப்பப்பட்டது தோல்வியடைந்தது. தயவு செய்து மீண்டும் முயற்சிக்கவும்.', 'ઇમેઇલ મોકલવામાં નિષ્ફળ થયું. મહેરબાની કરીને ફરીથી પ્રયતન કરો.', 'Nie udało się wysłać e-maila. Proszę spróbuj ponownie.', 'Не вдалося надіслати електронне повідомлення. Будь ласка спробуйте ще раз.', 'ਭੇਜੀ ਗਈ ਈਮੇਲ ਫੇਲ੍ਹ ਹੋਈ. ਮੁੜ ਕੋਸ਼ਿਸ ਕਰੋ ਜੀ.', 'Emailul trimis a eșuat. Vă rugăm să încercați din nou.', 'အီးမေးလ်ပို့ရန်မအောင်မြင်စေလွှတ်ခဲ့သည်။ ထပ်ကြိုးစားပါ။', 'Ifiranṣẹ imeeli ti kuna. Jọwọ gbiyanju lẹẹkansi.', 'An aika imel da aka aika ya kasa. Da fatan a sake gwadawa.'),
(442, 'email_send_success', 'Email sent successfully', 'ইমেল সফলভাবে পাঠানো হয়েছে', 'Correo electrónico enviado con éxito', 'تم إرسال البريد الإلكتروني بنجاح', 'सफलतापूर्वक भेजा गया ईमेल', 'ای میل کامیابی سے بھیجا گیا', '电子邮件发送成功', '電子メールを正常に送信', 'E-mail enviado com sucesso', 'письмо успешно отправлено', 'E-mail envoyé avec succès', '이메일이 전송되었습니다.', 'Email wurde erfolgreich Versendet', 'email inviata correttamente', 'ส่งอีเมลเรียบร้อยแล้ว', 'Az e-mail sikeresen elküldve', 'E-mail met succes verzonden', 'Email ad bene', 'Email berhasil dikirim', 'e-posta başarıyla gönderildi', 'Το email στάλθηκε με επιτυχία', 'ایمیل با موفقیت ارسال شد', 'E-mel berjaya dihantar', 'ఇమెయిల్ విజయవంతంగా పంపబడింది', 'மின்னஞ்சல் வெற்றிகரமாக அனுப்பப்பட்டது', 'ઇમેઇલ સફળતાપૂર્વક મોકલ્યો', 'E-mail wysłany pomyślnie', 'Електронна пошта надійшла успішно', 'ਈਮੇਲ ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ', 'Email-ul a fost trimis cu succes', 'အောင်မြင်စွာကိုစလှေတျအီးမေးလ်ပို့ရန်', 'Imeeli firanṣẹ ni ifijišẹ', 'Imel da aka aika da nasarar'),
(443, 'sms_send_failed', 'Sms send failed. Please try again', 'এসএমএস পাঠানো ব্যর্থ হয়েছে অনুগ্রহপূর্বক আবার চেষ্টা করুন', 'SMS enviado fallido. Inténtalo de nuevo', 'أرسل الرسائل القصيرة سمز. حاول مرة اخرى', 'एसएमएस भेजना विफल हुआ कृपया पुन: प्रयास करें', 'ایس ایم ایس ناکام ہوگئے. دوبارہ کوشش کریں', '短信发送失败。 请再试一次', 'SMS送信に失敗しました。 もう一度お試しください', 'Sms send falhou. Por favor, tente novamente', 'Ошибка отправки sms не удалась. Пожалуйста, попробуйте еще раз', 'Lenvoi de sms a échoué. Veuillez réessayer', 'SMS 전송에 실패했습니다. 다시 시도하십시오.', 'SMS senden fehlgeschlagen. Bitte versuche es erneut', 'Invio SMS fallito. Per favore riprova', 'ส่ง sms ล้มเหลว กรุณาลองอีกครั้ง', 'A sms küldés nem sikerült. Kérlek próbáld újra', 'Sms verzenden mislukt. Probeer het opnieuw', 'Mittere SMS defecit. Quaero, iterum conare', 'Sms send gagal Silahkan coba lagi', 'SMS göndermek başarısız oldu. Lütfen tekrar deneyin', 'Η αποστολή SMS απέτυχε. ΠΑΡΑΚΑΛΩ προσπαθησε ξανα', 'پیامک ارسال نشد لطفا دوباره تلاش کنید', 'Hantar sms gagal. Sila cuba lagi', 'SMS పంపడం విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి', 'Sms அனுப்ப முடியவில்லை. தயவு செய்து மீண்டும் முயற்சிக்கவும்', 'એસએમએસ મોકલવામાં નિષ્ફળ. મહેરબાની કરીને ફરીથી પ્રયતન કરો', 'Nie udało się wysłać SMS-a. Proszę spróbuj ponownie', 'Не вдалося надіслати SMS-повідомлення. Будь ласка спробуйте ще раз', 'ਐਸਐਮਐਸ ਭੇਜਣਾ ਅਸਫਲ ਮੁੜ ਕੋਸ਼ਿਸ ਕਰੋ ਜੀ', 'Sms-ul trimite nu a reușit. Vă rugăm să încercați din nou', 'sms ပျက်ကွက်ပေးပို့ပါ။ ထပ်ကြိုးစားပါ', 'Ifiranṣẹ Sms ti kuna. Jọwọ gbiyanju lẹẹkansi', 'Sms aika ya kasa. Da fatan a sake gwadawa'),
(444, 'sms_send_success', 'Sms sent successfully', 'এসএমএস সফলভাবে পাঠানো হয়েছে', 'SMS enviado satisfactoriamente', 'تم إرسال الرسائل القصيرة بنجاح', 'एसएमएस सफलतापूर्वक भेजा गया', 'ایس ایم ایس کامیابی سے بھیجے گئے', '短信发送成功', 'SMSが正常に送信されました', 'SMS enviado com êxito', 'Sms успешно отправлен', 'SMS envoyé avec succès', 'SMS가 성공적으로 보냈습니다.', 'SMS erfolgreich versendet', 'SMS inviato correttamente', 'ส่ง sms เรียบร้อยแล้ว', 'A sms sikeresen elküldve', 'SMS succesvol verzonden', 'SMS misit feliciter', 'Sms berhasil dikirim', 'SMS başarıyla gönderildi', 'Τα SMS αποστέλλονται με επιτυχία', 'اس ام اس با موفقیت ارسال شد', 'Sms dihantar berjaya', 'Sms విజయవంతంగా పంపబడింది', 'Sms வெற்றிகரமாக அனுப்பப்பட்டது', 'એસએમએસ સફળતાપૂર્વક મોકલ્યો છે', 'SMS wysłany z powodzeniem', 'СМС успішно відправлено', 'SMS ਸਫਲਤਾਪੂਰਵਕ ਭੇਜਿਆ ਗਿਆ', 'Sms-urile au fost trimise cu succes', 'အောင်မြင်စွာကိုစလှေတျ sms', 'Sms rán ni ifijišẹ', 'Sms ya aika da nasarar'),
(445, 'clickatell_mo_no', 'Mo Number', 'MO সংখ্যা', 'Número Mo', 'مو عدد', 'मो नंबर', 'مو نمبر', '莫数', 'Mo番号', 'Número Mo', 'Номер Mo', 'Mo Number', '모 번호', 'Mo Nummer', 'Numero Mo', 'จำนวนโม', 'Mo szám', 'Mo-nummer', 'Mo Number', 'Nomor Mo', 'Mo Numarası', 'Αριθμός Mo', 'شماره م', 'Nombor Mo', 'మో సంఖ్య', 'மோ எண்', 'મો સંખ્યા', 'Numer Mo', 'Номер Мо', 'ਮੋ ਨੰਬਰ', 'Numărul Mo', 'mo အရေအတွက်', 'Mo Number', 'Mo Number'),
(446, 'setup_your_sms_gateway', 'Please set up your expected sms gateway correctly ', 'অনুগ্রহ করে আপনার প্রত্যাশিত এসএমএস গেটওয়ে সঠিকভাবে সেট আপ করুন', 'Configure su puerta de enlace de SMS esperado correctamente', 'يرجى إعداد بوابة الرسائل القصيرة المتوقعة بشكل صحيح', 'कृपया अपना अपेक्षित एसएमएस गेटवे सही ढंग से सेट करें', 'براہ مہربانی اپنے متوقع ایس ایم ایس گیٹ وے کو صحیح طریقے سے مقرر کریں', '请正确设置您的预期的短信网关', '予想されるSMSゲートウェイを正しく設定してください', 'Configure o seu esperado sms gateway corretamente', 'Правильно настройте свой ожидаемый sms-шлюз', 'Veuillez configurer votre passerelle SMS attendue correctement', '예상되는 SMS 게이트웨이를 올바르게 설정하십시오.', 'Bitte richten Sie Ihr erwartetes SMS-Gateway korrekt ein', 'Si prega di configurare il vostro gateway sms previsto correttamente', 'โปรดตั้งค่าเกตเวย์ sms ที่คุณต้องการโดยถูกต้อง', 'Kérjük, helyesen állítsa be az elvárt sms-átjárót', 'Stel uw verwachte sms-gateway correct in', 'SMS porta quaeso erigas bene sperandum', 'Harap siapkan gateway sms yang Anda harapkan dengan benar', 'Lütfen beklenen sms ağ geçidinizi doğru bir şekilde ayarlayın.', 'Ρυθμίστε σωστά την αναμενόμενη πύλη sms', 'لطفا دروازه مورد انتظار اس ام اس مورد نظر را درست تنظیم کنید', 'Sila buat gerbang sms yang diharapkan', 'దయచేసి మీ ఆశించిన SMS గేట్ సరిగ్గా అమర్చండి', 'உங்கள் எதிர்பார்க்கப்படும் எஸ்எம்எஸ் நுழைவாயை சரியாக அமைக்கவும்', 'કૃપા કરીને તમારા અપેક્ષિત એસએમએસ ગેટવેને યોગ્ય રીતે સેટ કરો', 'Proszę poprawnie skonfigurować oczekiwaną bramę sms', 'Будь ласка, правильно налаштуйте очікуваний шлюз sms', 'ਕਿਰਪਾ ਕਰਕੇ ਆਪਣੇ ਉਮੀਦਵਾਰ SMS ਗੇਟਵੇ ਨੂੰ ਸਹੀ ਢੰਗ ਨਾਲ ਸੈਟ ਅਪ ਕਰੋ', 'Vă rugăm să configurați corect poarta de așteptare pentru sms', 'မှန်မှန်ကန်ကန်သင့်ရဲ့မျှော်မှန်း sms ကိုတံခါးပေါက်ကို set up ကို ကျေးဇူးပြု.', 'Jowo gbe ọna ẹnu sms ti o ti ṣe yẹ rẹ silẹ tọ', 'Don Allah a kafa hanyar ƙoƙarin sms da ake tsammani a daidai'),
(447, 'already_exist', 'This data already exists in database. Please try another one.', 'এই ডেটা ডাটাবেসে ইতিমধ্যে বিদ্যমান। অন্য একটি চেষ্টা করুন।', 'Esta información ya existe en la base de datos. Por favor prueba con otro.', 'هذه البيانات موجودة بالفعل في قاعدة البيانات. الرجاء محاولة تجربة أخرى.', 'डेटाबेस में यह डेटा पहले से मौजूद है कृपया कोई दूसरा प्रयास करें', 'ڈیٹا بیس میں یہ ڈیٹا پہلے ہی موجود ہے. براہ کرم ایک اور کوشش کریں.', '这个数据已经存在于数据库中。 请尝试另一个。', 'このデータはすでにデータベースに存在します。 別のものをお試しください。', 'Estes dados já existem no banco de dados. Por favor, tente outro.', 'Эти данные уже существуют в базе данных. Попробуйте еще один.', 'Ces données existent déjà dans la base de données. Sil vous plaît essayer un autre.', '이 데이터는 이미 데이터베이스에 있습니다. 다른 것을 시도하십시오.', 'Diese Daten existieren bereits in der Datenbank. Bitte versuchen Sie es mit einem anderen.', 'Questi dati esistono già nel database. Si prega di provare un altro.', 'ข้อมูลนี้มีอยู่แล้วในฐานข้อมูล โปรดลองอีกอันหนึ่ง', 'Ez az adat már létezik az adatbázisban. Próbálj ki egyet.', 'Deze gegevens bestaan al in de database. Probeer een andere.', 'Hoc etiam existit in database notitia. Aliquam alia.', 'Data ini sudah ada di database. Silakan coba yang lain.', 'Bu veriler zaten veritabanında mevcut. Lütfen başka bir tane deneyin.', 'Αυτά τα δεδομένα υπάρχουν ήδη στη βάση δεδομένων. Δοκιμάστε άλλο.', 'این اطلاعات قبلا در پایگاه داده وجود دارد. لطفا یکی دیگر را امتحان کنید', 'Data ini sudah wujud dalam pangkalan data. Sila cuba yang lain.', 'ఈ డేటా ఇప్పటికే డేటాబేస్లో ఉంది. దయచేసి మరొకదాన్ని ప్రయత్నించండి.', 'தரவு ஏற்கனவே தரவுத்தளத்தில் உள்ளது. தயவுசெய்து வேறொரு ஒன்றை முயற்சிக்கவும்.', 'ડેટા ડેટાબેઝમાં આ ડેટા પહેલેથી હાજર છે. કૃપા કરી બીજી કોઈનો પ્રયાસ કરો.', 'Te dane już istnieją w bazie danych. Proszę spróbować innego.', 'Ці дані вже існують у базі даних. Будь ласка, спробуйте інший.', 'ਇਹ ਡੇਟਾ ਡੇਟਾਬੇਸ ਵਿੱਚ ਮੌਜੂਦ ਹੈ. ਕਿਰਪਾ ਕਰਕੇ ਹੋਰ ਕੋਈ ਕੋਸ਼ਿਸ਼ ਕਰੋ.', 'Aceste date există deja în baza de date. Încearcă altul.', 'ဒီ data ပြီးသားဒေတာဘေ့စရှိ။ အခြားတဦးတည်းကြိုးစားပါ။', 'Data yi tẹlẹ wa ni ibi ipamọ data. Jọwọ ṣe idanwo miiran.', 'Wannan bayanai sun riga sun kasance a cikin bayanai. Da fatan a gwada wani.'),
(448, 'valid_file_format_doc', 'Document file format: pdf, .doc, .docx or .txt', 'ডকুমেন্ট ফাইল ফরমেট: পিডিএফ, .ডক, .ডোসিস ওর .টেক্সট', 'Formato de archivo de documento: pdf, .doc, .docx o .txt', 'تنسيق ملف المستند: بدف أو .doc أو .docx أو .txt', 'दस्तावेज़ फ़ाइल प्रारूप: पीडीएफ, .doc, .docx या .txt', 'دستاویز فائل کی شکل: پی ڈی ایف، .doc، .docx یا .txt', '文档文件格式：pdf，.doc，.docx或.txt', 'ドキュメントファイル形式：pdf、.doc、.docx、または.txt', 'Formato do arquivo de documento: pdf, .doc, .docx ou .txt', 'Формат файла документа: pdf, .doc, .docx или .txt', 'Format de fichier de document: pdf, .doc, .docx ou .txt', '문서 파일 형식 : pdf, .doc, .docx 또는 .txt', 'Dokumentdateiformat: pdf, .doc, .docx oder .txt', 'Formato del documento: pdf, .doc, .docx o .txt', 'รูปแบบไฟล์เอกสาร: pdf, .doc, .docx หรือ. txt', 'Dokumentum fájlformátum: pdf, .doc, .docx vagy .txt', 'Document bestandsformaat: pdf, .doc, .docx of .txt', 'Documentum formae q.e.: pdf, .doc, aut .docx .txt', 'Format file dokumen: pdf, .doc, .docx, atau .txt', 'Belge dosyası biçimi: pdf, .doc, .docx veya .txt', 'Μορφή αρχείου εγγράφου: pdf, .doc, .docx ή .txt', 'فرمت فایل اسناد: pdf، .doc، .docx یا .txt', 'Format fail dokumen: pdf, .doc, .docx atau .txt', 'డాక్యుమెంట్ ఫైల్ ఫార్మాట్: pdf, .doc, .docx లేదా .txt', 'ஆவண கோப்பு வடிவம்: pdf, .doc, .docx அல்லது .txt', 'દસ્તાવેજ ફાઇલ ફોર્મેટ: પીડીએફ, .ડોક, ..docx અથવા .txt', 'Format pliku dokumentu: pdf, .doc, .docx lub .txt', 'Формат файлу документа: pdf, .doc, .docx або .txt', 'ਦਸਤਾਵੇਜ਼ ਫਾਈਲ ਫਾਰਮੈਟ: ਪੀ ਡੀ ਐਫ, .ਡੌਕ, .ਡੌਕਸ ਜਾਂ .txt', 'Formatul fișierului documentului: pdf, .doc, .docx sau .txt', 'စာရွက်စာတမ်းဖိုင်ကို format နဲ့: pdf, .doc, .docx သို့မဟုတ် .txt', 'Faili faili faili: pdf, .doc, .docx or .txt', 'Tsarin fayil na fayil: pdf, .doc, .docx ko .txt'),
(453, 'valid_file_format_img', 'Image file format: .jpg, .jpeg, .png or .gif', 'ইমেজ ফাইল ফরমেট: .জেপিজি, .জেপেগ, .পং ওর .গিফ।', 'Formato de archivo de imagen: .jpg, .jpeg, .png o .gif', 'تنسيق ملف الصورة: .jpg أو .jpeg أو ينغ أو .gif', 'छवि फ़ाइल प्रारूप: .jpg, .jpeg, .png या .gif', 'تصویری فائل کی شکل: .jpg، .jpeg، .png یا .gif', '图像文件格式：.jpg，.jpeg，.png或.gif', '画像ファイル形式：.jpg、.jpeg、.png、.gif', 'Formato do arquivo de imagem: .jpg, .jpeg, .png ou .gif', 'Формат файла изображения: .jpg, .jpeg, .png или .gif', 'Format de fichier image: .jpg, .jpeg, .png ou .gif', '이미지 파일 형식 : .jpg, .jpeg, .png 또는 .gif', 'Bilddateiformat: .jpg, .jpeg, .png oder .gif', 'Formato file immagine: .jpg, .jpeg, .png o .gif', 'รูปแบบไฟล์รูปภาพ: .jpg, .jpeg, .png หรือ. gif', 'Képfájl formátuma: .jpg, .jpeg, .png vagy .gif', 'Afbeeldingsbestandsindeling: .jpg, .jpeg, .png of .gif', 'Image formae q.e.: .jpg, .jpeg, aut png .gif', 'Format file gambar: .jpg, .jpeg, .png, atau .gif', 'Resim dosyası biçimi: .jpg, .jpeg, .png veya .gif', 'Μορφή αρχείου εικόνας: .jpg, .jpeg, .png ή .gif', 'فرمت فایل تصویری: .jpg، .jpeg، .png یا .gif', 'Format fail imej: .jpg, .jpeg, .png atau .gif', 'ఇమేజ్ ఫైల్ ఫార్మాట్: .jpg, .jpeg, .png లేదా .gif', 'பட கோப்பு வடிவமைப்பு: .jpg, .jpeg, .png அல்லது. Gif', 'છબી ફાઇલ ફોર્મેટ: .jpg, .jpeg, .png અથવા .gif', 'Format pliku obrazu: .jpg, .jpeg, .png lub .gif', 'Формат файлу зображень: .jpg, .jpeg, .png або .gif', 'ਚਿੱਤਰ ਫਾਇਲ ਫਾਰਮੈਟ: .jpg, .jpeg, .png ਜਾਂ .gif', 'Formatul fișierului imagine: .jpg, .jpeg, .png sau .gif', 'image file format နဲ့: .jpg, တွေဖြစ်တဲ့ JPEG, .png သို့မဟုတ် .gif', 'Aworan faili kika: .jpg, .jpeg, .png tabi .gif', 'Tsarin fayil na hotuna: .jpg, .jpeg, .png ko .gif'),
(455, 'select_valid_file_format', 'Please select a valid file format.', 'একটি ভ্যালিড ফাইল ফরমেট নির্বাচন করুন।', 'Seleccione un formato de archivo válido.', 'الرجاء تحديد تنسيق ملف صالح.', 'कृपया एक वैध फ़ाइल प्रारूप का चयन करें।', 'براہ کرم ایک درست فائل کی شکل منتخب کریں.', '请选择一个有效的文件格式。', '有効なファイル形式を選択してください。', 'Selecione um formato de arquivo válido.', 'Выберите допустимый формат файла.', 'Veuillez sélectionner un format de fichier valide', '유효한 파일 형식을 선택하십시오.', 'Bitte wählen Sie ein gültiges Dateiformat.', 'Si prega di selezionare un formato di file valido.', 'โปรดเลือกรูปแบบไฟล์ที่ถูกต้อง', 'Kérjük, válasszon egy érvényes fájlformátumot.', 'Selecteer alstublieft een geldig bestandsformaat.', 'Placere eligere formae q.e. valet.', 'Silahkan pilih format file yang valid.', 'Lütfen geçerli bir dosya biçimi seçin.', 'Επιλέξτε μια έγκυρη μορφή αρχείου.', 'لطفا یک فرمت فایل معتبر را انتخاب کنید', 'Sila pilih format fail yang sah.', 'దయచేసి చెల్లుబాటు అయ్యే ఫైల్ ఆకృతిని ఎంచుకోండి.', 'செல்லுபடியாகும் கோப்பு வடிவத்தை தேர்ந்தெடுக்கவும்.', 'કૃપા કરી કોઈ માન્ય ફાઇલ ફોર્મેટ પસંદ કરો.', 'Wybierz prawidłowy format pliku.', 'Будь ласка, виберіть правильний формат файлу.', 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਫਾਇਲ ਫਾਰਮੈਟ ਚੁਣੋ.', 'Selectați un format de fișier valid.', 'ခိုင်လုံသောဖိုင် format ကိုရွေးချယ်ပါ။', 'Jọwọ yan ọna kika faili ti o wulo.', 'Da fatan za a zaɓi tsarin fayil mai aiki.'),
(467, 'select_a_file', 'Please select a valid file.', 'দয়া করে একটি ভ্যালিড ফাইল নির্বাচন করুন।', 'Seleccione un archivo válido.', 'الرجاء تحديد ملف صالح.', 'कृपया एक मान्य फ़ाइल चुनें', 'براہ کرم ایک درست فائل منتخب کریں.', '请选择一个有效的文件。', '有効なファイルを選択してください。', 'Selecione um arquivo válido.', 'Выберите действительный файл.', 'Veuillez sélectionner un fichier valide', '올바른 파일을 선택하십시오.', 'Bitte wählen Sie eine gültige Datei.', 'Si prega di selezionare un file valido.', 'โปรดเลือกไฟล์ที่ถูกต้อง', 'Kérjük, válasszon egy érvényes fájlt.', 'Selecteer alstublieft een geldig bestand.', 'Placere eligere file valet.', 'Silahkan pilih file yang valid.', 'Lütfen geçerli bir dosya seçin.', 'Επιλέξτε ένα έγκυρο αρχείο.', 'لطفا یک فایل معتبر را انتخاب کنید', 'Sila pilih fail yang sah.', 'దయచేసి చెల్లుబాటు అయ్యే ఫైల్ను ఎంచుకోండి.', 'செல்லுபடியாகும் கோப்பைத் தேர்ந்தெடுக்கவும்.', 'કૃપા કરી કોઈ માન્ય ફાઇલ પસંદ કરો.', 'Proszę wybrać poprawny plik.', 'Будь ласка, виберіть дійсний файл.', 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਫਾਇਲ ਚੁਣੋ.', 'Selectați un fișier valid.', 'ခိုင်လုံသောဖိုင်ကိုရွေးပေးပါ။', 'Jọwọ yan faili ti o wulo.', 'Da fatan a zaɓi fayil mai aiki.'),
(477, 'input_valid_amount', 'Please input valid amount.', 'দয়া করে ভ্যালিড পরিমাণ ইনপুট করুন।', 'Por favor ingrese un monto válido.', 'الرجاء إدخال مبلغ صالح.', 'कृपया वैध राशि इनपुट करें', 'براہ کرم ان پٹ درست رقم.', '请输入有效金额。', '有効な金額を入力してください。', 'Digite o valor válido.', 'Введите действительную сумму.', 'Veuillez entrer un montant valide', '유효한 금액을 입력하십시오.', 'Bitte geben Sie den gültigen Betrag ein.', 'Si prega di inserire un importo valido.', 'โปรดป้อนจำนวนที่ถูกต้อง', 'Kérem adja meg az érvényes összeget.', 'Voer een geldig bedrag in.', 'Initus placere ratum tantum.', 'Mohon masukan jumlah yang benar.', 'Lütfen geçerli tutarı giriniz.', 'Καταχωρίστε έγκυρο ποσό.', 'لطفا مقدار معتبر وارد کنید', 'Sila masukkan jumlah yang sah.', 'దయచేసి చెల్లని మొత్తం ఇన్పుట్ చేయండి.', 'தயவுசெய்து உள்ளீடு செல்லுபடியான தொகை.', 'કૃપા કરીને માન્ય રકમ ઇનપુટ કરો.', 'Wprowadź prawidłową kwotę.', 'Будь ласка, введіть дійсну суму.', 'ਕਿਰਪਾ ਕਰਕੇ ਯੋਗ ਰਕਮ ਇੰਪੁੱਟ ਕਰੋ.', 'Introduceți suma validă.', 'input ကိုတရားဝင်ငွေပမာဏပါ။', 'Jọwọ iye owo titẹ sii.', 'Da fatan shigar da adadin shigarwa.');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(552, 'input_valid_payment_setting', 'Please input correct payment setting.', 'প্লিজ ইনপুট কারেক্ট পেমেন্ট সেটিং।', 'Ingrese la configuración de pago correcta.', 'الرجاء إدخال إعداد الدفع الصحيح.', 'कृपया सही भुगतान सेटिंग इनपुट करें।', 'برائے مہربانی درست ادائیگی کی ترتیب میں ان پٹ', '请输入正确的付款设置。', '正しい支払い設定を入力してください。', 'Por favor, insira a configuração de pagamento correta.', 'Введите правильную настройку платежа.', 'Veuillez entrer le paramètre de paiement correct.', '올바른 지불 설정을 입력하십시오.', 'Bitte geben Sie die richtige Zahlungseinstellung ein.', 'Si prega di inserire le impostazioni di pagamento corrette.', 'โปรดป้อนการตั้งค่าการชำระเงินที่ถูกต้อง', 'Kérjük, adja meg a helyes fizetési beállítást.', 'Voer de juiste betalingsinstelling in.', 'Initus bene placent mercedem occasum.', 'Harap masukan pengaturan pembayaran yang benar.', 'Lütfen doğru ödeme ayarını giriniz.', 'Εισαγάγετε τη σωστή ρύθμιση πληρωμής.', 'لطفا تنظیم پرداخت درست را وارد کنید.', 'Sila masukkan tetapan pembayaran yang betul.', 'దయచేసి సరైన చెల్లింపు సెట్టింగ్ను ఇన్పుట్ చేయండి.', 'சரியான கட்டண அமைப்பை உள்ளிடுக.', 'કૃપા કરીને યોગ્ય ચુકવણી સેટિંગ ઇનપુટ કરો.', 'Wprowadź poprawne ustawienie płatności.', 'Будь ласка, введіть правильний параметр оплати.', 'ਕਿਰਪਾ ਕਰਕੇ ਸਹੀ ਭੁਗਤਾਨ ਸੈਟਿੰਗ ਇਨਪੁਟ ਕਰੋ.', 'Introduceți setarea de plată corectă.', 'input ကိုမှန်ကန်ငွေပေးချေမှု setting ကိုပါ။', 'Jọwọ ṣe ipinnu eto sisan ti o tọ.', 'Da fatan a shigar da saitin biya daidai.'),
(556, 'in_demo_db_backup', 'In demo database backp is disabled.', 'ডেমো ডেটাবেস ব্যাকআপে বন্ধ করা আছে।', 'En la copia de seguridad de la base de datos demo está desactivado', 'في النسخ الاحتياطي قاعدة البيانات التجريبي معطل.', 'डेमो डेटाबेस बैकअप में अक्षम है', 'ڈیمو ڈیٹا بیس کا بیک اپ غیر فعال ہے.', '在演示数据库中，备份被禁用。', 'デモでは、データベースのバックアップが無効になっています。', 'No backup do banco de dados demo está desativado.', 'В демонстрационной базе данных резервное копирование отключено.', 'Dans la sauvegarde de base de données démo est désactivé.', '데모에서 데이터베이스 백업이 비활성화되었습니다.', 'In der Demo ist die Datenbanksicherung deaktiviert.', 'Nel backup del database demo è disabilitato.', 'ในการสำรองฐานข้อมูลตัวอย่างถูกปิดใช้งาน', 'A demo adatbázis-mentés le van tiltva.', 'In demo-database is back-up uitgeschakeld.', 'In demo database tergum is disabled.', 'Dalam backup database demo dinonaktifkan.', 'Demo veritabanında yedekleme devre dışı bırakıldı.', 'Στην εφεδρική βάση δεδομένων επίδειξης είναι απενεργοποιημένη.', 'در نسخه پشتیبان تهیه نسخه ی نمایشی غیر فعال شده است.', 'Dalam sandaran pangkalan data demo dilumpuhkan.', 'డెమో డేటాబేస్ బ్యాకప్ డిసేబుల్.', 'டெமோ தரவுத்தள காப்பு உள்ள முடக்கப்பட்டுள்ளது.', 'ડેમો ડેટાબેસ બેકઅપ માં અક્ષમ છે.', 'W kopii zapasowej bazy danych demo jest wyłączone.', 'У демо-базі даних резервне копіювання вимкнено.', 'ਡੈਮੋ ਡਾਟਾਬੇਸ ਬੈਕਅੱਪ ਅਯੋਗ ਹੈ.', 'În baza de date demonstrativă, copia de rezervă este dezactivată.', 'သရုပ်ပြဒေတာဘေ့စမှာတော့ backup လုပ်ထားကိုပိတ်ထားသည်။', 'Ni ipamọ afẹyinti ipamọ jẹ alaabo.', 'A cikin dimbin bayanan bayanan yanar gizo an kashe.'),
(557, 'this_room_already_allocated', 'This room already allocated at this time.', 'এই রুমে ইতিমধ্যে এই সময়ে বরাদ্দ করা আছে।', 'Esta habitación ya está asignada en este momento.', 'هذه الغرفة المخصصة بالفعل في هذا الوقت.', 'इस कमरे में पहले से ही इस समय आवंटित किया गया है।', 'اس کمرے کو اس وقت پہلے مختص کردیا گیا ہے.', '这个房间已经在这个时候分配了。', 'この部屋はこの時点ですでに割り当てられています。', 'Este quarto já foi alocado neste momento.', 'Эта комната уже выделена в это время.', 'Cette pièce est déjà allouée à ce moment.', '이 방은 이미이 시간에 할당되었습니다.', 'Dieses Zimmer ist zu dieser Zeit bereits vergeben.', 'Questa stanza è già stata assegnata in questo momento.', 'ห้องนี้มีการจัดสรรไว้แล้วในขณะนี้', 'Ez a szoba már kiosztott ebben az időben.', 'Deze kamer is al toegewezen op dit moment.', 'Hic locus iam ante hoc tempus partita imperia.', 'Kamar ini sudah dialokasikan saat ini.', 'Bu oda zaten bu saatte tahsis edilmiş.', 'Αυτό το δωμάτιο έχει ήδη διατεθεί αυτή τη στιγμή.', 'این اتاق در حال حاضر اختصاص داده شده است.', 'Bilik ini sudah diperuntukkan pada masa ini.', 'ఈ గది ఇప్పటికే ఈ సమయంలో కేటాయించబడింది.', 'இந்த அறை ஏற்கனவே இந்த நேரத்தில் ஒதுக்கப்பட்டுள்ளது.', 'આ ખંડ પહેલેથી જ આ સમયે ફાળવવામાં આવ્યો છે.', 'Ten pokój został już przydzielony w tym momencie.', 'Цей номер уже виділений в цей час.', 'ਇਹ ਕਮਰਾ ਪਹਿਲਾਂ ਹੀ ਇਸ ਸਮੇਂ ਨਿਰਧਾਰਤ ਕੀਤਾ ਗਿਆ ਹੈ.', 'Această cameră deja alocată în acest moment.', 'ဒီအခန်းကပြီးသားဤအချိန်တွင်ခွဲဝေ။', 'Yara yii ti ṣetoto ni akoko yii.', 'Wannan dakin da aka riga aka ba shi a wannan lokaci.'),
(558, 'only_student_can_submit', 'Only student can submit assignment.', 'শুধুমাত্র ছাত্র  এসাইনমেন্ট জমা দিতে পারেন।', 'Solo el alumno puede enviar una tarea.', 'يمكن للطالب فقط تقديم المهمة.', 'केवल छात्र असाइनमेंट सबमिट कर सकते हैं', 'صرف طالب علم تفویض جمع کر سکتا ہے.', '只有学生可以提交作业。', '学生だけが課題を提出できます。', 'Somente o aluno pode enviar a atribuição.', 'Только ученик может подать задание.', 'Seul létudiant peut soumettre une affectation.', '학생 만 과제를 제출할 수 있습니다.', 'Nur der Student kann eine Aufgabe einreichen.', 'Solo lo studente può presentare un incarico.', 'เฉพาะนักเรียนเท่านั้นที่สามารถส่งงานได้', 'Csak a hallgató küldhet megbízást.', 'Alleen studenten kunnen een opdracht indienen.', 'Tantum submittere potest studiosus carminibus Marcianis.', 'Hanya siswa yang bisa menyerahkan tugas.', 'Sadece öğrenci ödevi gönderebilir.', 'Μόνο ο φοιτητής μπορεί να υποβάλει εργασία.', 'فقط دانش آموز می تواند تسلط را ارسال کند', 'Hanya pelajar sahaja yang boleh menghantar tugasan.', 'మాత్రమే విద్యార్థి అప్పగించిన సమర్పించవచ్చు.', 'மாணவர் மட்டுமே நியமிக்க முடியும்.', 'માત્ર વિદ્યાર્થી સોંપણી સબમિટ કરી શકે છે', 'Tylko uczeń może przesłać zadanie.', 'Тільки студент може подати завдання.', 'ਸਿਰਫ਼ ਵਿਦਿਆਰਥੀ ਹੀ ਕੰਮ ਸੌਂਪ ਸਕਦੇ ਹਨ.', 'Numai elevul poate trimite o sarcină.', 'သာကျောင်းသားတာဝန်ကျရာတင်ပြနိုင်ပါတယ်။', 'Ọmọde nikan le fi iṣẹ ranṣẹ.', 'Makarantar kawai za ta iya aikawa da aiki.'),
(559, 'exam_final_result', 'Exam final result', 'পরীক্ষার চূড়ান্ত ফলাফল', 'Resultado final del examen', 'النتيجة النهائية للامتحان', 'परीक्षा अंतिम परिणाम', 'امتحان حتمی نتیجہ', '考试最终结果', '試験の最終結果', 'Resultado final do exame', 'Окончательный результат экзамена', 'Résultat final de lexamen', '시험 최종 결과', 'Prüfung Endergebnis', 'Esame finale', 'ผลสอบสุดท้าย', 'Vizsga végeredmény', 'Eindresultaat examen', 'Effectus finalis nito', 'Hasil akhir ujian', 'Sınav nihai sonucu', 'Εξέταση τελικού αποτελέσματος', 'نتیجه نهایی آزمون', 'Keputusan akhir peperiksaan', 'తుది ఫలితం పరీక్ష', 'இறுதி முடிவு தேர்வு', 'પરીક્ષાની અંતિમ પરિણામ', 'Egzamin końcowy egzaminu', 'Останній результат іспиту', 'ਇਮਤਿਹਾਨ ਦੇ ਆਖਰੀ ਨਤੀਜੇ', 'Exam final final', 'စာမေးပွဲနောက်ဆုံးရလဒ်', 'Ipari ikẹhin ipari', 'Binciken ƙarshe na binciken'),
(560, 'required_field', 'This field is required.', 'ফিল্ড টি  অবশ্যই পূরণ করতে হবে।', 'Este campo es requerido.', 'هذه الخانة مطلوبه.', 'यह फ़ील्ड आवश्यक है.', 'اس کو پر کرنا ضروری ہے.', '这是必填栏。', 'この項目は必須です。', 'Este campo é obrigatório.', 'Это поле обязательно к заполнению.', 'Ce champ est requis.', '이 입력란은 필수 항목입니다.', 'Dieses Feld wird benötigt.', 'Questo campo è obbligatorio.', 'ต้องระบุข้อมูลนี้', 'Ez a mező kötelező.', 'Dit veld is verplicht.', 'Hic ager requiritur.', 'Bagian ini diperlukan.', 'Bu alan gereklidir.', 'Αυτό το πεδίο απαιτείται.', 'این فیلد مورد نیاز است', 'Bidang ini diperlukan.', 'ఈ ఖాళీని తప్పనిసరిగా పూరించవలెను.', 'இந்த புலம் தேவை.', 'આ ક્ષેત્ર જરૂરી છે.', 'To pole jest wymagane.', 'Це поле є обовязковим.', 'ਇਸ ਫੀਲਡ ਦੀ ਲੋੜ ਹੈ.', 'Acest câmp este obligatoriu.', 'ဤစာကွက်လပ်မှာဖြည့်ရန်လိုအပ်ပါသည်။', 'E ni lati se nkan si aye yi.', 'Wannan fillin ana bukatansa.'),
(561, 'enter_valid_email', 'Please enter a valid email address.', 'একটি ভ্যালিড ইমেইল ঠিকানা লিখুন।', 'Por favor, introduce una dirección de correo electrónico válida.', 'رجاء قم بإدخال بريد الكتروني صحيح.', 'कृपया एक वैध ई - मेल एड्रेस डालें।', 'برائے مہربانی قابل قبول ای میل ایڈریس لکھیں.', '请输入有效的电子邮件地址。', '有効なメールアドレスを入力してください。', 'Por favor insira um endereço de e-mail válido.', 'Пожалуйста, введите действительный адрес электронной почты.', 'Sil vous plaît, mettez une adresse email valide.', '유효한 이메일 주소를 입력하세요.', 'Bitte geben Sie eine gültige E-Mail-Adresse ein.', 'Si prega di inserire un indirizzo email valido.', 'กรุณาใส่อีเมล์ที่ถูกต้อง.', 'Kérjük valós e-mail címet adjon meg!', 'Gelieve een geldig e-mailadres in te geven.', 'Please enter inscriptio electronica valida.', 'Silakan isi alamat email.', 'Geçerli bir e.', 'Παρακαλώ εισάγετε μια έγκυρη διεύθυνση ηλεκτρονικού ταχυδρομείου.', 'لطفا یک آدرس ایمیل معتبر وارد کنید.', 'Sila masukkan alamat emel yang sah.', 'దయచేసి చెల్లుబాటు అయ్యే ఇమెయిల్ చిరునామాను నమోదు చేయండి.', 'சரியான மின்னஞ்சல் முகவரியை உள்ளிடவும்.', 'કૃપા કરી કોઈ માન્ય ઇમેઇલ સરનામું દાખલ કરો.', 'Proszę wpisać aktualny adres e-mail.', 'Будь ласка, введіть дійсну адресу електронної пошти.', 'ਇੱਕ ਜਾਇਜ ਈਮੇਲ ਪਤਾ ਦਰਜ ਕਰੋ.', 'Te rog introdu o adresa de email valida.', 'ကျေးဇူးပြ။ မှန်ကန်သောအီးမေးလ်လိပ်စာကိုထည့်သွင်းပါ။', 'Jowo fun fun wa ni imeli re to je otito.', 'Don Allah shigar da adireshin i-mel mai inganci.'),
(562, 'enter_valid_url', 'Please enter a valid URL.', 'একটি ভ্যালিড ইউআরএল প্রবেশ করুন।', 'Por favor introduzca un URL válido.', 'أدخل رابط صحيح من فضلك.', 'कृपया एक मान्य यूआरएल दर्ज कीजिए।', 'براہ کرم ایک درست URL درج کریں.', '请输入有效网址。', '有効なURLを入力してください。', 'Por favor, insira um URL válido.', 'Пожалуйста, введите корректный адрес.', 'Veuillez entrer une URL valide', '유효한 URL을 입력 해주세요.', 'Bitte geben Sie eine gültige URL ein.', 'Per favore, inserisci un URL valido.', 'โปรดป้อน URL ที่ถูกต้อง.', 'Kérem, írjon be egy érvényes url-t.', 'Voer een geldige URL in.', 'Please enter validum URL.', 'Masukkan URL yang valid', 'Lütfen geçerli bir adres girin.', 'Εισαγάγετε μια έγκυρη διεύθυνση URL.', 'لطفا یک نشانی وب معتبر وارد کنید.', 'Sila masukkan URL yang sah.', 'దయచేసి చెల్లుబాటు అయ్యే URL ను నమోదు చేయండి.', 'சரியான இணைய முகவரியினை பதிவு செய்யவும்.', 'કૃપા કરી માન્ય URL દાખલ કરો', 'Proszę podać poprawny adres URL.', 'Будь ласка, введіть дійсну URL-адресу.', 'ਇੱਕ ਵੈਧ URL ਦਾਖਲ ਕਰੋ.', 'Introduceți o adresă URL validă.', 'ခိုင်လုံသော URL ကိုရိုက်ထည့်ပေးပါ။', 'Jowo tẹ URL ti o wulo.', 'Da fatan a shigar da adireshin mai amfani.'),
(563, 'enter_valid_date', 'Please enter a valid date.', 'একটি ভ্যালিড তারিখ লিখুন দয়া করে।', 'Por favor introduzca una fecha valida.', 'ارجوك ادخل تاريخ صحيح.', 'कृपया एक मान्य तिथि प्रविष्ट करें।', 'براہ کرم ایک درست تاریخ درج کریں.', '请输入一个有效的日期。', '有効な日付を入力してください。', 'Por favor insira uma data válida.', 'Пожалуйста, введите правильную дату.', 'Veuillez entrer une date valide.', '유효한 날짜를 입력하십시오.', 'Bitte gib ein korrektes Datum an.', 'Per favore, inserisci una data valida.', 'โปรดป้อนวันที่ที่ถูกต้อง', 'Kérjük, adjon meg egy érvényes dátumot.', 'Vul alstublieft een geldige datum in.', 'Please enter validum diem.', 'Harap masukkan tanggal yang valid.', 'Lütfen geçerli bir tarih giriniz.', 'Παρακαλώ εισάγετε μία έγκυρη ημερομηνία.', 'لطفا یک تاریخ معتبر وارد کنید.', 'Sila masukkan tarikh yang sah.', 'దయచేసి చెల్లుబాటు అయ్యే తేదీని నమోదు చేయండి.', 'செல்லுபடியாகும் தேதி உள்ளிடுக.', 'કૃપા કરી માન્ય તારીખ દાખલ કરો.', 'Proszę wprowadź poprawną datę.', 'Будь ласка, введіть дійсну дату.', 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਵੈਧ ਤਾਰੀਖ ਦਰਜ ਕਰੋ', 'Vă rugăm să introduceți o dată validă.', 'မှန်ကန်သောရက်စွဲတစ်ခုရိုက်ထည့်ပေးပါ။', 'Jowo tẹ ọjọ ti o wulo.', 'Da fatan a shigar da kwanan wata mai aiki.'),
(564, 'enter_valid_number', 'Please enter a valid number.', 'দয়া করে একটি ভ্যালিড নম্বর লিখুন।', 'Por favor ingrese un número valido.', 'من فضلك أدخل رقما صالحا.', 'कृपया एक सही संख्या डालिये।', 'براہ مہربانی ایک درست نمبر درج کریں.', '请输入一个有效的号码。', '有効な数値を入力してください。', 'por favor insira um número válido.', 'Пожалуйста, введите корректное число.', 'Sil vous plait, entrez un nombre valide.', '올바른 번호를 입력하십시오.', 'Bitte geben Sie eine gültige Nummer ein.', 'Per favore, inserire un numero valido.', 'โปรดป้อนหมายเลขที่ถูกต้อง', 'Kérjük, adjon meg érvényes számot.', 'Voer alstublieft een geldig nummer in.', 'Please enter validum est numerus.', 'Masukkan nomor yang valid', 'Lütfen geçerli bir numara girin.', 'Παρακαλώ εισάγετε έναν έγκυρο αριθμό.', 'لطفا یک شماره تلفن معتبر وارد کنید.', 'Sila masukkan nombor yang sah.', 'దయచేసి చెల్లుబాటు అయ్యే సంఖ్యను నమోదు చేయండి.', 'சரியான எண்ணை உள்ளிடுக.', 'કૃપા કરી કોઈ માન્ય નંબર દાખલ કરો.', 'Proszę wprowadzić poprawny numer.', 'Введіть дійсний номер.', 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਪ੍ਰਮਾਣਿਕ ਸੰਖਿਆ ਦਰਜ ਕਰੋ.', 'Introduceți un număr valid.', 'ခိုင်လုံသောအရေအတွက်ကိုရိုက်ထည့်ပေးပါ။', 'Jowo tẹ nọmba nọmba kan.', 'Da fatan a shigar da lambar mai aiki.'),
(565, 'enter_only_digit', 'Please enter only digits.', 'অনুগ্রহ করে শুধুমাত্র সংখ্যা প্রবেশ করান।', 'Por favor ingrese solo dígitos.', 'الرجاء إدخال أرقام فقط.', 'कृपया केवल अंक दर्ज करें।', 'صرف ہندسوں درج کریں.', '请只输入数字。', '数字のみ入力して下さい。', 'Digite apenas dígitos.', 'Пожалуйста, вводите только цифры.', 'Merci de nentrer que des chiffres.', '숫자 만 입력하십시오.', 'Bitte gib nur Ziffern ein.', 'Per favore, inserisci solo cifre.', 'โปรดป้อนตัวเลขเท่านั้น', 'Kérem csak számjegyeket adjon meg.', 'Alleen cijfers invoeren a.u.b.', 'PDF nisi constet.', 'Harap masukkan angka saja.', 'Lütfen sadece rakam giriniz.', 'Παρακαλώ εισάγετε μόνο ψηφία.', 'لطفا فقط رقم را وارد کنید', 'Sila masukkan angka sahaja.', 'దయచేసి అంకెలు మాత్రమే నమోదు చేయండి.', 'இலக்கங்களை மட்டும் உள்ளிடுக.', 'કૃપા કરીને માત્ર અંકો દાખલ કરો', 'Wprowadź tylko cyfry.', 'Будь ласка, введіть лише цифри.', 'ਕਿਰਪਾ ਕਰਕੇ ਸਿਰਫ ਅੰਕ ਭਰੋ.', 'Te rog introdu doar cifre.', 'သာဂဏန်းရိုက်ထည့်ပေးပါ။', 'Jọwọ tẹ awọn nọmba nikan sii.', 'Da fatan a shigar da lambobi kawai.'),
(566, 'enter_same_value_again', 'Please enter the same value again.', 'আবার একই ভ্যালু লিখুন দয়া করে।', 'Por favor, introduzca el mismo valor de nuevo.', 'من فظلك ادخل نفس القيمة مرة أخرى.', 'कृपया फिर से वही संख्या डालिये।', 'ایک بار پھر ایک ہی قیمت درج کریں.', '请再次填写同等数值。', 'もう一度同じ値を入力してください。', 'Por favor entre com o mesmo valor novamente.', 'Повторите одно и то же значение.', 'Entrez à nouveau la même valeur sil vous plait.', '다시 동일한 값을 입력하십시오.', 'Bitte geben Sie den gleichen Wert erneut ein.', 'Si prega di inserire di nuovo lo stesso valore.', 'โปรดป้อนค่าเดิมอีกครั้ง', 'Kérem, írja be ugyanazt az értéket újra.', 'Voer dezelfde waarde opnieuw in.', 'PDF simile est.', 'Harap masukkan nilai yang sama lagi.', 'Lütfen aynı değeri tekrar giriniz.', 'Εισαγάγετε ξανά την ίδια τιμή.', 'لطفا مجددا همان مقدار را وارد کنید.', 'Sila masukkan nilai yang sama sekali lagi.', 'దయచేసి మళ్ళీ అదే విలువను నమోదు చేయండి.', 'மறுபடியும் அதே மதிப்பை அழுத்தவும்.', 'કૃપા કરીને ફરીથી સમાન મૂલ્ય દાખલ કરો.', 'Wprowadź ponownie tę samą wartość.', 'Будь ласка, введіть те саме значення знову.', 'ਕਿਰਪਾ ਕਰਕੇ ਦੁਬਾਰਾ ਉਹੀ ਮੁੱਲ ਦਰਜ ਕਰੋ.', 'Introduceți din nou aceeași valoare.', 'ထပ်တူညီတဲ့တန်ဖိုးကိုထည့်ပေးပါ။', 'Jowo tẹ iye kanna naa lẹẹkansi.', 'Da fatan a sake shigar da wannan darajar.'),
(567, 'pls_fix_this', 'Please fix this field.', 'এইটা ঠিক করুন।', 'Por favor arregla este campo.', 'الرجاء إصلاح هذا الحقل.', 'कृपया यह फ़ील्ड ठीक करें।', 'براہ مہربانی اس فیلڈ کو ٹھیک کریں.', '请修复这一块。', 'このフィールドを直してください。', 'Por favor, corrija este campo.', 'Исправьте это поле.', 'Veuillez corriger ce champ.', '이 항목을 수정하여주십시오.', 'Bitte repariere dieses Feld.', 'Si prega di correggere questo campo.', 'โปรดแก้ไขฟิลด์นี้', 'Kérlek, javítsd ki ezt a mezőt.', 'Corrigeer dit veld.', 'Placere figere ipsa cellula compleatur.', 'Perbaiki bidang ini', 'Bu alanı düzeltin lütfen.', 'Παρακαλώ διορθώστε αυτό το πεδίο.', 'لطفا این فیلد را اصلاح کنید', 'Sila betulkan medan ini.', 'దయచేసి ఈ ఫీల్డ్ను పరిష్కరించండి.', 'தயவுசெய்து இந்த களத்தை சரிசெய்யவும்.', 'કૃપા કરી આ ફીલ્ડને ઠીક કરો.', 'Proszę poprawić to pole.', 'Виправте це поле.', 'ਕਿਰਪਾ ਕਰਕੇ ਇਸ ਖੇਤਰ ਨੂੰ ਠੀਕ ਕਰੋ.', 'Vă rugăm să remediați acest câmp.', 'ဒီလယ်ကို fix ပေးပါ။', 'Jọwọ ṣatunkọ aaye yii.', 'Da fatan a gyara wannan filin.'),
(613, 'permission_denied', 'You have no permission to access this page.', 'আপনি এই পৃষ্ঠা অ্যাক্সেস করার অনুমতি নেই।', 'No tienes permiso para acceder a esta página.', 'ليس لديك إذن للدخول إلى هذه الصفحة.', 'आपको इस पृष्ठ को एक्सेस करने की अनुमति नहीं है।', 'آپ کو اس صفحہ تک رسائی حاصل کرنے کی اجازت نہیں ہے.', '您无权访问此页面。', 'このページにアクセスする権限はありません。', 'Você não tem permissão para acessar esta página.', 'У вас нет разрешения на доступ к этой странице.', 'Vous nêtes pas autorisé à accéder à cette page.', '이 페이지에 액세스 할 수있는 권한이 없습니다.', 'Sie haben keine Berechtigung, auf diese Seite zuzugreifen.', 'Non hai il permesso di accedere a questa pagina.', 'คุณไม่มีสิทธิ์เข้าถึงหน้านี้', 'Nincs engedélye ennek az oldalnak az elérésére.', 'U hebt geen toestemming om deze pagina te openen.', 'Nullas tibi accessere hanc paginam permission.', 'Anda tidak memiliki izin untuk mengakses halaman ini.', 'Bu sayfaya erişmek için herhangi bir iznin yok.', 'Δεν έχετε καμία άδεια πρόσβασης σε αυτήν τη σελίδα.', 'شما اجازه دسترسی به این صفحه ندارید.', 'Anda tidak mempunyai kebenaran untuk mengakses halaman ini.', 'ఈ పేజీని ప్రాప్యత చేయడానికి మీకు అనుమతి లేదు.', 'இந்தப் பக்கத்தை அணுக உங்களுக்கு அனுமதி இல்லை.', 'આ પૃષ્ઠને ઍક્સેસ કરવાની તમારી પાસે કોઈ પરવાનગી નથી', 'Nie masz uprawnień dostępu do tej strony.', 'Ви не маєте дозволу на доступ до цієї сторінки.', 'ਤੁਹਾਨੂੰ ਇਸ ਪੇਜ ਨੂੰ ਐਕਸੈਸ ਕਰਨ ਦੀ ਕੋਈ ਅਨੁਮਤੀ ਨਹੀਂ ਹੈ.', 'Nu aveți permisiunea de a accesa această pagină.', 'သင်ဤစာမကျြနှာကိုဝင်ရောက်ဖို့မခွင့်ပြုချက်ရှိသည်။', 'O ko ni igbanilaaye lati wọle si oju-ewe yii.', 'Ba ku da izini don samun damar wannan shafin.'),
(614, 'invalid_transaction_pls_try_again', 'Invalid transaction please try again.', 'ইনভ্যালিড লেনদেন আবার চেষ্টা করুন।', 'Transacción inválida, inténtalo de nuevo.', 'المعاملة غير صالحة يرجى المحاولة مرة أخرى.', 'अमान्य लेनदेन कृपया फिर से प्रयास करें', 'غلط ٹرانزیکشن براہ کرم دوبارہ کوشش کریں.', '无效的交易请再试一次。', 'トランザクションが無効です。もう一度お試しください。', 'Transação inválida, tente novamente.', 'Недействительные транзакции повторите попытку.', 'Transaction non valide, veuillez réessayer.', '잘못된 거래입니다. 다시 시도하십시오.', 'Ungültige Transaktion. Bitte versuche es erneut.', 'Transazione non valida, riprova.', 'ธุรกรรมไม่ถูกต้องโปรดลองอีกครั้ง', 'Érvénytelen ügylet, próbáld újra.', 'Ongeldige transactie probeer het opnieuw.', 'Aliquam nulla re.', 'Transaksi tidak valid silahkan dicoba lagi.', 'Geçersiz işlem lütfen tekrar deneyin.', 'Μη έγκυρη συναλλαγή δοκιμάστε ξανά.', 'معامله نامعتبر لطفا دوباره امتحان کنید', 'Transaksi tidak sah sila cuba lagi.', 'చెల్లని లావాదేవీ దయచేసి మళ్ళీ ప్రయత్నించండి.', 'தவறான பரிவர்த்தனை மீண்டும் முயற்சிக்கவும்.', 'અમાન્ય વ્યવહાર ફરીથી પ્રયાસ કરો.', 'Nieprawidłowa transakcja, spróbuj ponownie.', 'Недійсна транзакція. Повторіть спробу.', 'ਗਲਤ ਟ੍ਰਾਂਜੈਕਸ਼ਨ ਫਿਰ ਕੋਸ਼ਿਸ਼ ਕਰੋ.', 'Tranzacție nevalidă încercați din nou.', 'မှားနေသောငွေပေးငွေယူထပ်ကြိုးစားကြည့်ပါ။', 'Iṣowo idaniloju ko tọ gbiyanju tun gbiyanju.', 'Kasuwanci mara inganci a sake gwadawa.'),
(615, 'payment_success', 'Payment has been successfully.', 'পেমেন্ট সফলভাবে হয়েছে।', 'El pago ha sido exitoso.', 'تم الدفع بنجاح.', 'भुगतान सफलतापूर्वक किया गया है', 'ادائیگی کامیاب ہوگئی ہے.', '付款已成功。', '支払いは正常に完了しました。', 'O pagamento foi feito com sucesso.', 'Оплата прошла успешно.', 'Le paiement a été effectué avec succès.', '지불이 완료되었습니다.', 'Die Zahlung wurde erfolgreich ausgeführt.', 'Il pagamento è andato a buon fine.', 'การชำระเงินสำเร็จแล้ว', 'A kifizetés sikeresen megtörtént.', 'De betaling is succesvol verlopen.', 'Solucionis fuerit feliciter.', 'Pembayaran sudah berhasil', 'Ödeme başarıyla yapıldı.', 'Η πληρωμή ολοκληρώθηκε με επιτυχία.', 'پرداخت با موفقیت انجام شده است', 'Pembayaran telah berjaya.', 'చెల్లింపు విజయవంతంగా ఉంది.', 'கட்டணம் வெற்றிகரமாக உள்ளது.', 'ચુકવણી સફળતાપૂર્વક કરવામાં આવી છે', 'Płatność została pomyślnie.', 'Оплата була успішною.', 'ਭੁਗਤਾਨ ਸਫਲਤਾਪੂਰਵਕ ਕੀਤਾ ਗਿਆ ਹੈ', 'Plata a fost efectuată cu succes.', 'ငွေပေးချေမှုရမည့်အောင်မြင်စွာဖြစ်ခဲ့သည်။', 'Isanwo ti wa ni ifijišẹ.', 'Biyan bashi ya samu nasarar.'),
(616, 'payment_failed', 'Payment failed. Please try again.', 'পেমেন্ট ব্যর্থ হয়েছে. অনুগ্রহপূর্বক আবার চেষ্টা করুন।', 'Pago fallido. Inténtalo de nuevo.', 'عملية الدفع فشلت. حاول مرة اخرى.', 'भुगतान असफल हुआ। कृपया पुन: प्रयास करें।', 'ادائیگی ناکام ہوگئی. دوبارہ کوشش کریں.', '支付失败。 请再试一次。', '支払いに失敗しました。 もう一度お試しください。', 'Pagamento falhou. Por favor, tente novamente.', 'Платеж не прошел. Пожалуйста, попробуйте еще раз.', 'Paiement échoué. Veuillez réessayer.', '결제 실패. 다시 시도하십시오.', 'Bezahlung fehlgeschlagen. Bitte versuche es erneut.', 'Pagamento fallito. Per favore riprova.', 'การชำระเงินล้มเหลว กรุณาลองอีกครั้ง.', 'Fizetés meghiúsult. Kérlek próbáld újra.', 'Betaling mislukt. Probeer het opnieuw.', 'Payment defecit. Quaero, iterum conare.', 'Pembayaran gagal. Silahkan coba lagi', 'Ödeme başarısız. Lütfen tekrar deneyin.', 'Η πληρωμή απέτυχε. ΠΑΡΑΚΑΛΩ προσπαθησε ξανα.', 'پرداخت ناموفق. لطفا دوباره تلاش کنید.', 'Pembayaran gagal. Sila cuba lagi.', 'చెల్లింపు విఫలమైంది. దయచేసి మళ్లీ ప్రయత్నించండి.', 'கட்டணம் தோல்வியடைந்தது. தயவு செய்து மீண்டும் முயற்சிக்கவும்.', 'ચૂકવણી નિષ્ફળ. મહેરબાની કરીને ફરીથી પ્રયતન કરો.', 'Płatność nie powiodła się. Proszę spróbuj ponownie.', 'Оплата не виконана. Будь ласка спробуйте ще раз.', 'ਭੁਗਤਾਨ ਅਸਫਲ. ਮੁੜ ਕੋਸ਼ਿਸ ਕਰੋ ਜੀ.', 'Plata esuata. Vă rugăm să încercați din nou.', 'ငွေပေးချေမှုရမည့်မအောင်မြင်ခဲ့ပါဘူး။ ထပ်ကြိုးစားပါ။', 'Isanwo ti kuna. Jọwọ gbiyanju lẹẹkansi.', 'Baya ya biya. Da fatan a sake gwadawa.'),
(617, 'you_have_remain_character', 'You have remain character/ letter ', 'আপনার অক্ষর বাকি আছে।', 'Has quedado personaje / carta', 'لديك حرف / حرف', 'आप चरित्र / पत्र रह गए हैं', 'آپ کا کردار / خط باقی ہے', '你保持字符/字母', 'あなたは文字/文字のままです', 'Você permaneceu caráter / carta', 'У вас есть символ / письмо', 'Vous avez reste caractère / lettre', '문자 / 문자로 남았습니다.', 'Du hast Charakter / Brief behalten', 'Hai carattere / lettera rimasti', 'คุณยังมีตัวอักษร / ตัวอักษร', 'Ön továbbra is karakter / betű marad', 'Je bent karakter / letter gebleven', 'Vos autem manent ingenii / litterae', 'Anda tetap memiliki karakter / huruf', 'Karakter / mektup kalmışsın', 'Έχετε παραμείνει χαρακτήρα / γράμμα', 'شما شخصیت / نامه را باقی میگذارید', 'Anda mempunyai watak / huruf tetap', 'మీరు అక్షరం / అక్షరం', 'நீங்கள் எழுத்து / கடிதமாகவே இருக்க வேண்டும்', 'તમે અક્ષર / અક્ષર રહેલા છે', 'Pozostałeś postacią / literą', 'Ви залишитеся символом / листом', 'ਤੁਸੀਂ ਅੱਖਰ / ਪੱਤਰ ਰਹੇ ਹੋ', 'Tu rămâi caracter / scrisoare', 'သငျသညျဇာတ်ကောင် / အက္ခရာဆက်လက်တည်ရှိကြပါပြီ', 'O ti wa ni iwa / lẹta', 'Ka kasance hali / wasika'),
(618, 'running_year_instructions', 'You have to set running session year from general setting.', 'আপনাকে সাধারণ সেটিং থেকে চলমান সেশন  সেট করতে হবে।', 'Debe configurar el año de la sesión en ejecución desde la configuración general.', 'لديك لتعيين دورة العام من الإعداد العام.', 'आपको सामान्य सेटिंग से चालू सत्र वर्ष सेट करना होगा।', 'آپ کو سیشن سال چل رہا ہے جنرل ترتیب سے.', '您必须从常规设置中设置运行会话年。', '実行中のセッションの年は一般設定から設定する必要があります。', 'Você deve definir o ano da sessão em execução a partir da configuração geral.', 'Вы должны установить текущий год сеанса из общей настройки.', 'Vous devez définir lannée de la session en cours à partir du paramètre général.', '일반 세션 설정에서 실행 세션 연도를 설정해야합니다.', 'Sie müssen das laufende Jahr aus der allgemeinen Einstellung auswählen.', 'È necessario impostare lanno della sessione corrente dallimpostazione generale.', 'คุณต้องตั้งค่าปีที่ใช้งานจากการตั้งค่าทั่วไป', 'Be kell állítania a futó évfolyamot az általános beállításból.', 'U moet het lopende zittingsjaar van de algemene instelling instellen.', 'Vos have ut currit ab anno generalis sessioni occasum.', 'Anda harus mengatur running session year dari general setting.', 'Çalışan oturum yılını genel ayardan ayarlamanız gerekir.', 'Πρέπει να ρυθμίσετε το έτος λειτουργίας από τη γενική ρύθμιση.', 'شما باید سال اجرای سال را از تنظیم عمومی تنظیم کنید.', 'Anda perlu menetapkan tahun sesi berjalan dari tetapan umum.', 'మీరు సాధారణ సెట్టింగు నుండి సెషన్ సంవత్సరాన్ని అమర్చాలి.', 'பொது அமைப்பிலிருந்து அமர்வு ஆண்டு இயங்க வேண்டும்.', 'તમારે સામાન્ય સેટિંગથી ચાલુ સત્ર વર્ષ સેટ કરવું પડશે.', 'Musisz ustawić rok sesji na podstawie ustawień ogólnych.', 'Ви повинні встановити поточний рік сеансу за загальним налаштуванням.', 'ਤੁਹਾਨੂੰ ਸਧਾਰਣ ਸੈਟਿੰਗ ਤੋਂ ਚਾਲੂ ਸੈਸ਼ਨ ਵਰਜ਼ਨ ਸੈਟ ਕਰਨਾ ਹੋਵੇਗਾ.', 'Trebuie să setați anul de desfășurare a sesiunii din setarea generală.', 'သငျသညျယေဘုယျ setting ကိုမှ session တစ်နှစ် running တင်ထားရန်ရှိသည်။', 'O ni lati seto ọdun igbasẹ nṣiṣẹ lati ipo gbogbogbo.', 'Dole ne ku saita shekara ta gudu daga saiti na gaba.'),
(619, 'privilege_not_setting', 'The Role Permission for this user not yet set.', 'এই ব্যবহারকারীর জন্য ভূমিকা অনুমতি এখনও সেট করা হয়নি।', 'El permiso de función para este usuario aún no se ha establecido.', 'لم يتم تعيين إذن الدور لهذا المستخدم بعد.', 'इस उपयोगकर्ता के लिए भूमिका अनुमति अभी तक सेट नहीं है', 'اس صارف کیلئے ابھی تک کردار کی اجازت نہیں ہے.', '此用户的角色权限尚未设置。', 'このユーザーのロール権限はまだ設定されていません。', 'A Permissão de Função para este usuário ainda não está configurado.', 'Разрешение роли для этого пользователя еще не установлено.', 'Lautorisation de rôle pour cet utilisateur nest pas encore définie.', '이 사용자에 대한 역할 권한이 아직 설정되지 않았습니다.', 'Die Rollenberechtigung für diesen Benutzer wurde noch nicht festgelegt.', 'Autorizzazione ruolo per questo utente non ancora impostato.', 'สิทธิ์การใช้งานบทบาทสำหรับผู้ใช้รายนี้ยังไม่ได้ตั้งค่า', 'A szerepkör engedélye erre a felhasználóra még nincs beállítva.', 'De rolmachtiging voor deze gebruiker is nog niet ingesteld.', 'De munere licentiam concedere quod nondum user set.', 'Izin Peran untuk pengguna ini belum ditetapkan.', 'Bu kullanıcı için Role Permission henüz ayarlanmadı.', 'Η άδεια ρόλου για αυτόν το χρήστη δεν έχει οριστεί ακόμα.', 'مجوز نقش برای این کاربر هنوز تعیین نشده است.', 'Kebenaran Peranan untuk pengguna ini belum ditetapkan.', 'ఈ వినియోగదారు కోసం రోల్ అనుమతి ఇంకా సెట్ చేయబడలేదు.', 'இந்த பயனருக்கான ரோல் அனுமதி இன்னும் அமைக்கப்படவில்லை.', 'આ વપરાશકર્તા માટે રોલ પરવાનગી હજુ સુધી સેટ નથી.', 'Uprawnienia roli dla tego użytkownika jeszcze nie zostały ustawione.', 'Рольовий дозвіл для цього користувача ще не встановлено.', 'ਇਸ ਉਪਭੋਗਤਾ ਲਈ ਭੂਮਿਕਾ ਦੀ ਅਨੁਮਤੀ ਅਜੇ ਵੀ ਸੈਟ ਨਹੀਂ ਕੀਤੀ ਗਈ.', 'Permisiunea de rol pentru acest utilizator nu a fost încă setată.', 'သေးမသတ်မှတ်ဒီအသုံးပြုသူများအတွက်အခန်းက္ပခွင့်ပြုချက်။', 'Igbese Ilana fun olumulo yii ko sibẹsibẹ ṣeto.', 'Ƙungiyar izinin mai amfani ba tukuna an saita ba.'),
(620, 'add_syllabus_instruction', 'Please add academic year before create syllabus.', 'পাঠ্যসূচী তৈরি করার আগে অনুগ্রহপূর্বক  একাডেমিক বছর অ্যাড করুন।', 'Agregue el año académico antes de crear el plan de estudios.', 'يرجى إضافة العام الدراسي قبل إنشاء المنهج.', 'पाठ्यक्रम बनाने से पहले शैक्षणिक वर्ष जोड़ें।', 'نصاب کو تخلیق کرنے سے پہلے تعلیمی سال شامل کریں.', '请在创建教学大纲之前添加学年。', 'シラバスを作成する前に学年を追加してください。', 'Por favor, adicione ano acadêmico antes de criar programas.', 'Пожалуйста, добавьте учебный год до создания учебного плана.', 'Veuillez ajouter une année académique avant de créer un syllabus.', '교과를 만들기 전에 학년을 추가하십시오.', 'Bitte fügen Sie akademisches Jahr vor dem Erstellen des Lehrplans hinzu.', 'Per favore aggiungi lanno accademico prima di creare il programma.', 'กรุณาเพิ่มปีการศึกษาก่อนที่จะสร้างหลักสูตร', 'Kérjük, add meg az egyetemi évet a tanterv létrehozása előtt.', 'Voeg academiejaar toe voordat u een syllabus maakt.', 'Anno ante partum aliter digerere velit academic add.', 'Harap tambahkan tahun akademik sebelum membuat silabus.', 'Müfredat oluşturmadan önce lütfen akademik yıl ekleyin.', 'Παρακαλείσθε να προσθέσετε ακαδημαϊκό έτος πριν δημιουργήσετε το αναλυτικό πρόγραμμα.', 'لطفا سال تحصیلی را قبل از ایجاد برنامه درسی اضافه کنید.', 'Sila tambah tahun akademik sebelum membuat sukatan pelajaran.', 'దయచేసి సిలబస్ సృష్టించడానికి ముందు విద్యాసంవత్సరం జోడించండి.', 'பாடத்திட்டத்தை உருவாக்க முன் கல்வி ஆண்டு சேர்க்கவும்.', 'અભ્યાસક્રમ બનાવવા પહેલાં શૈક્ષણિક વર્ષ ઉમેરો.', 'Dodaj rok akademicki przed utworzeniem sylabusa.', 'Будь ласка, додайте навчальний рік, перш ніж створювати навчальний план.', 'ਕਿਰਪਾ ਕਰਕੇ ਸਿਲੇਬਸ ਬਣਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਅਕਾਦਮਿਕ ਸਾਲ ਜੋੜੋ', 'Vă rugăm să adăugați un an universitar înainte de a crea programa.', 'သင်ရိုးညွှန်းတမ်းဖန်တီးမတိုင်မီပညာသင်နှစ် add ပေးပါ။', 'Jowo fi ọjọ-ẹkọ ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-ẹkọ-', 'Da fatan za a kara shekara ta ilimi kafin ƙirƙirar salo.'),
(621, 'academic_year_setting', 'Please setting academic year.', 'একাডেমিক বছর সেটিং করুন।', 'Por favor, ajuste el año académico.', 'يرجى تحديد السنة الدراسية.', 'कृपया शैक्षणिक वर्ष सेट करना', 'برائے مہربانی تعلیمی سال قائم کریں.', '请设置学年。', '学年を設定してください。', 'Por favor, marque o ano lectivo.', 'Укажите учебный год.', 'Veuillez définir lannée académique.', '학년을 정하십시오.', 'Bitte legen Sie das akademische Jahr fest.', 'Si prega di fissare lanno accademico.', 'โปรดตั้งปีการศึกษา', 'Kérjük, állíts be a tanévre.', 'Gelieve het academiejaar in te stellen.', 'Academici ponere placuit.', 'Tolong atur tahun akademik.', 'Lütfen akademik yılı ayarlayın.', 'Παρακαλώ ορίστε ακαδημαϊκό έτος.', 'لطفا سال تحصیلی را تنظیم کنید.', 'Sila tentukan tahun akademik.', 'దయచేసి విద్యా సంవత్సరాన్ని ఏర్పాటు చేయండి.', 'கல்வி ஆண்டு அமைக்கவும்.', 'શૈક્ષણિક વર્ષ સેટ કરો.', 'Proszę ustawić rok akademicki.', 'Вкажіть навчальний рік.', 'ਕਿਰਪਾ ਕਰਕੇ ਅਕਾਦਮਿਕ ਸਾਲ ਸੈੱਟ ਕਰੋ.', 'Vă rugăm să setați anul universitar.', 'ပညာသင်နှစ် setting ပါ။', 'Jọwọ ṣe eto eto ẹkọ.', 'Don Allah a kafa shekara ta ilimi.'),
(622, 'add_routine_instruction', 'Must be good combination (between room, time, teacher, day & subject) for routine.', 'রুটিনের জন্য ভালো সমন্বয় (রুম, সময়, শিক্ষক, দিন এবং বিষয় মধ্যে) হতে হবে।', 'Debe ser una buena combinación (entre la habitación, el tiempo, el maestro, el día y el tema) para la rutina.', 'يجب أن تكون تركيبة جيدة (بين الغرفة والوقت والمعلم واليوم والموضوع) للروتين.', 'दिनचर्या के लिए अच्छे संयोजन (कमरे, समय, शिक्षक, दिन और विषय के बीच) होना चाहिए।', 'معمول کے لئے اچھا مجموعہ (کمرے، وقت، استاد، دن اور موضوع کے درمیان) ہونا ضروری ہے.', '必须是常规的良好组合（房间，时间，老师，日期和主题）。', 'ルーチンのためには、（部屋、時間、教師、日、テーマの間の）良い組み合わせでなければなりません。', 'Deve ser uma boa combinação (entre sala, tempo, professor, dia e assunto) para a rotina.', 'Должна быть хорошая комбинация (между комнатой, временем, учителем, днем и субъектом) для рутины.', 'Doit être une bonne combinaison (entre la pièce, lheure, lenseignant, le jour et le sujet) pour la routine.', '평소에는 (방, 시간, 선생님, 낮 과목 사이에) 좋은 조합이어야합니다.', 'Muss eine gute Kombination sein (zwischen Raum, Zeit, Lehrer, Tag und Thema) für die Routine.', 'Deve essere una buona combinazione (tra stanza, orario, insegnante, giorno e materia) per la routine.', 'ต้องเป็นชุดที่ดี (ระหว่างห้องเวลาครูวันและเรื่อง) เป็นประจำ', 'Jó kombinációnak kell lennie (helyiség, idő, tanár, nap és téma között) a rutinhoz.', 'Moet een goede combinatie zijn (tussen kamer, tijd, docent, dag en onderwerp) voor routine.', 'Bonum est combination (inter locus, tempus, magister, & re die), pro exercitatione.', 'Harus kombinasi yang baik (antara ruang, waktu, guru, hari & subjek) untuk rutinitas.', 'Rutin için iyi bir kombinasyon (oda, zaman, öğretmen, gün ve konu arasında) olmalı.', 'Πρέπει να είναι καλός συνδυασμός (μεταξύ δωματίου, χρόνου, καθηγητή, μέρα & θέμα) για ρουτίνα.', 'ترکیب مناسب (بین اتاق، زمان، معلم، روز و موضوع) باید به صورت منظم باشد.', 'Harus menjadi kombinasi yang baik (antara bilik, masa, guru, hari & mata pelajaran) untuk rutin.', 'రొటీన్ కోసం మంచి కలయిక (గది, సమయం, గురువు, రోజు & విషయం మధ్య) ఉండాలి.', 'வழக்கமான கலவையாக இருக்க வேண்டும் (அறைக்கு, நேரம், ஆசிரியர், நாள் & பொருள்).', 'નિત્યક્રમ માટે સારા સંયોજન (ખંડ, સમય, શિક્ષક, દિવસ અને વિષય વચ્ચે) હોવો જોઈએ.', 'Musi to być dobra kombinacja (między pokojem, czasem, nauczycielem, dniem i tematem) dla rutyny.', 'Повинно бути гарною комбінацією (між кімнатою, часом, вчителем, днем та предметом) для звичайної роботи.', 'ਰੁਟੀਨ ਲਈ ਵਧੀਆ ਮਿਸ਼ਰਨ ਹੋਣਾ (ਕਮਰੇ, ਸਮੇਂ, ਅਧਿਆਪਕ, ਦਿਨ ਅਤੇ ਵਿਸ਼ੇ ਵਿਚਕਾਰ).', 'Trebuie să fie o combinație bună (între cameră, timp, profesor, zi și subiect) pentru rutină.', 'လုပ်ရိုးလုပ်စဉ်အဘို့ (အခန်းတစ်ခန်းအကြား, အချိန်, ဆရာ, နေ့ & ဘာသာရပ်) ကောင်းသောပေါင်းစပ်ဖြစ်ရမည်။', 'Gbọdọ jẹ apapo ti o dara (laarin yara, akoko, olukọ, ọjọ & akori) fun iṣiro.', 'Dole ne ya kasance haɗin hade (tsakanin ɗaki, lokaci, malami, rana da batun) don na yau da kullum.'),
(623, 'exam_attendance_instruction', 'Please create exam schedule for this Exam, Class, Section & Subject.', 'এই পরীক্ষা, ক্লাস, সেকশন ও বিষয়ের জন্য পরীক্ষার সময়সূচী তৈরি করুন।', 'Por favor, cree un cronograma de exámenes para este examen, clase, sección y tema.', 'يرجى إنشاء جدول الامتحانات لهذا الامتحان، فئة، قسم والموضوع.', 'कृपया इस परीक्षा, कक्षा, धारा और विषय के लिए परीक्षा कार्यक्रम बनाएं।', 'برائے مہربانی اس امتحان، کلاس، سیکشن اور موضوع کیلئے امتحان شیڈول بنائیں.', '请为此考试，班级，科目和科目创建考试时间表。', 'この試験、クラス、セクション＆サブジェクトの試験スケジュールを作成してください。', 'Crie um cronograma de exame para este Exame, Classe, Seção e Assunto.', 'Создайте расписание экзаменов для этого экзамена, класса, раздела и темы.', 'Veuillez créer un horaire dexamen pour cet examen, classe, section et sujet.', '이 시험, 클래스, 섹션 및 제목에 대한 시험 일정을 작성하십시오.', 'Bitte erstellen Sie einen Prüfungsplan für diese Prüfung, Klasse, Abschnitt und Thema.', 'Si prega di creare un programma desame per questo esame, classe, sezione e argomento.', 'โปรดสร้างกำหนดการสอบสำหรับการสอบวิชา Class, Section & Subject', 'Kérjük, hozzon létre vizsgaütemezést ehhez a vizsgahoz, osztályhoz, szekcióhoz és tárgyhoz.', 'Maak een examenrooster voor dit examen, de cursus, sectie en onderwerp.', 'Placere creare nito schedule hoc IV: I classis, & Art subiectum.', 'Tolong buat jadwal ujian untuk Ujian, Kelas, Seksi & Subjek ini.', 'Lütfen bu Sınav, Ders, Bölüm ve Konunun sınav takvimini oluşturun.', 'Δημιουργήστε το πρόγραμμα εξετάσεων για αυτήν την εξέταση, κλάση, ενότητα & θέμα.', 'لطفا برنامه آزمون برای این آزمون، کلاس، بخش و موضوع ایجاد کنید.', 'Sila buat jadual peperiksaan untuk Peperiksaan, Kelas, Bahagian & Subjek ini.', 'ఈ పరీక్ష, తరగతి, విభాగం & విషయం కోసం పరీక్ష షెడ్యూల్ సృష్టించండి.', 'இந்தப் பரீட்சை, வகுப்பு, பிரிவு மற்றும் பாடநெறிக்கான பரீட்சை அட்டவணையை உருவாக்கவும்.', 'આ પરીક્ષા, વર્ગ, વિભાગ અને વિષય માટે પરીક્ષા શેડ્યૂલ બનાવો.', 'Utwórz harmonogram egzaminów dla tego egzaminu, klasy, sekcji i przedmiotu.', 'Будь ласка, створіть графік іспитів для цього іспиту, класу, розділу та теми.', 'ਕਿਰਪਾ ਕਰਕੇ ਇਸ ਪ੍ਰੀਖਿਆ, ਕਲਾਸ, ਭਾਗ ਅਤੇ ਵਿਸ਼ੇ ਦੇ ਲਈ ਪ੍ਰੀਖਿਆ ਸ਼ਡਿਊਲ ਬਣਾਓ.', 'Vă rugăm să creați un program de examen pentru acest examen, clasă, secțiune și subiect.', ', အတန်းအစား, ပုဒ်မ & အကြောင်းအရာကဒီစာမေးပွဲအဘို့အစာမေးပွဲအချိန်ဇယားကိုဖန်တီးပေးပါ။', 'Jowo ṣẹda iṣeto ayẹwo fun Akọwo yii, Kilasi, Abala & Koko.', 'Don Allah a halicci jimillar jarrabawar wannan jarrabawar, Class, Sashe & Sashe.'),
(624, 'exam_mark_instruction', 'Please ensure Exam Schedule and Exam Attendance before Exam Mark Entry.', 'পরীক্ষা মার্ক এণ্ট্রি আগে পরীক্ষার সময়সূচী এবং পরীক্ষা উপস্থিতি নিশ্চিত করুন।', 'Por favor asegúrese de Horario de Examen y Asistencia al Examen antes de la Entrada de la Marca de Examen.', 'يرجى التأكد من جدول الامتحانات وحضور الامتحان قبل دخول علامة الامتحان.', 'परीक्षा मार्क एंट्री से पहले परीक्षा अनुसूची और परीक्षा उपस्थिति सुनिश्चित करें।', 'امتحان مارک انٹری سے پہلے امتحان شیڈول اور امتحان حاضری کو یقینی بنائیں.', '入学考试前，请确保考试时间表和考试出勤。', '試験のマーク入力の前に試験スケジュールと試験出席を確認してください。', 'Por favor, assegure o horário de exame e a participação no exame antes da entrada na marca do exame.', 'Пожалуйста, убедитесь, что экзаменационные экзамены и экзамен посещаемости до сдачи экзамена Марк.', 'Veuillez vous assurer de respecter le calendrier des examens et la participation aux examens avant lentrée à lexamen.', '시험 마크 입력 전에 시험 일정과 시험 출석을 확인하십시오.', 'Bitte stellen Sie sicher, dass der Prüfungsplan und die Anwesenheit der Prüfung vor der Eintragung der Prüfungsnote eingehalten werden.', 'Si prega di assicurare la pianificazione degli esami e la frequenza degli esami prima delliscrizione.', 'โปรดตรวจสอบตารางการสอบและการเข้าร่วมการสอบก่อนการสอบของ Mark Entry', 'Kérjük, győződjön meg arról, hogy az Exam Mark Entry és Exam Attendance Exam Mark Entry előtt van.', 'Zorg ervoor dat het examenrooster en het examen aanwezig zijn vóór de inzending van het examen.', 'Test Morbi rhoncus velit, ut et IV ante Attendance Mark Test Entry.', 'Harap pastikan Jadwal Ujian dan Ujian Kehadiran sebelum Entri Tanda Ujian.', 'Sınav işareti girmeden önce lütfen Sınav Takvimi ve Sınav Ekibinden emin olunuz.', 'Βεβαιωθείτε ότι έχετε προγραμματίσει τις εξετάσεις και την εξέταση πριν την εγγραφή.', 'لطفا قبل از امتحان علامت گذاری به عنوان خوانده شده تست برنامه آزمون و حضور در آزمون را تضمین کنید.', 'Sila pastikan Jadual Peperiksaan dan Kehadiran Peperiksaan sebelum Kemasukan Tanda Peperiksaan.', 'పరీక్షా పరీక్ష షెడ్యూల్ మరియు పరీక్షా హాజరు నిర్ధారించడానికి దయచేసి మార్క్ ఎంట్రీ పరీక్ష.', 'பரீட்சைக்கு முன் தேர்வுப் பரீட்சை மற்றும் பரீட்சை பெறுதல் ஆகியவற்றை உறுதிப்படுத்துக.', 'પરીક્ષા માર્ક એન્ટ્રી પહેલાં પરીક્ષાની સૂચિ અને પરીક્ષા હાજરી નક્કી કરો.', 'Należy upewnić się, że harmonogram egzaminów i udział w egzaminach poprzedzą wejście do egzaminu.', 'Будь ласка, вкажіть час іспиту і відвідуваність іспиту перед початком вступки до іспиту.', 'ਐਜੂਕੇਸ ਮਾਰਕ ਐਂਟਰੀ ਤੋਂ ਪਹਿਲਾਂ ਪ੍ਰੀਖਿਆ ਸ਼ਡਿਊਲ ਅਤੇ ਪ੍ਰੀਖਿਆ ਹਾਜ਼ਰੀ ਯਕੀਨੀ ਬਣਾਉ.', 'Asigurați-vă că ați verificat programul de examen și examenul înainte de înscrierea în examen.', 'စာမေးပွဲမာကု Entry မတိုင်မီစာမေးပွဲအချိန်ဇယားနှင့်စာမေးပွဲတက်ရောက်သေချာပါစေ။', 'Jọwọ ṣe idaniloju Akoko Idaduro ati Akokọ Ibẹwo ṣaaju titẹ Akọsilẹ Akọsilẹ.', 'Da fatan a tabbatar da Gwargwadon Binciken da Jarraba Tambaya kafin jarrabawar Mark Mark.'),
(625, 'mark_sheet_instruction', 'Please ensure Exam Attendance and Exam Mark to find Mark Sheet.', 'মার্ক শিট খুঁজে পেতে পরীক্ষার এ্যাটেনডেন্স এবং পরীক্ষা মার্ক নিশ্চিত করুন।', 'Asegúrate de que la Asistencia al examen y la Marca del examen encuentren la Hoja de calificaciones.', 'يرجى التأكد من امتحان الحضور وامتحان علامة لإيجاد علامة ورقة.', 'मार्क शीट को खोजने के लिए परीक्षा उपस्थिति और परीक्षा अंक को सुनिश्चित करें', 'براہ کرم مارک شیٹ کو تلاش کرنے کے لئے امتحان حاضری اور امتحان مارک کو یقینی بنائیں.', '请确保考试出席和考试标志找到标记表。', 'マークシートを見つけるには、試験出席と試験マークを確認してください。', 'Certifique-se da presença do exame e da marca do exame para encontrar a folha de marca.', 'Пожалуйста, убедитесь, что экзамен посещаемости и экзамен Марк, чтобы найти Mark Sheet.', 'Veuillez vous assurer de la présence à lexamen et de la note dexamen pour trouver la feuille de notes.', '마크 시트를 찾으려면 시험 출석과 시험 마크를 확인하십시오.', 'Bitte stellen Sie sicher, dass die Prüfungsteilnahme und die Prüfungsnote Mark-Sheet finden.', 'Si prega di assicurare la partecipazione agli esami e il marchio dellesame per trovare il foglio dei voti.', 'โปรดตรวจสอบว่ามีผู้เข้าสอบและเครื่องหมายสอบเพื่อหา Mark Sheet', 'Kérjük, hogy az Exam Attendance és a Exam Mark-ot találja meg a Mark Sheet-et.', 'Zorg ervoor dat u een examenformulier en een examencertificaat aantreft om het beoordelingsformulier te vinden.', 'Placere operam ad inveniendum Mark Mark Chapter OMNIBUS June IV Sheet.', 'Harap pastikan Ujian Kehadiran dan Tanda Ujian untuk menemukan Lembar Tandai.', 'Marka Belgesini bulmak için lütfen Sınav Devamını ve Sınav İşaretini sağlayın.', 'Βεβαιωθείτε ότι έχετε παρακολουθήσει την εξέταση και εξετάστε το για να βρείτε το φύλλο σημείωσης.', 'لطفا از بازدید کننده امتحان و علامت آزمون اطمینان حاصل کنید تا علامت ورق را پیدا کنید.', 'Sila pastikan Kehadiran Peperiksaan dan Ujian Peperiksaan untuk mencari Mark Sheet.', 'మార్క్ షీట్ను కనుగొనడానికి పరీక్షా హాజరు మరియు పరీక్షా మార్క్ ను నిర్ధారించుకోండి.', 'மார்க் தாள் கண்டுபிடிக்க தேர்ச்சி மற்றும் தேர்வு மார்க் உறுதி செய்யவும்.', 'માર્ક શીટ શોધવા માટે પરીક્ષાની હાજરી અને પરીક્ષા માર્ક કરો.', 'Prosimy o upewnienie się, że obecność na egzaminie i znak egzaminu jest zaznaczona.', 'Будь ласка, впевніться, що відвідувачі іспитів і екзаменаційні квитки знайдете листівки.', 'ਕਿਰਪਾ ਕਰਕੇ ਮਾਰਕ ਸ਼ੀਟ ਨੂੰ ਲੱਭਣ ਲਈ ਪ੍ਰੀਖਿਆ ਹਾਜ਼ਰੀ ਅਤੇ ਪ੍ਰੀਖਿਆ ਪੱਤਰ ਨੂੰ ਯਕੀਨੀ ਬਣਾਓ.', 'Asigurați-vă că ați participat la examen și la examen pentru a găsi o coală Mark.', 'မာကုစာရွက်ရှာတွေ့မှစာမေးပွဲတက်ရောက်ခြင်းနှင့်စာမေးပွဲမာကုသေချာပါစေ။', 'Jowo rii daju pe idaduro Ijadii ati Ṣayẹwo Marku lati wa Mark Sheet.', 'Da fatan a tabbatar da Hannun Binciken da Takaddun Mark don neman Mark Sheet.'),
(626, 'exam_result_instruction', 'Please ensure Exam Mark and Exam Attendance before Final Mark Entry.', 'চূড়ান্ত মার্ক এণ্ট্রি আগে পরীক্ষা মার্ক এবং পরীক্ষার উপস্থিতি নিশ্চিত করুন।', 'Por favor, asegúrese de la marca de examen y la asistencia al examen antes de la entrada de la marca final.', 'يرجى التأكد من امتحان علامة وامتحان الحضور قبل علامة النهائي الدخول.', 'अंतिम मार्क प्रविष्टि से पहले परीक्षा मार्क और परीक्षा उपस्थिति सुनिश्चित करें', 'فائن مارک انٹری سے پہلے امتحان کے نشان اور امتحان کی حاضری یقینی بنائیں.', '请在最终标记输入前确保考试标志和考试出勤。', '最終マーク記入前に試験マークと試験出席を確認してください。', 'Certifique-se de Exame da marca e da presença do exame antes da entrada na marca final.', 'Пожалуйста, убедитесь, что экзамен и участие в экзамене перед окончательной записью.', 'Sil vous plaît assurez-vous dexamen et de présence à lexamen avant lentrée de la note finale.', '최종 점수 입력 전에 시험 점수와 시험 출석을 확인하십시오.', 'Bitte stellen Sie sicher, dass Sie die Prüfung und die Teilnahme an der Prüfung vor der endgültigen Noteneingabe erhalten.', 'Si prega di assicurare la certificazione degli esami e la partecipazione agli esami prima della registrazione del voto finale.', 'โปรดตรวจสอบให้แน่ใจว่ามีผู้เข้าร่วมการสอบและการสอบเข้าร่วมการแข่งขันก่อนเข้าร่วมการแข่งขัน Final Mark Entry', 'Kérjük, győződjön meg az Exam Mark és Exam Attendance előtt a végső belépési bejegyzést.', 'Zorg ervoor dat het examen en het examen aanwezig zijn vóór de definitieve inschrijving.', 'Mark quaeso ensure nito et Finalis nito apud Attendance Mark Entry.', 'Harap pastikan Tanda Ujian dan Ujian Kehadiran sebelum Entri Mark Akhir.', 'Nihai İşaret Girişinden önce lütfen Sınav İmzası ve Sınav Ekibinden emin olun.', 'Παρακαλείσθε να βεβαιωθείτε για την εξέταση και την εξέταση πριν την τελική εγγραφή.', 'لطفا قبل از ورود به نشریه نهایی علامت گذاری آزمون و حضور آزمون را تضمین کنید.', 'Sila pastikan Peperiksaan dan Kehadiran Peperiksaan sebelum Kemasukan Tanda Akhir.', 'ఫైనల్ మార్క్ ఎంట్రీకి ముందు పరీక్ష మార్క్ మరియు పరీక్షా హాజరును నిర్ధారించుకోండి.', 'இறுதியாண்டு மார்க் நுழைவுமுறையில் தேர்வுப் பரீட்சை மற்றும் தேர்வுப் பணிகளை உறுதி செய்யுங்கள்.', 'અંતિમ માર્ક એન્ટ્રી પહેલાં પરીક્ષા માર્ક અને પરીક્ષાની હાજરી નિશ્ચિત કરો.', 'Prosimy o upewnienie się, że Egzamin i Egzaminacja Egzaminu odbywają się przed Ostatecznym Wpisem.', 'Ознайомтеся з учасниками іспитів та учасниками іспитів перед початком вступного запису.', 'ਕਿਰਪਾ ਕਰਕੇ ਅੰਤਮ ਮਾਰਕ ਐਂਟਰੀ ਤੋਂ ਪਹਿਲਾਂ ਪ੍ਰੀਖਿਆ ਅੰਕ ਅਤੇ ਪ੍ਰੀਖਿਆ ਹਾਜ਼ਰੀ ਯਕੀਨੀ ਬਣਾਉ.', 'Asigurați-vă că examinați examenul și examenul înainte de înscrierea în marcajul final.', 'နောက်ဆုံးမာကု Entry မတိုင်မီစာမေးပွဲမာကုနဲ့စာမေးပွဲတက်ရောက်သေချာပါစေ။', 'Jọwọ ṣe idaniloju Atilẹkọ Akọsilẹ ati isinwo Iwoye ṣaaju Ṣiṣe Akọsilẹ Titẹ.', 'Da fatan a tabbatar da Takaddun Mark da Takaddama na Aiki kafin shigarwa na karshe.'),
(627, 'promotion_instruction_1', 'Please choose carefully Running Session & Promote Session.', 'দয়া করে সাবধানে চলমান সেশন  এবং প্রমোট সেশন নির্বাচন করুন।', 'Elija cuidadosamente Ejecutar sesión y promover sesión.', 'الرجاء اختيار بعناية تشغيل جلسة وتعزيز الدورة.', 'कृपया सावधानी से चल रहे सत्र और सत्र को बढ़ावा दें चुनें।', 'براہ کرم رننگ سیشن اور سیشن کو فروغ دینے کے لۓ منتخب کریں.', '请谨慎选择运行会议和推广会议。', '慎重に実行セッションとプロモートセッションを選択してください。', 'Por favor, escolha cuidadosamente a Sessão de Sessão e Promoção.', 'Пожалуйста, тщательно выберите «Запуск сеанса» и «Содействие».', 'Sil vous plaît choisir soigneusement session en cours et promouvoir la session.', '신중하게 세션 및 프로모션 세션을 선택하십시오.', 'Bitte wählen Sie sorgfältig ', 'Si prega di scegliere attentamente Running Session & Promoting Session.', 'เลือกเซสชันและเซสชันส่งเสริมการขายอย่างรอบคอบ', 'Kérjük, gondosan válassza a Futtatás és a kampány előmozdítását.', 'Kies zorgvuldig Sessie uitvoeren en sessie promoten.', 'Placere eligere diligenter & Thronus Sessio Promovere Sessio.', 'Harap pilih Session & Promote Session dengan hati-hati.', 'Lütfen dikkatle Çalışmayı Seçin ve Oturumu Tanıtın.', 'Επιλέξτε προσεκτικά την εκτέλεση της συνόδου και την προώθηση της συνόδου.', 'لطفا با دقت در حال اجرا Session & Promote Session را انتخاب کنید.', 'Sila pilih Sesi Berjalan & Sesi Promosi dengan hati-hati.', 'దయచేసి సెషన్ రన్నింగ్ & ప్రచారం సెషన్ను జాగ్రత్తగా ఎంచుకోండి.', 'அமர்வு இயக்குதல் மற்றும் அமர்வு ஊக்குவிக்க கவனமாகத் தேர்ந்தெடுங்கள்.', 'કૃપા કરીને કાળજીપૂર્વક ચાલી રહેલ સત્ર અને પ્રમોશન સત્ર પસંદ કરો.', 'Proszę wybrać ostrożnie Running Session & Promote Session.', 'Будь ласка, обережно вибирайте запуск сеансу та просуньте сеанс.', 'ਕਿਰਪਾ ਕਰਕੇ ਧਿਆਨ ਨਾਲ ਚੱਲ ਰਹੇ ਸੈਸ਼ਨ ਨੂੰ ਚੁਣੋ ਅਤੇ ਸੈਸ਼ਨ ਨੂੰ ਪ੍ਰਮੋਟ ਕਰੋ.', 'Alegeți cu atenție Rularea sesiunii și promovarea sesiunii.', 'တွေ့ဆုံဆွေးနွေးပွဲ & တွေ့ဆုံဆွေးနွေးပွဲမြှင့်တင်ကို run ဂရုတစိုက်ရွေးချယ်ပါ။', 'Jowo yan Ṣeto Nilẹ Ikẹkọ ati Igbimọ Ikẹkọ.', 'Da fatan za a zaɓa a zahiri a Gudun Zama da Tsarin Zama.'),
(628, 'promotion_instruction_2', 'Please choose carefully Current Class & Promote to Class.', 'দয়া করে সাবধানে বর্তমান ক্লাস  এবং প্রমোট ক্লাস নির্বাচন করুন।', 'Por favor, elija con cuidado la Clase actual y Promocione a la clase.', 'يرجى اختيار بعناية الفئة الحالية والترقية إلى فئة.', 'कृपया ध्यान दें वर्तमान कक्षा और श्रेणी में प्रचार करें।', 'براہ کرم احتیاط سے موجودہ کلاس کا انتخاب کریں اور کلاس میں فروغ دیں.', '请仔细选择当前课程并提升到课堂。', '慎重に選択してください現在のクラスとクラスへの昇格', 'Por favor, escolha cuidadosamente a classe atual e promova a classe.', 'Пожалуйста, выберите внимательно Текущий класс и продвигайте класс.', 'Sil vous plaît choisir soigneusement classe actuelle et promouvoir à la classe.', '주의 깊게 선택하십시오 Current Class & Class to Promote.', 'Bitte wählen Sie sorgfältig Aktuelle Klasse und Promote to Class.', 'Si prega di scegliere attentamente Classe corrente e promozione in classe.', 'โปรดเลือก Class ปัจจุบันและโปรโมต Class', 'Kérem, gondosan válassza az Aktuális osztály és az előadás osztályba.', 'Gelieve zorgvuldig te kiezen Huidige klasse en promotie naar klas.', 'Placere eligere diligenter Current Class Promovere in Ps.', 'Silakan pilih kelas yang sekarang dengan hati-hati & promosikan ke kelas.', 'Lütfen Geçerli Sınıfı Seçin ve Sınıfı Tanıtın.', 'Επιλέξτε προσεκτικά την τρέχουσα κλάση και την προώθηση στην κλάση.', 'لطفا دقت کلاس فعلی را ارتقا دهید و کلاس را ارتقا دهید.', 'Sila pilih Kelas Semasa & Menggalakkan Kelas dengan berhati-hati.', 'దయచేసి క్లాస్కు ప్రస్తుత క్లాస్ & ప్రమోట్ను జాగ్రత్తగా ఎంచుకోండి.', 'தற்போதைய வகுப்பு மற்றும் வகுப்புக்கு ஊக்குவிக்கவும்.', 'કૃપા કરી કાળજીપૂર્વક વર્તમાન વર્ગ પસંદ કરો અને વર્ગમાં પ્રમોટ કરો.', 'Wybierz ostrożnie Obecna klasa i promuj do klasy.', 'Будь ласка, обережно вибирайте поточний клас та рекламуйте до класу.', 'ਕ੍ਰਿਪਾ ਕਰਕੇ ਧਿਆਨ ਨਾਲ ਵਰਤਮਾਨ ਕਲਾਸ ਅਤੇ ਪ੍ਰੋਮੋਟ ਤੋਂ ਕਲਾਸ ਚੁਣੋ.', 'Alegeți cu atenție Clasa curentă și promovați în clasă.', 'လက်ရှိအတန်းအစားဂရုတစိုက်ကိုရှေးခယျြ & Class ကိုမှမြှင့်တင်ပါ။', 'Jọwọ yan abojuto Kilasi lọwọlọwọ & Igbelaruge si Kilasi.', 'Da fatan za a zaɓa a hankali A halin yanzu Class & Yi Nasara zuwa Class.');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(629, 'promotion_instruction_3', 'Please complete the process of Exam, Exam Schedule, Exam Attendance, Exam Mark & Final Result.', 'অনুগ্রহপূর্বক পরীক্ষার প্রক্রিয়া, পরীক্ষার সময়সূচী, পরীক্ষার উপস্থিতি, পরীক্ষার চিহ্ন এবং চূড়ান্ত ফলাফল সম্পন্ন করুন।', 'Complete el proceso de Examen, Programa de examen, Asistencia de examen, Marca de examen y Resultado final.', 'يرجى إكمال عملية الامتحان، جدول الامتحانات، امتحان الحضور، علامة الامتحان والنتيجة النهائية.', 'कृपया परीक्षा, परीक्षा अनुसूची, परीक्षा उपस्थिति, परीक्षा अंक और अंतिम परिणाम की प्रक्रिया को पूरा करें।', 'براہ کرم امتحان، امتحان شیڈول، امتحان حاضری، امتحان مارک اور حتمی نتائج کا عمل مکمل کریں.', '请完成考试，考试时间表，考试考勤，考试标志和最终结果的过程。', '試験、試験のスケジュール、試験の出席、試験のマークと最終結果のプロセスを完了してください。', 'Por favor, complete o processo de exame, horário de exames, atendimento ao exame, marca de exame e resultado final.', 'Завершите процесс экзамена, экзаменационного экзамена, экзаменационного экзамена, экзамена и итогового результата.', 'Veuillez compléter le processus dexamen, le programme dexamen, la présence aux examens, la note dexamen et le résultat final.', '시험, 시험 일정, 시험 참석, 시험 점수 및 최종 결과의 과정을 완료하십시오.', 'Bitte führen Sie den Prozess der Prüfung, des Prüfungsplans, der Prüfungsbesuch, der Prüfungsnote und des Abschlussergebnisses durch.', 'Si prega di completare il processo di esame, pianificazione dellesame, partecipazione agli esami, voto dellesame e risultato finale.', 'กรุณากรอกแบบฟอร์มการสอบ, กำหนดการสอบ, เข้าร่วมการสอบ, เครื่องหมายการสอบและผลการทดสอบขั้นสุดท้าย', 'Kérjük, töltse ki a vizsga, az érettségi vizsga, az érettségi, a vizsgajegy és a végeredmény folyamatát.', 'Voltooi het proces van examen, examenroosters, examen, examen en eindresultaat.', 'Placere perficere processus MACROCYTOSIS, Exam Schedule, OMNIBUS June IV: Mark Chapter & exitu rerum.', 'Selesaikan proses Ujian, Jadwal Ujian, Ujian Kehadiran, Tanda Ujian & Hasil Akhir.', 'Lütfen Sınav, Sınav Takvimi, Sınav Katılımı, Sınav Sonucu ve Final Sonuç sürecini tamamlayın.', 'Παρακαλούμε συμπληρώστε τη διαδικασία της εξέτασης, του προγράμματος εξετάσεων, της συμμετοχής στις εξετάσεις, του εξεταστικού σημειώματος και του τελικού αποτελέσματος.', 'لطفا روند امتحان، برنامه امتحان، حضور امتحان، معاینه آزمون و نتیجه نهایی را تکمیل کنید.', 'Sila lengkapkan proses Peperiksaan, Jadual Peperiksaan, Kehadiran Peperiksaan, Peperiksaan Ujian & Keputusan Akhir.', 'పరీక్షా ప్రక్రియ పూర్తి చేయండి, పరీక్షా షెడ్యూల్, పరీక్షా హాజరు, పరీక్ష మార్క్ & ఫైనల్ ఫలితం.', 'பரீட்சை செயல்முறை, தேர்வு அட்டவணை, தேர்வு கலந்துரையாடல், தேர்வு மார்க் & இறுதி முடிவு முடிக்க.', 'પરીક્ષા, પરીક્ષા શેડ્યૂલ, પરીક્ષા હાજરી, પરીક્ષા માર્ક અને અંતિમ પરિણામની પ્રક્રિયા પૂર્ણ કરો.', 'Prosimy o wypełnienie procesu egzaminu, egzaminu, egzaminu, egzaminu i końcowego wyniku.', 'Будь ласка, заповніть процедуру іспиту, графіку іспиту, відвідуваність іспиту, оцінку іспиту та остаточний результат.', 'ਕਿਰਪਾ ਕਰਕੇ ਪ੍ਰੀਖਿਆ, ਪ੍ਰੀਖਿਆ ਸ਼ਡਿਊਲ, ਪ੍ਰੀਖਿਆ ਹਾਜ਼ਰੀ, ਪ੍ਰੀਖਿਆ ਅੰਕ ਅਤੇ ਅੰਤਿਮ ਨਤੀਜੇ ਦੀ ਪ੍ਰਕਿਰਿਆ ਪੂਰੀ ਕਰੋ.', 'Completați procesul de examen, program de examen, examen, examen și rezultat final.', 'စာမေးပွဲ, စာမေးပွဲအချိန်ဇယား, စာမေးပွဲတက်ရောက်, စာမေးပွဲ, Mark & Final ရလဒ်များ၏လုပ်ငန်းစဉ်ကိုအပြီးသတ်ပေးပါ။', 'Jọwọ pari awọn ilana ti kẹhìn, Akokọwo Itanwo, Aṣọwo Iwoye, Aṣayẹwo ayẹwo ati Ipari ikẹhin.', 'Don Allah a kammala aikin nazarin, Nazarin Jirgin, Jirgin Tambaya, Alamar Duba & Sakamako na ƙarshe.'),
(630, 'promotion_instruction_4', 'Please double check all Students Total Marks, Obtain Mark, Average Grade Point & Next Class Roll No.', 'দয়া করে সকল শিক্ষার্থীর মোট নম্বর, প্রাপ্ত নম্বর, গড় গ্রেড পয়েন্ট এবং পরবর্তী শ্রেণী রোল নম্বর চেক করুন।', 'Verifique por favor todas las marcas totales de estudiantes, obtenga la marca, el promedio de calificaciones y la siguiente clase.', 'يرجى التحقق مرة أخرى من جميع الطلاب مجموع العلامات، والحصول على علامة، متوسط درجة نقطة و التالي فئة لفة رقم', 'कृपया परीक्षा, परीक्षा अनुसूची, परीक्षा उपस्थिति, परीक्षा अंक और अंतिम परिणाम की प्रक्रिया को पूरा करें।', 'براہ کرم تمام طالب علموں کو کل مارکس چیک کریں، مارک حاصل کریں، اوسط گریڈ پوائنٹ اور اگلے کلاس رول نمبر', '请仔细检查所有学生的总分，获得分数，平均分和下一班的卷号', '生徒の合計標章、標章の取得、平均等級点および次のクラスのロール番号を再度確認してください', 'Por favor, verifique novamente todas as Marcas Total de Estudantes, Obter Marca, Ponto Médico e Próxima Classe Roll No.', 'Пожалуйста, дважды проверьте все учащиеся, общее количество баллов, получите оценку, среднюю оценку и следующий класс.', 'Veuillez vérifier toutes les notes totales des élèves, obtenir la note, la note moyenne et la prochaine classe', '모든 학생 수 표, 점수 획득, 평균 성적 점수 및 다음 등급 롤 수를 다시 확인하십시오.', 'Bitte überprüfen Sie alle Schüler-Gesamtpunkte, erhalten Sie Mark, Durchschnittspunkt und nächste Klasse Roll-Nr.', 'Si prega di ricontrollare tutti gli indicatori Total Marks, Obtain Mark, Average Grade Point e Next Class.', 'โปรดตรวจสอบเครื่องหมายคะแนนนักศึกษาทั้งหมด, ดูเครื่องหมาย, คะแนนเฉลี่ยและลำดับถัดไปเลขที่ม้วน', 'Kérem, ellenőrizze az összes diákok teljes pontszámát, szerezze meg a pontszámot, átlag pontot és a következő osztályú tekercset.', 'Controleer alsjeblieft alle studenten totaalcijfers, cijfer behalen, gemiddelde cijferpunt en volgende klasserol nr.', 'Velit gemino reprehendo omnes alumni Romanum marcas, Mark Alleluia, & mediocris gradus punctum Next Class Roll No.', 'Harap periksa kembali semua Siswa Total Marks, Dapatkan Mark, Rata-rata Nilai Kelas & Gulungan Kelas Berikutnya No.', 'Lütfen tüm Öğrencilerin Toplam İşaretlerini, İşaretle, Ortalama Puan Puanı ve Sonraki Sınıf Rulo Numarasını kontrol edin.', 'Παρακαλώ ελέγξτε διπλά όλους τους μαθητές Σύνολο σημείων, αποκτήστε το σήμα, το μέσο βαθμό βαθμού και το επόμενο κύκλο', 'لطفا تمام دانشجویان کل عالمت ها، علامت گذاری، رتبه متوسط و رول بعدی کلاس را بررسی کنید', 'Sila semak semula semua Markah Jumlah Pelajar, Dapatkan Tanda, Nilai Gred Purata & No.', 'దయచేసి మొత్తం స్టూడెంట్స్ మొత్తం మార్క్స్, మార్క్, సగటు గ్రేడ్ పాయింట్ & తదుపరి క్లాస్ రోల్ నెంబరుని తనిఖీ చేయండి.', 'மாணவர் மொத்த மார்க்ஸ், மார்க், சராசரி தர புள்ளி மற்றும் அடுத்த வகுப்பு ரோல் எண் ஆகியவற்றைப் பெறுக.', 'કૃપા કરીને બધાં વિદ્યાર્થીના કુલ ગુણની તપાસ કરો, માર્ક, સરેરાશ ગ્રેડ પોઇન્ટ અને આગળનો વર્ગ રોલ નંબર મેળવો.', 'Sprawdź dokładnie wszystkie oceny uczniów, zdobądź ocenę, średnią ocenę i numer następnej klasy', 'Будь ласка, подвійно перевірте всі студенти загальних знаків, отримайте знак, середню оцінку точки та наступний клас Roll No.', 'ਕ੍ਰਿਪਾ ਕਰਕੇ ਸਾਰੇ ਵਿਦਿਆਰਥੀਆਂ ਦੇ ਕੁੱਲ ਅੰਕ ਪਤਾ ਕਰੋ, ਪ੍ਰਾਪਤ ਕਰੋ ਮਾਰਕ, ਔਸਤ ਗਰੇਡ ਪੁਆਇੰਟ ਅਤੇ ਅਗਲਾ ਕਲਾਸ ਰੋਲ ਨੰਬਰ', 'Verificați dublu toți studenții Mark Total, Obțineți marca, Punctul mediu și următoarea clasă Roll Nr.', 'အမှတ်ပျမ်းမျှအဆင့်ပွိုင့် & Next ကိုအတန်းအစား Roll, မာကုရယူပါအပေါင်းတို့, ကျောင်းသားများစုစုပေါင်း Marks စစ်ဆေးနှစ်ဆ ကျေးဇူးပြု.', 'Jọwọ ṣe ayẹwo lẹẹmeji gbogbo Awọn akẹkọ Awọn ami ni gbogbo, Gba Samisi, Oṣuwọn Ipele Apapọ & Eerun Kọọkan Ibẹkọ No.', 'Don Allah sau biyu duba duk daliban Ƙidaya Ƙididdiga Alamomi, Sami Mark, Matsakaicin Matsayi Bayyana & Kayan Kayan Kira.'),
(631, 'promotion_instruction_5', 'All things are 100% correct Then Promote Students to Next Class.', 'সবকিছুর 100% সঠিক তারপর শিক্ষার্থীদের পরবর্তী শ্রেণীতে উন্নীত করুন।', 'Todas las cosas son 100% correctas. Luego, promueva a los estudiantes a la siguiente clase.', 'جميع الأشياء صحيحة 100٪ ثم تعزيز الطلاب إلى الدرجة التالية.', 'सभी चीजें 100% सही हैं, फिर छात्रों को अगली कक्षा में बढ़ावा देना।', 'تمام چیزیں 100٪ درست ہیں، پھر طلباء کو اگلا کلاس میں فروغ دیں.', '所有的事情都是100％正确的，然后促进学生下一课。', 'すべてのものが100％正しいです。次に、学生を次のクラスに昇格させます。', 'Todas as coisas estão 100% corretas. Em seguida, promova alunos para a próxima classe.', 'Все вещи на 100% правильны. Затем продвигайте студентов в следующий класс.', 'Toutes les choses sont 100% correctes Puis promouvoir les étudiants à la prochaine classe.', '모든 것은 100 % 정확합니다. 그런 다음 학생들을 다음 학급으로 승급하십시오.', 'Alle Dinge sind zu 100% korrekt. Dann fördern Sie die Schüler zur nächsten Klasse.', 'Tutte le cose sono corrette al 100%, quindi promuovi gli studenti alla prossima lezione.', 'ทุกอย่างถูกต้อง 100% แล้วโปรโมตนักเรียนให้เข้าชั้นเรียนถัดไป', 'Minden dolog 100% -ban helyes, majd elősegíti a diákokat a következő osztályba.', 'Alle dingen zijn 100% correct. Promoot vervolgens studenten naar de volgende klas.', 'Et bene omnia sunt, C% Next Promovere studentibus ad generalia Ps.', 'Semua hal 100% benar Lalu Promosikan Siswa ke Kelas Selanjutnya.', 'Her şey% 100 doğrudur Sonra Öğrencileri Bir Sonraki Sınıfta Tanıtın.', 'Όλα τα πράγματα είναι 100% σωστά Στη συνέχεια προωθήστε τους μαθητές στην επόμενη τάξη.', 'همه چیز 100٪ درست است سپس دانش آموزان را به کلاس بعدی ارتقا دهید.', 'Semua perkara adalah 100% betul Kemudian Menggalakkan Pelajar ke Kelas Seterusnya.', 'అన్ని విషయాలు 100% సరైనవి, తరువాత స్టూడెంట్స్ స్టూడెంట్స్ టు క్లాస్ టు క్లాస్.', 'எல்லா விஷயங்களும் 100% சரியானவை, பின்னர் மாணவர்கள் அடுத்த வகுப்புக்கு ஊக்குவிக்கின்றன.', 'બધી વસ્તુઓ 100% સાચી છે પછી વિદ્યાર્થીઓને આગામી વર્ગમાં પ્રમોટ કરો.', 'Wszystkie rzeczy są w 100% poprawne Następnie promuj uczniów do następnej klasy.', 'Всі речі правильні на 100%. Потім просувайте студентів до наступного класу.', 'ਸਾਰੀਆਂ ਚੀਜ਼ਾਂ 100% ਠੀਕ ਹਨ. ਫਿਰ ਵਿਦਿਆਰਥੀਆਂ ਨੂੰ ਅਗਲੀ ਕਲਾਸ ਵਿਚ ਉਤਸ਼ਾਹਿਤ ਕਰੋ.', 'Toate lucrurile sunt 100% corecte Apoi promovează elevii în clasa următoare.', 'ခပ်သိမ်းသောအရာတို့ကိုထိုအခါ Next ကိုအတန်းအစားမှကျောင်းသားများမြှင့်တင် 100% မှန်ကန်ဖြစ်ကြသည်။', 'Gbogbo ohun ni o wa 100% atunṣe Lẹhinna Ṣẹda Awọn Ile-iwe si Kilasi Oju.', 'Dukkanin abubuwa 100% daidai Saan nan kuma ƙaddara ɗaliban zuwa Kashi na gaba.'),
(632, 'average_grade_point', 'GPA', 'জিপিএ', 'GPA', 'المعدل التراكمي', 'जीपीए', 'جی پی اے', '等级点平均值', '平均等級点', 'gpa', 'оценка', 'gpa', '학점', 'gpa', 'gpa', 'เกรดเฉลี่ย', 'gpa', 'gpa', 'gpa', 'gpa', 'not ortalamasını', 'gpa', 'درجه امتیاز', 'gpa', 'గ్రేడ్ పాయింట్', 'தர புள்ளி', 'જીપા', 'gpa', 'ГПа', 'ਜੀਪੀਏ', 'grad punct', 'တန်းအမှတ်', 'gpa', 'gpa'),
(633, 'please_select_a_route', 'Please select a Route.', 'একটি রুট নির্বাচন করুন।', 'Seleccione una ruta.', 'الرجاء تحديد مسار.', 'कृपया एक रूट चुनें', 'براہ راست راستہ منتخب کریں.', '请选择路线。', 'ルートを選択してください。', 'Selecione uma Rota.', 'Выберите маршрут.', 'Veuillez sélectionner un itinéraire.', '경로를 선택하십시오.', 'Bitte wählen Sie eine Route.', 'Si prega di selezionare una rotta.', 'โปรดเลือกเส้นทาง', 'Kérjük, válasszon ki egy útvonalat.', 'Selecteer alstublieft een route.', 'Placere eligere Iter itineris.', 'Silakan pilih Rute.', 'Lütfen bir Güzergah seçin.', 'Επιλέξτε μια διαδρομή.', 'لطفا یک مسیر را انتخاب کنید', 'Sila pilih Laluan.', 'దయచేసి ఒక మార్గం ఎంచుకోండి.', 'தயவுசெய்து ஒரு பாதை தேர்ந்தெடுக்கவும்.', 'કૃપા કરીને એક રસ્તો પસંદ કરો', 'Wybierz trasę.', 'Будь ласка, виберіть маршрут.', 'ਕਿਰਪਾ ਕਰਕੇ ਇੱਕ ਰੂਟ ਚੁਣੋ.', 'Selectați o rută.', 'တစ်လမ်းကြောင်းရွေးချယ်ပါ။', 'Jọwọ yan Itọsọna kan.', 'Da fatan a zaɓi hanyar.'),
(634, 'return_success', 'Book return successfully', 'বই সফলভাবে ফেরত হয়েছে।', 'Libro devuelto con éxito', 'عودة الكتاب بنجاح', 'बुक सफलतापूर्वक वापस', 'کتاب کامیابی سے واپسی', '预订成功', '書籍の返品に成功', 'Livro de retorno com sucesso', 'Успешное возвращение книги', 'Le retour du livre a réussi', '도서 반환 성공', 'Buchen Sie erfolgreich zurück', 'Prenota con successo', 'หนังสือคืนสำเร็จแล้ว', 'A könyv sikeres visszaadása', 'Boek teruggave succesvol', 'Revertetur libro prospere', 'Pesan berhasil kembali', 'Kitap iadesi başarıyla gerçekleştirildi', 'Επαναφορά βιβλίου με επιτυχία', 'بازگشت کتاب با موفقیت', 'Pulangan buku berjaya', 'పుస్తకం తిరిగి విజయవంతంగా', 'புத்தகம் வெற்றிகரமாக திரும்பியது', 'ચોપડે સફળતાપૂર્વક વળતર', 'Zwrot książki powodzeniem', 'Книга повертається успішно', 'ਕਿਤਾਬ ਸਫਲਤਾਪੂਰਵਕ ਵਾਪਸ ਆਉਂਦੀ ਹੈ', 'Revenirea la carte a reușit', 'စာအုပ်အောင်မြင်စွာပြန်လာ', 'Iwe pada ni ifijišẹ', 'Book dawo da nasara'),
(635, 'due_amount', 'Due Amount', 'বাকি টাকা', 'Cantidad debida', 'مبلغ مستحق', 'देय राशि', 'باقی رقم', '到期金额', '金額', 'Valor devedor', 'Надлежащей суммы', 'Montant dû', '만기 금액', 'Fälliger Betrag', 'Importo dovuto', 'จำนวนเงินที่ครบกำหนด', 'Teljes összeg', 'Te betalen bedrag', 'ob Aliquam', 'Jumlah kematian', 'Ödenecek meblağ', 'Οφειλόμενο ποσό', 'مقدار قابل توجه', 'Jumlah terhutang', 'మొత్తం పరిమాణం', 'நிலுவை தொகை', 'નિયત રકમ', 'Kwota należna', 'Належна сума', 'ਕਮਾਈ ਰਕਮ', 'Suma datorata', 'ကြောင့်ငွေပမာဏ', 'Fun iye', 'Saboda Adadin'),
(636, 'user_active_status', 'Your account is not active. Please contact with administrator.', 'আপনার অ্যাকাউন্ট সক্রিয় নয়। প্রশাসকের সঙ্গে যোগাযোগ করুন দয়া করে।', 'Su cuenta no está activa. Por favor, póngase en contacto con el administrador.', 'حسابك غير فعال. يرجى الاتصال بالمشرف.', 'आपका खाता सक्रिय नहीं है। कृपया व्यवस्थापक से संपर्क करें', 'آپ کا اکاؤنٹ فعال نہیں ہے. برائے مہربانی منتظم کے ساتھ رابطہ کریں.', '您的帐户不活跃。 请与管理员联系。', 'あなたのアカウントはアクティブではありません。 管理者に連絡してください。', 'Sua conta não está ativa. Entre em contato com o administrador.', 'Ваша учетная запись неактивна. Пожалуйста, свяжитесь с администратором.', 'Votre compte nest pas actif. Sil vous plaît contacter avec ladministrateur.', '귀하의 계정이 활성화되어 있지 않습니다. 관리자에게 문의하십시오.', 'Dein Konto ist nicht aktiv. Bitte kontaktieren Sie den Administrator.', 'Il tuo account non è attivo. Si prega di contattare con lamministratore.', 'บัญชีของคุณไม่ทำงาน โปรดติดต่อผู้ดูแลระบบ', 'Fiókod nem aktív. Kérjük, lépjen kapcsolatba a rendszergazdával.', 'Uw account is niet actief. Neem contact op met de beheerder.', 'Ratio tua est activae. Placere contactus administrator.', 'Akunmu tidak aktif. Silahkan kontak dengan administrator.', 'Hesabınız aktif değil. Lütfen yönetici ile iletişime geçin.', 'Ο λογαριασμός σας δεν είναι ενεργός. Επικοινωνήστε με τον διαχειριστή.', 'حساب شما فعال نیست لطفا با مدیر تماس بگیرید', 'Akaun anda tidak aktif. Sila hubungi dengan pentadbir.', 'మీ ఖాతా చురుకుగా లేదు. దయచేసి నిర్వాహకుడితో సంప్రదించండి.', 'உங்கள் கணக்கு செயலில் இல்லை. நிர்வாகியுடன் தொடர்பு கொள்ளவும்.', 'તમારું એકાઉન્ટ સક્રિય નથી. સંચાલક સાથે સંપર્ક કરો.', 'Twoje konto nie jest aktywne. Skontaktuj się z administratorem.', 'Ваш обліковий запис не активний. Будь ласка, звяжіться з адміністратором.', 'ਤੁਹਾਡਾ ਖਾਤਾ ਕਿਰਿਆਸ਼ੀਲ ਨਹੀਂ ਹੈ. ਕਿਰਪਾ ਕਰਕੇ ਪ੍ਰਬੰਧਕ ਨਾਲ ਸੰਪਰਕ ਕਰੋ', 'Contul dvs. nu este activ. Contactați administratorul.', 'သင့်အကောင့်တက်ကြွမဟုတ်ပါဘူး။ စီမံခန့်ခွဲသူနှင့်အတူကိုဆက်သွယ်ပါ။', 'Akoto rẹ ko ṣiṣẹ. Jọwọ kan si pẹlu alakoso.', 'Asusunku ba aiki ba ne. Da fatan a tuntuɓi mai gudanarwa.'),
(637, 'certificate', 'Certificate', 'সার্টিফিকেট', 'Certificado', 'شهادة', 'प्रमाणपत्र', 'سرٹیفیکیٹ', '证书', '証明書', 'Certificado', 'сертификат', 'Certificat', '증명서', 'Zertifikat', 'Certificato', 'ใบรับรอง', 'Bizonyítvány', 'Certificaat', 'libellum', 'Sertifikat', 'sertifika', 'Πιστοποιητικό', 'گواهی', 'Sijil', 'సర్టిఫికెట్', 'சான்றிதழ்', 'પ્રમાણપત્ર', 'Certyfikat', 'Сертифікат', 'ਸਰਟੀਫਿਕੇਟ', 'Certificat', 'လက်မှတ်', 'Ijẹrisi', 'Certificate'),
(638, 'generate', 'Generate', 'জেনারেট', 'Generar', 'توفير', 'उत्पन्न', 'پیدا', '生成', '生成する', 'Gerar', 'генерировать', 'produire', '일으키다', 'Generieren', 'creare', 'ผลิต', 'generál', 'voortbrengen', 'generate', 'Menghasilkan', 'üretmek', 'Παράγω', 'تولید می کنند', 'Jana', 'రూపొందించండి', 'உருவாக்குதல்', 'પેદા', 'Generować', 'Генерувати', 'ਬਣਾਉ', 'Genera', 'ဖွစျပှါးစေ', 'Ṣe ina', 'Samar da'),
(639, 'manage_certificate_type', 'Manage Certificate Type', 'সার্টিফিকেট প্রকার পরিচালনা করুন', 'Administrar tipo de certificado', 'إدارة نوع الشهادة', 'प्रमाणपत्र प्रकार प्रबंधित करें', 'سرٹیفکیٹ کی قسم کا انتظام کریں', '管理证书类型', '証明書タイプの管理', 'Gerenciar tipo de certificado', 'Управление типом сертификата', 'Gérer le type de certificat', '인증서 유형 관리', 'Verwalten Sie den Zertifikatstyp', 'Gestisci tipo di certificato', 'จัดการประเภทใบรับรอง', 'Tanúsítványtípus kezelése', 'Beheer het certificaattype', 'Quisque Curo Type', 'Kelola Jenis Sertifikat', 'Sertifika Türünü yönetin', 'Διαχείριση τύπου πιστοποιητικού', 'مدیریت نوع گواهی', 'Urus Jenis Sijil', 'సర్టిఫికెట్ రకం నిర్వహించండి', 'சான்றிதழ் வகை நிர்வகி', 'પ્રમાણપત્રનો પ્રકાર મેનેજ કરો', 'Zarządzaj typem certyfikatu', 'Управління типом сертифіката', 'ਸਰਟੀਫਿਕੇਟ ਦੀ ਕਿਸਮ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați tipul certificatului', 'လက်မှတ်အမျိုးအစားကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Ijẹrisi Iru', 'Sarrafa Takaddun shaida'),
(642, 'main_certificate_text', 'Certificate Text', 'সার্টিফিকেট বিষয়বস্তু', 'Certificado de texto', 'نص الشهادة', 'प्रमाणपत्र पाठ', 'سرٹیفکیٹ متن', '证书文本', '証明書のテキスト', 'Texto do Certificado', 'Текст сертификата', 'Texte du certificat', '인증서 텍스트', 'Zertifikatstext', 'Testo del certificato', 'ข้อความรับรอง', 'Tanúsítványszöveg', 'Certificaattekst', 'libellum Text', 'Teks Sertifikat', 'Sertifika Metni', 'Κείμενο πιστοποιητικού', 'متن گواهی', 'Teks Sijil', 'సర్టిఫికెట్ టెక్స్ట్', 'சான்றிதழ் உரை', 'પ્રમાણપત્ર ટેક્સ્ટ', 'Tekst certyfikatu', 'Текст сертифіката', 'ਸਰਟੀਫਿਕੇਟ ਟੈਕਸਟ', 'Textul certificatului', 'လက်မှတ်စာသား', 'Iwe ijẹrisi', 'Takaddun shaida'),
(643, 'footer_left', 'Footer Left Text', 'ফুটার বাম টেক্সট', 'Texto de pie de página a la izquierda', 'تذييل النص الأيسر', 'पाद लेख वाम पाठ', 'فوٹر بائیں متن', '页脚左边的文字', 'フッター左のテキスト', 'Rodapé do texto à esquerda', 'Нижний левый текст', 'Pied gauche Texte', '꼬리말 왼쪽 텍스트', 'Fußzeile linken Text', 'Testo a piè di pagina a sinistra', 'ข้อความท้ายกระดาษท้าย', 'Footer Left Text', 'Voettekst Linkertekst', 'Reliquit Footer Text', 'Footer Left Text', 'Altbilgi Sol Metin', 'Υποσέλιδο αριστερό κείμενο', 'پاورقی متن چپ', 'Teks Kiri Kaki', 'ఫుటరు ఎడమ టెక్స్ట్', 'அடிக்குறிப்பு இடது உரை', 'ફૂટર ડાબે ટેક્સ્ટ', 'Footer Left Text', 'Нижній колонтитул ліворуч', 'ਪਦਲੇਖ ਖੱਬੇ ਪਾਠ', 'Subtitrarea textului din subsol', 'footer လက်ဝဲစာသား', 'Onkọ Left Ẹsẹ', 'Rubutun Hagu na Hagu'),
(644, 'footer_middle', 'Footer Middle Text', 'ফুটার মধ্যম টেক্সট', 'Texto intermedio del pie de página', 'تذييل الصفحة الوسطى النص', 'पाद लेख मध्य पाठ', 'فوٹر مشرق وسطی', '页脚中间文本', 'フッター中間テキスト', 'Texto do rodapé', 'Нижний текст нижнего колонтитула', 'Pied Moyen Texte', '꼬리말 중간 텍스트', 'Fußzeile mittlerer Text', 'Footer Middle Text', 'ข้อความระดับกลางของท้ายกระดาษ', 'Lábra középső szöveg', 'Voettekst Middelste tekst', 'Medio Footer Text', 'Footer Middle Text', 'Altbilgi Orta Metin', 'Υποσέλιδο Μέσο κείμενο', 'Footer Middle Text', 'Teks Tengah Footer', 'ఫుటర్ మధ్య టెక్స్ట్', 'அடிக்குறிப்பு நடு உரை', 'ફૂટર મધ્ય લખાણ', 'Stopka środkowy tekst', 'Нижній колонтитул середній текст', 'ਫੁੱਟਰ ਮੱਧ ਪਾਠ', 'Subtitrarea textului de mijloc', 'footer အလယျပိုငျးစာသား', 'Ẹkọ Agbegbe Aarin', 'Rubutun Tsakiyar Tsakiya'),
(645, 'footer_right', 'Footer Right Text', 'ফুটার ডান টেক্সট', 'Texto a la derecha del pie de página', 'تذييل النص الأيمن', 'पाद लेख सही टेक्स्ट', 'فوٹر صحیح متن', '页脚正确的文本', 'フッタ右のテキスト', 'Texto à direita do rodapé', 'Нижний текст нижнего колонтитула', 'Pied droit Texte', '꼬리말 오른쪽 텍스트', 'Fußzeile rechten Text', 'Piè di pagina a destra', 'ข้อความชิดขวา', 'Lábfej jobb szöveg', 'Voettekst juiste tekst', 'Ius Footer Text', 'Footer Right Text', 'Altbilgi Sağ Metin', 'Υποσημείωση κειμένου υποσέλιδου', 'متن سمت راست پاورقی', 'Teks Kanan Footer', 'ఫుటర్ రైట్ టెక్స్ట్', 'அடிக்குறிப்பு வலது உரை', 'ફૂટર જમણો ટેક્સ્ટ', 'Stopka Prawy tekst', 'Нижній колонтитул праворуч', 'ਪਦਲੇਖ ਸੱਜੇ ਪਾਠ', 'Footer dreapta text', 'footer ညာစာသား', 'Oro Ọtun Ẹka', 'Rubutattun Kalmomin Tsaida'),
(646, 'background', 'Background', 'ব্যাকগ্রাউন্ড', 'Fondo', 'خلفية', 'पृष्ठभूमि', 'پس منظر', '背景', 'バックグラウンド', 'fundo', 'Задний план', 'Contexte', '배경', 'Hintergrund', 'sfondo', 'พื้นหลัง', 'Háttér', 'Achtergrond', 'Maecenas vitae', 'Latar Belakang', 'Arka fon', 'Ιστορικό', 'زمینه', 'Latar Belakang', 'నేపథ్య', 'பின்னணி', 'પૃષ્ઠભૂમિ', 'tło', 'Передумови', 'ਪਿਛੋਕੜ', 'fundal', 'နောက်ခံသမိုင်း', 'Atilẹhin', 'Bayani'),
(647, 'manage_certificate', 'Manage Certificate', 'সার্টিফিকেট পরিচালনা করুন', 'Administrar Certificado', 'إدارة الشهادة', 'प्रमाण पत्र प्रबंधित करें', 'سرٹیفکیٹ کا نظم کریں', '管理证书', '証明書を管理する', 'Gerenciar certificado', 'Управление сертификатом', 'Gérer le certificat', '인증서 관리', 'Zertifikat verwalten', 'Gestisci certificato', 'จัดการใบรับรอง', 'Tanúsítvány kezelése', 'Beheer het certificaat', 'Quisque curo', 'Kelola Sertifikat', 'Sertifikayı Yönet', 'Διαχείριση του πιστοποιητικού', 'مدیریت گواهی', 'Urus Sijil', 'సర్టిఫికెట్ని నిర్వహించండి', 'சான்றிதழை நிர்வகி', 'પ્રમાણપત્રનું સંચાલન કરો', 'Zarządzaj certyfikatem', 'Управління сертифікатом', 'ਸਰਟੀਫਿਕੇਟ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați certificatul', 'လက်မှတ်ကိုစီမံခန့်ခွဲ', 'Ṣakoso Ijẹrisi', 'Sarrafa Takaddun shaida'),
(648, 'manage_gallery', 'Manage Gallery', 'গ্যালারি পরিচালনা করুন', 'Administrar Galería', 'إدارة المعرض', 'गैलरी प्रबंधित करें', ' گیلری کا انتظام کریں', '管理图库', 'ギャラリーを管理する', 'Gerenciar galeria', 'Управление галереей', 'Gérer la galerie', '갤러리 관리', 'Galerie verwalten', 'Gestisci Galleria', 'จัดการแกลเลอรี', 'Galéria kezelése', 'Galerij beheren', 'curo Gallery', 'Kelola Galeri', 'Galeriyi yönet', 'Διαχείριση της Γκαλερί', 'مدیریت گالری', 'Urus Galeri', 'గ్యాలరీని నిర్వహించండి', 'தொகுப்பு நிர்வகி', 'ગેલેરી મેનેજ કરો', 'Zarządzaj galerią', 'Управління галереєю', 'ਗੈਲਰੀ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați galeria', 'ပြခန်းများကိုစီမံကွပ်ကဲ', 'Ṣakoso Awọn Aworan', 'Sarrafa hotuna'),
(649, 'gallery', 'Gallery', 'গ্যালারি', 'Galería', 'صالة عرض', 'गेलरी', 'نگارخانہ', '画廊', 'ギャラリー', 'Galeria', 'Галерея', 'Galerie', '갱도', 'Galerie', 'Galleria', 'เฉลียง', 'Képtár', 'Galerij', 'gallery', 'Galeri', 'galeri', 'Εκθεσιακός χώρος', 'آلبوم عکس', 'Galeri', 'గ్యాలరీ', 'கேலரி', 'ગેલેરી', 'Galeria', 'Галерея', 'ਗੈਲਰੀ', 'Galerie', 'ပြခန်း', 'Awọn ohun ọgbìn', 'Gallery'),
(650, 'is_view_on_web', 'Is View on Web?', 'ওয়েব দেখুন কি?', '¿Ver en la web?', 'هو عرض على شبكة الإنترنت؟', 'वेब पर देखें क्या है?', 'کیا ویب پر نظر ہے؟', '在网上查看？', 'Web上での表示ですか？', 'Ver na Web?', 'Просмотр в Интернете?', 'Est-ce que View on Web?', '웹에서보기입니까?', 'Ist im Web zu sehen?', 'La vista è sul Web?', 'ดูบนเว็บหรือไม่?', 'Megtekintés a weben?', 'Is View on Web?', 'View in Web est?', 'Apakah Lihat di Web?', 'Webde Görüntüleme mi?', 'Είναι η προβολή στο Web;', 'آیا نمایش در وب است؟', 'Adakah Lihat di Web?', 'వెబ్లో వీక్షించాలా?', 'இணையத்தில் பார்க்கிறதா?', 'વેબ પર જુઓ છો?', 'Czy widok w sieci?', 'Чи є перегляд в Інтернеті?', 'ਕੀ ਵੈਬ ਤੇ ਨਜ਼ਰ ਹੈ?', 'Vizualizați pe Web?', 'ကြည့်ရန်က်ဘ်ပေါ်လား?', 'Wo ni oju-iwe ayelujara?', 'Shin View a Yanar?'),
(651, 'cover_image', 'Cover Image', 'কভার চিত্র', 'Imagen de portada', 'صورة الغلاف', 'कवर छवि', 'کور تصویر', '封面图片', '表紙画像', 'Imagem de capa', 'Изображение обложки', 'Image de couverture', '표지 이미지', 'Titelbild', 'Immagine di copertina', 'ภาพปก', 'Borítókép', 'Omslagfoto', 'No Cover Image', 'Gambar sampul', 'Kapak resmi', 'Εικόνα εξωφύλλου', 'تصویر روی جلد', 'Cover Image', 'చిత్రం కవర్', 'படத்தை மறை', 'કવર છબી', 'Okładka', 'Обкладинка зображення', 'ਕਵਰ ਚਿੱਤਰ', 'Imagine de copertă', 'အဖုံးပုံရိပ်', 'Aworan Ideri', 'Rufin Hotuna'),
(652, 'media_gallery', 'Media Gallery', 'মিডিয়া গ্যালারী', 'Galería media', 'معرض الوسائط', 'मीडिया गैलरी', 'میڈیا گیلری', '媒体库', 'メディアギャラリー', 'Galeria de mídia', 'Медиа-галерея', 'Galerie des médias', '미디어 갤러리', 'Medien Gallerie', 'Galleria multimediale', 'Media Gallery', 'Média Galéria', 'media galerij', 'Gallery', 'Galeri media', 'Medya Galerisi', 'Έκθεση μέσων', 'گالری رسانه', 'Galeri Media', 'మీడియా గ్యాలరీ', 'மீடியா தொகுப்பு', 'મીડિયા ગેલેરી', 'Galeria multimediów', 'Медіа галерея', 'ਮੀਡੀਆ ਗੈਲਰੀ', 'Galerie media', 'မီဒီယာပြခန်း', 'Media Gallery', 'Media Gallery'),
(653, 'manage_gallery_image', 'Manage Gallery Image', 'গ্যালারি চিত্র পরিচালনা করুন', 'Administrar imagen de la galería', 'إدارة صورة المعرض', 'गैलरी छवि प्रबंधित करें', 'گالری کی تصویر کا انتظام', '管理图库图像', 'ギャラリー画像を管理する', 'Gerenciar a imagem da galeria', 'Управление изображением галереи', 'Gérer la galerie', '갤러리 이미지 관리', 'Galeriebild verwalten', 'Gestisci limmagine della galleria', 'จัดการภาพแกลลอรี่', 'Galéria kép kezelése', 'Galerijafbeelding beheren', 'Curo Image Gallery', 'Kelola Gambar Galeri', 'Galeri Resmi Yönet', 'Διαχείριση της εικόνας της γκαλερί', 'مدیریت تصویر گالری', 'Urus Imej Galeri', 'గ్యాలరీ చిత్రాన్ని నిర్వహించండి', 'தொகுப்பு பட நிர்வகி', 'ગેલેરી છબી મેનેજ કરો', 'Zarządzaj obrazem galerii', 'Керувати зображенням галереї', 'ਗੈਲਰੀ ਚਿੱਤਰ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați imaginea galeriei', 'စီမံခန့်ခွဲပြခန်းပုံရိပ်', 'Ṣakoso awọn Aworan Aworan', 'Sarrafa Hotuna Hotuna'),
(654, 'caption', 'Caption', 'ক্যাপশন', 'Subtítulo', 'شرح', 'शीर्षक', 'کیپشن', '标题', 'キャプション', 'Rubrica', 'титр', 'Légende', '표제', 'Bildbeschriftung', 'Didascalia', 'คำบรรยายภาพ', 'Felirat', 'Onderschrift', 'caption', 'Caption', 'altyazı', 'Λεζάντα', 'عنوان', 'Keterangan', 'శీర్షిక', 'தலைப்பு', 'કૅપ્શન', 'Podpis', 'Підпис', 'ਸੁਰਖੀ', 'Legendă', 'caption', 'Caption', 'Caption'),
(655, 'frontend', 'Frontend', 'ফ্রন্টেন্ড', 'Interfaz', 'نهاية المقدمة', 'फ़्रंट एंड', 'فرنٹ اینڈ', '前端', 'フロントエンド', 'A parte dianteira', 'Внешний интерфейс', 'Lextrémité avant', '프론트 엔드', 'Vorderes Ende', 'Fine frontale', 'ส่วนหน้า', 'frontend', 'Voorkant', 'Frontend', 'Paling depan', 'Başlangıç aşaması', 'Φρανκ', 'ظاهر', 'Frontend', 'ఫ్రంటెండ్', 'முன்நிலை', 'અગ્રભાગ', 'Frontend', 'Інтерфейс', 'ਅਗਰਾਂਤ', 'În față', 'ရှေ့ဆုံးကို', 'Software ti o pese atọkun si eto miiran', 'Gabatarwa'),
(656, 'manage_frontend', 'Manage Frontend', 'ফ্রন্টেন্ড পরিচালনা করুন', 'Administrar frontend', 'إدارة الواجهة الأمامية', 'अग्रभाग प्रबंधित करें', 'فرنٹ اینڈ کا انتظام کریں', '管理前端', 'フロントエンドの管理', 'Gerenciar front-end', 'Управление Frontend', 'Gérer le frontend', '프론트 엔드 관리', 'Frontend verwalten', 'Gestisci il frontend', 'จัดการ Frontend', 'A Frontend kezelése', 'Frontend beheren', 'curo Frontend', 'Kelola Frontend', 'Ön Uçu Yönet', 'Διαχειριστείτε το Frontend', 'مدیریت ظاهر', 'Uruskan Frontend', 'ఫ్రంటెండ్ని నిర్వహించండి', 'Frontend நிர்வகி', 'અગ્રભાગ મેનેજ કરો', 'Zarządzaj frontendem', 'Управління інтерфейсом', 'ਫਰੰਟਐਂਡ ਨੂੰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați Frontend', 'Frontend စီမံခန့်ခွဲရန်', 'Ṣakoso awọn Iwaju', 'Sarrafa Gyara'),
(657, 'manage_frontend_page', 'Manage Frontend Page', 'ফ্রন্টেন্ড পৃষ্ঠা পরিচালনা করুন', 'Administrar la página frontend', 'إدارة صفحة الواجهة الأمامية', 'फ्रंटएण्ड पेज प्रबंधित करें', 'فرنٹ اینڈ پیج کا انتظام کریں', '管理前端页面', 'フロントエンドの管理ページ', 'Gerenciar página front-end', 'Управление страницей Frontend', 'Gérer la page frontend', '프론트 엔드 페이지 관리', 'Frontend-Seite verwalten', 'Gestisci la pagina di frontend', 'จัดการหน้าส่วนหน้า', 'A Frontend oldal kezelése', 'Frontend-pagina beheren', 'Curo Frontend Page', 'Kelola Frontend Page', 'Ön Uç Sayfasını Yönet', 'Διαχείριση Σελίδας Frontend', 'مدیریت صفحه ظاهری', 'Urus Halaman Frontend', 'ఫ్రంటెండ్ పేజీని నిర్వహించండి', 'Frontend பக்கத்தை நிர்வகிக்கவும்', 'અગ્ર પેજમાં મેનેજ કરો', 'Zarządzaj stroną frontendową', 'Керування сторінкою інтерфейсу', 'ਫਰੰਟਐਂਡ ਪੰਨਾ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați pagina Frontend', 'Frontend စာမျက်နှာကိုစီမံခန့်ခွဲ', 'Ṣakoso awọn Iwaju oju-iwe', 'Sarrafa Shafin Farko'),
(658, 'school_fax', 'School Fax', 'স্কুল ফ্যাক্স', 'Fax escolar', 'فاكس المدرسة', 'स्कूल फ़ैक्स', 'اسکول فیکس', '学校传真', '学校のファックス', 'Fax escolar', 'Школьный Факс', 'Fax de lécole', '학교 팩스', 'Schulfax', 'Fax della scuola', 'แฟกซ์โรงเรียน', 'Iskolai fax', 'Schoolfax', 'Fax School', 'Faks Sekolah', 'Okul faksı', 'Σχολικό φαξ', 'مدرسه فکس', 'Faks Sekolah', 'స్కూల్ ఫ్యాక్స్', 'பள்ளி தொலைநகல்', 'શાળા ફેક્સ', 'Faks szkolny', 'Шкільний факс', 'ਸਕੂਲ ਫੈਕਸ', 'Scoala de fax', 'ကျောင်းစာအုပ်ဖက်စ်', 'Fax Ile-iwe', 'Fax Fax'),
(659, 'school_geocode', 'School Location Code', 'স্কুল অবস্থান কোড', 'Código de ubicación de la escuela', 'رمز موقع المدرسة', 'स्कूल स्थान कोड', 'سکول کی جگہ کا کوڈ', '学校位置代码', '学校の場所コード', 'Código de localização da escola', 'Код места расположения школы', 'Code de lieu de lécole', '학교 위치 코드', 'Standortcode der Schule', 'Codice di posizione della scuola', 'รหัสสถานที่ตั้งโรงเรียน', 'Iskola helykódja', 'School locatiecode', 'Location schola Code', 'Kode Lokasi Sekolah', 'Okul Yeri Kodu', 'Κωδικός τοποθεσίας σχολείου', 'کد مدرسه محل سکونت', 'Kod Lokasi Sekolah', 'స్కూల్ స్థానాన్ని వీధి చిరునామా', 'பள்ளி இடத்தை', 'શાળા સ્થાન કોડ', 'Kod lokalizacji szkoły', 'Код місцеположення школи', 'ਸਕੂਲ ਸਥਾਨ ਕੋਡ', 'Codul locației școlii', 'ကျောင်းစာအုပ်တည်နေရာ Code ကို', 'Iwe Ilana Ile-iwe', 'Lambar Ƙarin Makaranta'),
(660, 'facebook_url', 'Facebook URL', 'ফেসবুক ইউআরএল', 'Facebook URL', 'URL الفيسبوك', 'फेसबुक युआरएल', 'فیس بک یو آر ایل', 'Facebook网址', 'Facebookの', 'URL Facebook', 'URL-адрес Facebook', 'Ladresse URL de Facebook', 'Facebook URL', 'Facebook URL', 'URL di Facebook', 'URL ของ Facebook', 'Facebook URL', 'Facebook URL', 'Facebook URL', 'URL Facebook', 'Facebook URL', 'Διεύθυνση URL του Facebook', 'URL فیس بوک', 'URL Facebook', 'Facebook URL', 'பேஸ்புக் URL', 'ફેસબુક URL', 'URL facebooka', 'URL-адреса на Facebook', 'ਫੇਸਬੁੱਕ URL', 'URL-ul Facebook', 'Facebook မှာ URL ကို', 'URL URL', 'Facebook URL'),
(661, 'twitter_url', 'Twitter URL', 'টুইটার ইউআরএল', 'URL de Twitter', 'رابط تويتر', 'ट्विटर यूआरएल', 'ٹویٹر یو آر ایل', 'Twitter网址', 'Twitterの', 'URL do Twitter', 'URL Twitter', 'URL Twitter', 'Twitter URL', 'Twitter-URL', 'URL di Twitter', 'URL Twitter', 'Twitter URL', 'Twitter-URL', 'URL Twitter', 'URL Twitter', 'Twitter URL', 'Διεύθυνση URL Twitter', 'URL توییتر', 'URL Twitter', 'Twitter URL', 'ட்விட்டர் URL', 'ટ્વિટર URL', 'Adres URL Twittera', 'URL-адреса Twitter', 'ਟਵਿੱਟਰ URL', 'URL-ul Twitter', 'Twitter ကို URL ကို', 'Twitter URL', 'Twitter URL'),
(662, 'linkedin_url', 'Linkedin URL', 'লিঙ্কডিন ইউআরএল', 'URL de Linkedin', 'Linkedin URL', 'लिंक्डिन यूआरएल', 'لنکڈین یو آر ایل', 'Linkedin网址', 'リンク先の', 'URL do Linkedin', 'Ссылка на Linkedin', 'URL Linkedin', '링크 된 URL', 'Verknüpfte URL', 'URL di Linkedin', 'Linkedin URL', 'Linkedin URL', 'Linkedin URL', 'LinkedIn URL', 'URL Linkedin', 'Linkedin URLsi', 'Linkedin URL', 'نشانی اینترنتی لینکدین', 'URL Linkedin', 'లింక్ చేసిన URL', 'இணைக்கப்பட்ட URL', 'Linkedin URL', 'Linkedin URL', 'Linkedin URL', 'ਲਿੰਕਡਿਨ ਯੂਆਰਐਲ', 'Linkedin URL', 'linkedin URL ကို', 'Linkedin URL', 'Linkedin URL'),
(663, 'google_plus_url', 'Google Plus URL', 'গুগল প্লাস ইউআরএল', 'URL de Google Plus', 'جوجل بلس URL', 'Google Plus URL', 'Google Plus URL', 'Google Plus网址', 'Google Plusの', 'URL do Google Plus', 'URL-адрес Google Plus', 'URL Google Plus', 'Google 플러스 URL', 'Google Plus-URL', 'URL di Google Plus', 'URL Google Plus', 'Google Plus URL', 'Google Plus URL', 'Google Plus URL', 'URL Google Plus', 'Google Artı URL', 'Διεύθυνση URL Google Plus', 'گوگل پلاس URL', 'URL Google Plus', 'గూగుల్ ప్లస్ URL', 'கூகிள் பிளஸ் URL', 'Google Plus URL', 'Adres URL Google Plus', 'URL-адреса Google Plus', 'Google Plus URL', 'Adresa URL Google Plus', 'Google Plus URL ကို', 'URL Google Plus', 'Google Plus URL'),
(664, 'youtube_url', 'Youtube URL', 'ইউটিউব ইউআরএল', 'URL de Youtube', 'عنوان URL على Youtube', 'यूथट्यूब यूआरएल', 'یو ٹیوب یو آر ایل', 'YouTube网址', 'YouTubeの', 'URL do Youtube', 'URL Youtube', 'URL Youtube', 'YouTube URL', 'YouTube-URL', 'URL di Youtube', 'URL ของ Youtube', 'Youtube URL', 'YouTube-URL', 'URL Videos', 'URL Youtube', 'Youtube URLsi', 'Youtube URL', 'URL یوتیوب', 'URL Youtube', 'Youtube URL', 'Youtube URL', 'YouTube URL', 'Adres URL w YouTube', 'URL-адреса YouTube', 'ਯੂਟਿਊਬ ਯੂਆਰਐਲ', 'Adresa URL Youtube', 'Youtube ကို URL ကို', 'Youtube URL', 'Youtube URL'),
(665, 'instagram_url', 'Instagram URL', 'ইনস্টাগ্রাম ইউআরএল', 'URL de Instagram', 'عنوان انستغرام', 'Instagram URL', 'Instagram یو آر ایل', 'Instagram网址', 'Instagram URL', 'URL do Instagram', 'URL-адрес Instagram', 'URL Instagram', 'Instagram URL', 'Instagram URL', 'URL di Instagram', 'URL Instagram', 'Instagram URL', 'Instagram URL', 'Instagram URL', 'URL Instagram', 'Instagram URL', 'Διεύθυνση URL Instagram', 'URL نمایش مشخصات عمومی', 'URL Instagram', 'Instagram URL', 'Instagram URL', 'Instagram URL', 'Adres URL Instagrama', 'URL-адреса Instagram', 'Instagram URL', 'Adresă URL Instagram', 'Instagram ကို URL ကို', 'Instagram URL', 'Instagram URL'),
(666, 'pinterest_url', 'Pinterest URL', 'পিন্টারেস্ট ইউআরএল', '', 'Pinterest URL', 'Pinterest यूआरएल', 'Pinterest یو آر ایل', 'Pinterest网址', 'Pinterest URL', 'URL do Pinterest', 'URL-адрес Pinterest', 'URL de Pinterest', '관심있는 URL', 'Pinterest-URL', 'URL di Pinterest', 'URL Pinterest', 'Pinterest URL', 'Pinterest URL', 'URL Pinterest', 'URL Pinterest', 'Pinterest URL', 'Διεύθυνση URL Pinterest', 'آدرس اینترنتی Pinterest', 'URL Pinterest', 'Pinterest URL', 'Pinterest URL', 'Pinterest URL', 'URL na Pinterest', 'Pinterest URL', 'Pinterest ਯੂਆਰਐਲ', 'Adresa URL Pinterest', 'Pinterest URL ကို', 'Pinterest URL', 'URL din'),
(667, 'page', 'Page', 'পৃষ্ঠা', 'Página', 'صفحة', 'पृष्ठ', 'صفحہ', '页', 'ページ', 'Página', 'страница', 'Page', '페이지', 'Seite', 'Pagina', 'หน้า', 'oldal', 'Pagina', 'page', 'Halaman', 'Sayfa', 'Σελίδα', 'صفحه', 'Halaman', 'పేజీ', 'பக்கம்', 'પાનું', 'Strona', 'Сторінка', 'ਪੰਨਾ', 'Pagină', 'စာမျက်နှာ', 'Page', 'Page'),
(668, 'description', 'Description', 'বিবরণ', 'Descripción', 'وصف', 'विवरण', 'تفصیل', '描述', '説明', 'Descrição', 'Описание', 'La description', '기술', 'Beschreibung', 'Descrizione', 'ลักษณะ', 'Leírás', 'Beschrijving', 'Description', 'Deskripsi', 'Açıklama', 'Περιγραφή', 'شرح', 'Penerangan', 'వివరణ', 'விளக்கம்', 'વર્ણન', 'Opis', 'Опис', 'ਵਰਣਨ', 'Descriere', 'ဖေါ်ပြချက်', 'Apejuwe', 'Bayani'),
(669, 'manage_slider', 'Manage Slider', 'স্লাইডার পরিচালনা করুন', 'Administrar control deslizante', 'إدارة المتزلج', 'स्लाइडर प्रबंधित करें', 'سلائیڈر کا نظم کریں', '管理滑块', 'スライダーの管理', 'Gerenciar Slider', 'Управление слайдером', 'Gérer le curseur', '슬라이더 관리', 'Schieberegler verwalten', 'Gestisci il dispositivo di scorrimento', 'จัดการ Slider', 'A csúszka kezelése', 'Beheer schuifregelaar', 'curo Slider', 'Kelola Slider', 'Kaydırıcıyı Yönet', 'Διαχειριστείτε το ρυθμιστικό', 'مدیریت لغزان', 'Urus Slider', 'స్లైడర్ని నిర్వహించండి', 'ஸ்லைடர் நிர்வகி', 'સ્લાઇડર મેનેજ કરો', 'Zarządzaj suwakiem', 'Керувати слайдером', 'ਸਲਾਈਡਰ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați cursorul', 'Slider ကစီမံခန့်ခွဲရန်', 'Ṣakoso awọn igbasẹ', 'Sarrafa Slider'),
(670, 'slider', 'Slider', 'স্লাইডার', 'Control deslizante', 'المنزلق', 'स्लाइडर', 'سلائیڈر', '滑块', 'スライダー', 'Slider', 'ползунок', 'Slider', '슬라이더', 'Schieberegler', 'Slider', 'Slider', 'Slider', 'schuif', 'labor lapsus', 'Slider', 'kaydırıcı', 'Ολισθητής', 'لغزنده', 'Slider', 'స్లైడర్', 'ஸ்லைடர்', 'સ્લાઇડર', 'Suwak', 'Слайдер', 'ਸਲਾਈਡਰ', 'cursor', 'slider', 'Yiyọ', 'Zamawa'),
(673, 'admission_fee', 'Admission Fee', 'ভর্তি ফি', 'Precio de admisión', 'رسوم الدخول', 'प्रवेश शुल्क', 'داخلہ فیس', '入场费', '入場料', 'Taxa de admissão', 'Плата за вход', 'Frais dadmission', '입장료', 'Aufnahmegebühr', 'Tassa di ammissione', 'ค่าตั๋ว', 'Jelentkezési költség', 'Toegangsprijs', 'Praesent pretium', 'Uang masuk', 'Giriş ücreti', 'Εισιτήριο', 'هزینه پذیرش', 'Yuran kemasukan', 'ప్రవేశ రుసుము', 'சேர்க்கை கட்டணம்', 'પ્રવેશ ફી', 'Opłata za wstęp', 'Вступний внесок', 'ਦਾਖ਼ਲਾ ਫ਼ੀਸ', 'Taxa de admitere', 'ဝင်ကြေး', 'Gbigba Gbigba wọle', 'Kudin shiga'),
(672, 'hourly', 'Hourly', 'প্রতি ঘণ্টায়', 'Cada hora', 'باستمرار', 'प्रति घंटा', 'گھنٹہ وار', '每小时', '毎時', 'De hora em hora', 'почасовой', 'Horaire', '매시간', 'Stündlich', 'ogni ora', 'ทุกๆชั่วโมง', 'Óránkénti', 'ieder uur', 'hourly', 'Per jam', 'Saatlik', 'Ωριαίος', 'ساعتی', 'Jam', 'ప్రతిగంట', 'மணிக்கொருமுறை', 'અવરલી', 'Cogodzinny', 'Погодинно', 'ਘੰਟਾ', 'ore', 'နာရီတိုင်း', 'Wakati', 'Saa'),
(674, 'is_applicable', 'Is Applicable?', 'প্রযোজ্য?', '¿Es aplicable?', 'هل قابل للتطبيق؟', 'उपयुक्त है?', 'قابل اطلاق ہے؟', '适用？', '適用可能ですか？', 'É aplicável?', 'Применимо?', 'Est applicable?', '해당 사항이 있습니까?', 'Anwendbar?', 'È applicabile?', 'ใช้ได้หรือไม่?', 'Alkalmazható?', 'Is toepasbaar?', 'Est Lorem?', 'Apakah Berlaku?', 'Uygulanabilir mi', 'Ισχύει;', 'مناسب است؟', 'Adakah berkenaan?', 'వర్తించదగినది', 'பொருந்தக்கூடியதா?', 'લાગુ છે?', 'Ma zastosowanie?', 'Чи застосовується?', 'ਕੀ ਇਹ ਲਾਗੂ ਹੁੰਦਾ ਹੈ?', 'Este aplicabil?', 'application ဖြစ်ပါတယ်?', 'Ṣe o wa?', 'Shin ya dace?'),
(675, 'payroll', 'Payroll', 'পেরোল', 'Nómina de sueldos', 'كشف رواتب', 'पेरोल', 'پے رول', '工资表', '給与計算', 'Folha de pagamento', 'Начисление заработной платы', 'Paie', '급여', 'Lohn-und Gehaltsabrechnung', 'Libro paga', 'บัญชีเงินเดือน', 'Payroll', 'Loonlijst', 'Mauris scelerisque', 'Daftar gaji', 'Maaş bordrosu', 'Κατάσταση μισθοδοσίας', 'حقوق و دستمزد', 'Penggajian', 'పేరోల్', 'சம்பளப்பட்டியல்', 'પેરોલ', 'Lista płac', 'Зарплата', 'ਪੇਰੋਲ', 'stat de plată', 'အခစာရင်း', 'Owo-owo sisan', 'Biyan kuɗi'),
(676, 'salary', 'Salary', 'বেতন', 'Salario', 'راتب', 'वेतन', 'تنخواہ', '薪水', '給料', 'Salário', 'Зарплата', 'Un salaire', '봉급', 'Gehalt', 'Stipendio', 'เงินเดือน', 'Fizetés', 'Salaris', 'salarium', 'Gaji', 'Maaş', 'Μισθός', 'حقوق', 'Gaji', 'జీతం', 'சம்பளம்', 'પગાર', 'Wynagrodzenie', 'Зарплата', 'ਤਨਖਾਹ', 'Salariu', 'လစာ', 'Iyawo', 'Salary'),
(677, 'history', 'History', 'ইতিহাস', 'Historia', 'التاريخ', 'इतिहास', 'ہسٹری', '历史', '歴史', 'História', 'история', 'Histoire', '역사', 'Geschichte', 'Storia', 'ประวัติศาสตร์', 'Történelem', 'Geschiedenis', 'Historia', 'Sejarah', 'Tarihçe', 'Ιστορία', 'تاریخ', 'Sejarah', 'చరిత్ర', 'வரலாறு', 'ઇતિહાસ', 'Historia', 'Історія', 'ਇਤਿਹਾਸ', 'Istorie', 'သမိုင်း', 'Itan', 'Tarihi'),
(678, 'manage_salary_grade', 'Manage Salary Grade', 'বেতন গ্রেড পরিচালনা', 'Administrar grado de salario', 'إدارة درجة الراتب', 'वेतन ग्रेड को प्रबंधित करें', 'تنخواہ کا انتظام کریں', '管理薪金等级', '給与グレードを管理する', 'Gerenciar o salário', 'Управление зарплатой', 'Gérer le salaire', '급여 등급 관리', 'HistoryManage Gehaltsstufe', 'Gestire il livello di stipendio', 'จัดการระดับเงินเดือน', 'Fizetési fokozat kezelése', 'Beheer salarislijst', 'Curo MERCES Romani', 'Kelola Grade Gaji', 'Maaş Notunu Yönet', 'Διαχειριστείτε το βαθμό μισθοδοσίας', 'مدیریت حقوق و دستمزد', 'Menguruskan Gred Gaji', 'జీతం గ్రేడ్ నిర్వహించండి', 'சம்பள உயர்வை நிர்வகி', 'પગાર ગ્રેડ મેનેજ કરો', 'Zarządzaj poziomem wynagrodzeń', 'Управління класом зарплати', 'ਸੈਲਰੀ ਗ੍ਰੇਡ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați gradul de salarizare', 'လစာအဆင့်စီမံခန့်ခွဲရန်', 'Ṣakoso awọn Ọya Salaye', 'Sarrafa Takardar Lissafin Kuɗi'),
(679, 'salary_grade', 'Salary Grade', 'বেতন গ্রেড', 'Grado de salario', 'راتب', 'वेतन ग्रेड', 'تنخواہ گریڈ', '薪金等级', '給与等級', 'Grau Salarial', 'Уровень зарплаты', 'Grade salarial', '급여 등급', 'Gehaltsstufe', 'Grado di stipendio', 'ระดับเงินเดือน', 'Fizetési fokozat', 'Salarisrang', 'Romani stipendio', 'Grade Gaji', 'Maaş Notu', 'Μισθός βαθμού', 'درجه حقوق و دستمزد', 'Gred Gaji', 'జీతం గ్రేడ్', 'சம்பளம் தர', 'પગાર ગ્રેડ', 'Wynagrodzenie', 'Зарплата', 'ਸੈਲਰੀ ਗ੍ਰੇਡ', 'Gradul de salarizare', 'လစာအဆင့်', 'Iye owo-iwe', 'Salary Salary'),
(680, 'grade_name', 'Grade Name', 'গ্রেড নাম', 'Nombre de grado', 'اسم الصف', 'ग्रेड का नाम', 'گریڈ کا نام', '成绩名称', 'グレード名', 'Nome da classe', 'Имя класса', 'Nom de grade', '학년 이름', 'Benennungsname', 'Nome di qualità', 'ชื่อชั้นเรียน', 'Grade Name', 'Grade naam', 'nomen gradus', 'Nama Kelas', 'Sınıf adı', 'Όνομα βαθμού', 'نام درجه', 'Nama Gred', 'గ్రేడ్ పేరు', 'தரம் பெயர்', 'ગ્રેડ નામ', 'Nazwa klasy', 'Назва класу', 'ਗਰੇਡ ਨਾਮ', 'Numele clasei', 'grade အမည်', 'Orukọ Ipele', 'Sunan suna'),
(681, 'basic_salary', 'Basic Salary', 'মূল বেতন', 'Salario base', 'راتب اساسي', 'मूल वेतन', 'بنیادی تنخواہ', '基础工资', '基本給', 'Salário básico', 'Основная зарплата', 'Salaire de base', '기본 급여', 'Grundgehalt', 'Salario di base', 'เงินเดือนทั่วไป', 'Alapilletmény', 'Basis salaris', 'Basic stipendio', 'Gaji pokok', 'Temel maaş', 'Βασικού μισθού', 'حقوق پایه', 'Gaji pokok', 'మూల వేతనం', 'அடிப்படை சம்பளம்', 'પ્રાથમિક વેતન', 'Podstawowe wynagrodzenie', 'Основна заробітна плата', 'ਬੇਸਿਕ ਸੈਲਰੀ', 'Salariu de baza', 'အခြေခံလစာ', 'Ipilẹ Ipilẹ', 'Salaye na asali'),
(682, 'house_rent', 'House Rent', 'ঘর ভাড়া', 'Alquiler de casa', 'إيجار المنزل', 'घर का किराया', 'گھر کا کرایہ', '房租', '家賃', 'Aluguel de casa', 'Аренда дома', 'Location de maison', '집 임대', 'Hausmiete', 'Affitto della casa', 'บ้านเช่า', 'House Rent', 'Huur', 'HABITATIO', 'Sewa Rumah', 'Ev Kiralama', 'Ενοίκιο σπιτιού', 'اجاره خانه', 'Rumah sewa', 'హౌస్ అద్దె', 'வீட்டு வாடகை', 'હાઉસ ભાડું', 'Dom na wynajem', 'Оренда житла', 'ਹਾਊਸ ਰੈਂਟ', 'Chiria casei', 'အိမ်ဌားရန်', 'Ile Iyalo', 'House Rent'),
(683, 'medical', 'Medical', 'মেডিকেল', 'Médico', 'طبي', 'मेडिकल', 'طبی', '医', '医療', 'Médico', 'медицинская', 'Médical', '의료', 'Medizinisch', 'Medico', 'ทางการแพทย์', 'Orvosi', 'Medisch', 'Medical', 'Medis', 'Tıbbi', 'Ιατρικός', 'پزشکی', 'Perubatan', 'మెడికల్', 'மருத்துவ', 'તબીબી', 'Medyczny', 'Медичний', 'ਮੈਡੀਕਲ', 'Medical', 'ဆေးဘက်ဆိုင်ရာ', 'Egbogi', 'Medical'),
(684, 'over_time_hourly_rate', 'Over Time Hourly Rate', 'ওভার টাইম ঘন্টায় রেট', 'Sobre la tarifa por hora del tiempo', 'مع مرور الوقت معدل بالساعة', 'समय प्रति घंटा दर से अधिक', 'وقت کے اوقات کی شرح کے دوران', '随时间变化的小时费率', '時間ごとの時間別料金', 'Taxa horária por hora', 'Счастье в час', 'Taux horaire au fil du temps', '시간별 시간당 요금', 'Stundensatz über die Zeit', 'Over Time Rate oraria', 'อัตรารายชั่วโมงต่อชั่วโมง', 'Több mint óránkénti arány', 'Na verloop van tijd uurtarief', 'Per Rate Tempus Hourly', 'Over Time Hourly Rate', 'Zaman İçindekiler Hızı', 'Χρόνος ανά ώρα', 'در طول ساعت به صورت ساعت', 'Lebih Kadar Masa Berkala', 'ఓవర్ టైమ్ గంటరో రేట్', 'ஓவர் டைம் மணிநேர விகிதம்', 'સમયનો સમય દીઠ દર', 'Ponadgodzinna stawka', 'З часом в годину', 'ਵੱਧ ਸਮਾਂ ਘੰਟਾ ਦਰ', 'Rata orară a timpului', 'အချိန်နာရီအလိုက်နှုန်းကျော်', 'Akoko Iwọn Akokọ Oṣuwọn', 'Fiye da Lokaci Na Yau'),
(685, 'provident_fund', 'Provident Fund', 'তহবিল', 'fondo de Previsión', 'صندوق الادخار', 'भविष्य निधि', 'پراویڈنٹ فنڈ', '公积金', '準備基金', 'fundo de previdência', 'резервный фонд', 'Fonds de prévoyance', '프로 비전 기금', 'Vorsorgefonds', 'fondo di previdenza', 'กองทุนสำรองเลี้ยงชีพ', 'segélyalap', 'Provident Fund', 'fiscus provident', 'dana penghematan', 'ihtiyat fonu', 'ταμείο προνοίας', 'صندوق', 'kumpulan Wang Simpanan', 'భవిష్య నిధి', 'வருங்கால வைப்பு நிதி', 'પ્રોવિડન્ટ ફંડ', 'Fundusz Provident', 'резервного фонду', 'ਪ੍ਰਾਵੀਡੈਂਟ ਫੰਡ', 'Fondul Provident', 'Provident Fund က', 'Iwe-iṣowo Pipese', 'Asusun bada'),
(686, 'hourly_rate', 'Hourly Rate', 'প্রতি ঘণ্টার মূল্য', 'Tarifa por hora', 'المعدل بالساعة', 'प्रति घंटा - दर', ' فی گھنٹہ کی شرح', '每小时收费', '時給', 'Taxa horária', 'Часовая ставка', 'Taux horaire', '시간당 요금', 'Stundensatz', 'Tariffa oraria', 'อัตราชั่วโมง', 'Óradíj', 'Uurtarief', 'Hourly rate', 'Tarif per jam', 'Saatlik ücret', 'Ωρομίσθιο', 'نرخ ساعتی', 'Kadar jam', 'గంటకు రేటు', 'நேர விகிதம்', 'અવરલી રેટ', 'Stawka godzinowa', 'Погодинна ставка', 'ਘੰਟੇ ਦੀ ਦਰ', 'Rata orară', 'အလုပ်ချိန်နာရီနှုန်း', 'Oṣuwọn wakati', 'Ranar Saa'),
(687, 'allowance', 'Allowance', 'ভাতা', 'Tolerancia', 'بدل', 'भत्ता', 'الاؤنس', '津贴', '手当', 'Abono', 'пособие', 'Allocation', '수당', 'Beihilfe', 'indennità', 'เบี้ยเลี้ยง', 'Juttatás', 'Toelage', 'Allocacio', 'Tunjangan', 'ödenek', 'Επίδομα', 'کمک هزینه', 'Elaun', 'అనుమతి', 'அலவன்ஸ்', 'ભથ્થું', 'Dodatek', 'Допомога', 'ਭੱਤਾ', 'alocație', 'အခွင့်', 'Gbese', 'Allowance'),
(688, 'deduction', 'Deduction', 'বাদ', 'Deducción', 'المستقطع', 'कटौती', 'کٹوتی', '扣除', '控除', 'Dedução', 'дедукция', 'Déduction', '공제', 'Abzug', 'Deduzione', 'การหัก', 'Levonás', 'Aftrek', 'deductio', 'Deduksi', 'kesinti', 'Αφαίρεση', 'کسر', 'Potongan', 'తీసివేతతీసివేత', 'துப்பறியும்', 'કપાત', 'Odliczenie', 'Відрахування', 'ਕਟੌਤੀ', 'Deducere', 'နှုတ်ယူခြင်း', 'Iyọkuro', 'Ragewa'),
(689, 'gross_salary', 'Gross Salary', 'মোট বেতন', 'Salario bruto', 'الراتب الكلى', 'सकल वेतन', 'مجموعی تنخواہ', '总薪水', '総給与', 'Salário Bruto', 'Валовая зарплата', 'Salaire brut', '총 급여', 'Bruttogehalt', 'Stipendio lordo', 'เงินเดือนขั้นต้น', 'Bruttó bér', 'Brutosalaris', 'Crassa salarium', 'Gaji kotor', 'Brüt maaş', 'Ακαθάριστο μισθό', 'حقوق و دستمزد ناخالص', 'Gaji kasar', 'స్థూల జీతం', 'மொத்த சம்பளம்', 'કુલ પગાર', 'Wynagrodzenie brutto', 'Зарплата брутто', 'ਕੁੱਲ ਤਨਖ਼ਾਹ', 'Salariu brut', 'စုစုပေါင်းလစာ', 'Gross Salary', 'Rawan kudi mai yawa'),
(690, 'net_salary', 'Net Salary', 'নেট বেতন', 'Sueldo neto', 'صافي الراتب', 'कुल वेतन', 'نیٹ تنخواہ', '净工资', 'ネット給与', 'Salário líquido', 'Чистая зарплата', 'Salaire net', '순 급여', 'Nettogehalt', 'Salario netto', 'เงินเดือนสุทธิ', 'Nettó bér', 'Netto salaris', 'Net MERCES', 'Gaji bersih', 'Net maaş', 'Καθαρός μισθός', 'حقوق خالص', 'Gaji Bersih', 'నికర జీతం', 'நிகர சம்பளம்', 'નેટ પગાર', 'Wynagrodzenie netto', 'Чиста зарплата', 'Net Salary', 'Salariu net', 'net ကလစာ', 'Apapọ owo-ori', 'Raayin Netarwa'),
(691, 'manage_payment', 'Manage Payment', 'পেমেন্ট পরিচালনা করুন', 'Administrar el pago', 'إدارة الدفع', 'भुगतान प्रबंधित करें', 'ادائیگی کا نظم کریں', '管理付款', 'お支払いの管理', 'Gerenciar Pagamento', 'Управление платежами', 'Gérer le paiement', '지불 관리', 'Zahlung verwalten', 'Gestisci il pagamento', 'จัดการการชำระเงิน', 'Fizetés kezelése', 'Beheer de betaling', 'curo Payment', 'Kelola Pembayaran', 'Ödemeyi Yönet', 'Διαχείριση της πληρωμής', 'مدیریت پرداخت', 'Urus Pembayaran', 'చెల్లింపుని నిర్వహించండి', 'கட்டணம் நிர்வகி', 'ચુકવણી મેનેજ કરો', 'Zarządzaj płatnością', 'Управління платежами', 'ਭੁਗਤਾਨ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați plata', 'ငွေပေးချေမှုရမည့်စီမံခန့်ခွဲရန်', 'Ṣakoso Isanwo', 'Sarrafa Biyan kuɗi'),
(692, 'salary_type', 'Salary Type', 'বেতন প্রকার', 'Tipo de salario', 'نوع الراتب', 'वेतन प्रकार', 'تنخواہ کی قسم', '薪资类型', '給与タイプ', 'Tipo salarial', 'Тип зарплаты', 'Type de salaire', '급여 유형', 'Gehaltsart', 'Tipo di stipendio', 'ประเภทเงินเดือน', 'Fizetési típus', 'Salaris Type', 'Type stipendio', 'Tipe Gaji', 'Maaş Türü', 'Τύπος μισθοδοσίας', 'نوع حقوق', 'Jenis Gaji', 'జీతం పద్ధతి', 'சம்பள வகை', 'પગાર પ્રકાર', 'Rodzaj wynagrodzenia', 'Тип заробітної плати', 'ਤਨਖਾਹ ਦੀ ਕਿਸਮ', 'Tip de salariu', 'လစာအမျိုးအစား', 'Iyawo Iru', 'Nauin Salary'),
(693, 'payment_to', 'Payment To', 'জাহাকেপেমেন্ট  করা হবে', 'Pago Para', 'دفع ل', 'को भुगतान', 'ادائیگی کرنے کے لئے', '支付', 'への支払い', 'Pagamento para', 'Оплата Для', 'Paiement à', '지불 대상', 'Zahlung an', 'pagamento a', 'ชำระเงินถึง', 'Fizetés ... részére', 'Betaling aan', 'Ad Payment', 'pembayaran untuk', 'Için ödeme', 'Πληρωμή σε', 'پرداخت به', 'bayaran kepada', 'చెల్లింపు', 'கட்டணம் கட்ட', 'ચુકવણી માટે', 'Płatność Do', 'Оплата до', 'ਭੁਗਤਾਨ ਕਰਨ ਲਈ', 'plata catre', 'ရန်ငွေပေးချေမှုရမည့်', 'Isanwo Lati', 'Biya Don'),
(694, 'over_time_total_hour', 'Over Time Total Hour', 'ওভার টাইম  মোট ঘন্টা', 'Hora total en el tiempo', 'مع مرور الوقت إجمالي ساعة', 'समय कुल घंटे से अधिक', 'کل وقت کے ساتھ', '随着时间的推移', '合計時間', 'Over Time Total Hour', 'С течением времени', 'Au fil du temps Total heure', '시간이 지남에 따라 총 시간', 'Über die Zeit insgesamt Stunde', 'Oltre lora totale', 'เมื่อรวมเวลาทั้งหมด', 'Idő alatt Teljes óra', 'Na verloop van tijd Totaal uur', 'Total super Hour', 'Over Time Total Hour', 'Zamanla Toplam Saat', 'Συνολική ώρα κατά τη διάρκεια του χρόνου', 'در طول زمان کل ساعت', 'Lebih Masa Jumlah Jam', 'ఓవర్ టైం టోటల్ అవర్', 'மொத்த நேரம் மொத்த நேரம்', 'સમય કુલ કલાક ઉપર', 'Łączna liczba godzin w czasie', 'З часом загальна година', 'ਟਾਈਮ ਕੁਲ ਘੰਟਾ ਵੱਧ', 'Ora pe oră totală', 'အချိန်စုစုပေါင်းနာရီကျော်', 'Aago Aago Lapapọ wakati', 'Bayan Lokaci Kayan Saa'),
(695, 'over_time_amount', 'Over Time Amount', 'ওভার টাইম পরিমাণ', 'Sobre el tiempo Monto', 'على مر الزمن المبلغ', 'समय राशि के साथ', 'وقت کی رقم کے دوران', '随着时间的推移', '時間経過に伴う金額', 'Ao longo do tempo', 'Сумма за раз', 'Au fil du temps', '시간 경과에 따른 금액', 'Über Zeit Betrag', 'Over Time Amount', 'เมื่อเวลาผ่านไป', 'Több idő alatt', 'Over tijd Bedrag', 'Per Aliquam tempus', 'Over Time Amount', 'Zamana Göre Tutar', 'Ποσό Over Time', 'بیش از مقدار زمان', 'Jumlah Lebih Masa', 'ఓవర్ టైం మొత్తం', 'ஓவர் டைம் தொகை', 'સમયનો રકમ', 'Kwota w czasie', 'Надмірна сума', 'ਸਮੇਂ ਦੀ ਮਾਤਰਾ ਤੋਂ ਵੱਧ', 'Valoarea peste timp', 'အချိန်ပမာဏကျော်', 'Iye Iye Aago', 'Yawan Lokaci'),
(696, 'total_hour', 'Total Hour', 'মোট ঘন্টা', 'Hora total', 'مجموع الساعة', 'कुल घंटे', 'کل گھنٹے', '总时数', '合計時間', 'Hora Total', 'Общий час', 'Heure totale', '총 시간', 'Gesamtstunde', 'Ora totale', 'รวมชั่วโมง', 'Teljes óra', 'Totaal uur', 'summa Hour', 'Jam Total', 'Toplam Saat', 'Συνολική ώρα', 'ساعت کل', 'Jumlah Jam', 'మొత్తం అవర్', 'மொத்த மணி', 'કુલ કલાક', 'Godzina ogółem', 'Загальна кількість годин', 'ਕੁੱਲ ਘੰਟਾ', 'Ora totală', 'စုစုပေါင်းနာရီ', 'Lapapọ wakati', 'Jimlar Saa'),
(697, 'bonus', 'Bonus', 'বোনাস', 'Prima', 'علاوة', 'बोनस', ' بونس', '奖金', 'ボーナス', 'Bônus', 'бонус', 'Prime', '보너스', 'Bonus', 'indennità', 'โบนัส', 'pótlék', 'Bonus', 'Bonus', 'Bonus', 'Bonus', 'Δώρο', 'جایزه', 'Bonus', 'అదనపు', 'போனஸ்', 'બોનસ', 'Premia', 'Бонус', 'ਬੋਨਸ', 'Primă', 'ဆုငှေ', 'Ajeseku', 'Bonus'),
(698, 'penalty', 'Penalty', 'জরিমানা', 'Pena', 'ضربة جزاء', 'दंड', 'جرمانہ', '罚款', 'ペナルティ', 'Pena', 'неустойка', 'Peine', '패널티', 'Elfmeter', 'Pena', 'การลงโทษ', 'Büntetés', 'boete', 'supplicium', 'Penalti', 'Ceza', 'Ποινή', 'مجازات', 'Penalti', 'పెనాల్టీ', 'அபராதம்', 'દંડ', 'Rzut karny', 'Штраф', 'ਪੈਨਲਟੀ', 'Penalizare', 'ပြစ်ဒဏ်', 'Ipaba', 'Zama'),
(699, 'gross_amount', 'Gross Amount', 'মোট পরিমাণ', 'Cantidad bruta', 'المبلغ الإجمالي', 'सकल राशि', 'مجموعی رقم', '总额', '総額', 'Quantidade bruta', 'Сумма брутто', 'Montant brut', '총액', 'Bruttobetrag', 'Importo lordo', 'ยอดรวม', 'Bruttó összeg', 'Brutobedrag', 'Crassa pondus', 'Jumlah bruto', 'Brüt miktar', 'Ακαθάριστο ποσό', 'مقدار ناخالص', 'Jumlah kasar', 'స్థూల మొత్తం', 'மொத்த தொகை', 'કુલ રકમ', 'Kwota brutto', 'Валова сума', 'ਕੁੱਲ ਰਕਮ', 'Valoarea brută', 'စုစုပေါင်းငွေပမာဏ', 'Iye nla', 'Babban Asalin'),
(700, 'net_amount', 'Net Amount', 'নেট পরিমাণ', 'Importe neto', 'كمية الشبكة', 'शुद्ध राशि', 'اصل رقم', '净额', '正味金額', 'Valor líquido', 'Чистая сумма', 'Montant net', '순액', 'Netto-Betrag', 'Importo netto', 'ปริมาณสุทธิ', 'Nettó összege', 'Netto bedrag', 'Net amount', 'Jumlah bersih', 'Net tutar', 'Καθαρό ποσό', 'مقدار خالص', 'Jumlah bersih', 'నికర మొత్తం', 'நிகர தொகை', 'નેટ રકમ', 'Kwota netto', 'Чиста сума', 'ਕੁੱਲ ਰਾਸ਼ੀ', 'Cantitate netă', 'net ငွေပမာဏ', 'Iye apapọ', 'Babban Asusun');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(701, 'is_applicable_discount', 'Is Applicable Discount?', 'ডিসকাউন্ট কি প্রযোজ্য?', '¿Es un descuento aplicable?', 'هو الخصم للتطبيق؟', 'लागू छूट है?', 'قابل اطلاق ڈسکاؤنٹ ہے؟', '是否适用折扣？', '適用割引ありますか？', 'É um desconto aplicável?', 'Применимая скидка?', 'Est-ce que le rabais applicable?', '적용 가능한 할인인가?', 'Ist der Rabatt gültig?', 'È lo sconto applicabile?', 'ส่วนลดที่ใช้บังคับหรือไม่?', 'Alkalmazható kedvezmény?', 'Is toepasselijke korting?', 'Price est applicabilis?', 'Apakah Diskon yang Berlaku?', 'Uygulanabilir İndirim mi?', 'Εφαρμόζεται έκπτωση;', 'آیا تخفیف مناسب است؟', 'Adakah Diskaun Berkenaan?', 'వర్తించదగిన డిస్కౌంట్ ఉందా?', 'பொருந்தக்கூடிய தள்ளுபடி?', 'લાગુ ડિસ્કાઉન્ટ છે?', 'Czy obowiązuje zniżka?', 'Чи застосовується знижка?', 'ਕੀ ਛੂਟ ਨੂੰ ਲਾਗੂ ਕਰਨਾ ਹੈ?', 'Este o reducere aplicabilă?', 'သက်ဆိုင်သောလျှော့ရှိပါသလား?', 'Ṣe Ṣe Kan Owo?', 'Shin rangwamen da aka dace?'),
(702, 'hostel_fee', 'Hostel Fee', 'হোস্টেল ফি', 'Tarifa del albergue', 'Hostel Fee', 'छात्रावास शुल्क', 'ہاسٹل فیس', '旅馆费用', 'ホステル料金', 'Taxa de Albergue', 'Хостел', 'Frais dauberge', '호스텔 요금', 'Jugendherbergsgebühr', 'Tassa dellostello', 'ค่าที่พัก', 'Hostel Fee', 'Hostel Fee', 'pretium Hostel', 'Biaya Hostel', 'Hostel Ücreti', 'Hostel Fee', 'هزینه ویزا', 'Yuran Asrama', 'హాస్టల్ రుసుము', 'விடுதி கட்டணம்', 'છાત્રાલય ફી', 'Opłata Hostel', 'Комісія за хостинг', 'ਹੋਸਟਲ ਫੀਸ', 'Hostel Fee', 'ဘော်ဒါဆောင်ကြေး', 'Ile-iṣẹ ile ayagbe', 'Kushin kwanan dalibai'),
(703, 'transport_fee', 'Transport Fee', 'পরিবহন ফি', 'Tarifa de transporte', 'مصاريف الشحن', 'परिवहन शुल्क', 'ٹرانسپورٹ فیس', '运输费', '輸送料', 'Tarifa de transporte', 'Транспортный сбор', 'Frais de transport', '운송료', 'Transportkosten', 'Tassa di trasporto', 'ค่าธรรมเนียมการขนส่ง', 'Szállítási díj', 'Transportkosten', 'pretium onerariam', 'Biaya transportasi', 'Taşıma ücreti', 'Τέλη Μεταφοράς', 'هزینه حمل ونقل', 'Yuran Pengangkutan', 'రవాణా రుసుము', 'போக்குவரத்து கட்டணம்', 'ટ્રાન્સપોર્ટ ફી', 'Opłata transportowa', 'Транспортна плата', 'ਟਰਾਂਸਪੋਰਟ ਫੀਸ', 'Taxă de transport', 'ပို့ဆောင်ရေးကြေး', 'Awọn owo ọkọ irin-ajo', 'Kudin sufuri'),
(704, 'certificate_fee', 'Certificate Fee', 'সার্টিফিকেট ফি', 'Cuota de certificado', 'رسوم الشهادة', 'प्रमाणपत्र शुल्क', 'سرٹیفکیٹ فیس', '证书费用', '証明書料金', 'Taxa de certificado', 'Плата за сертификат', 'Frais de certificat', '수료증', 'Zertifikatgebühr', 'Tassa di certificazione', 'ค่าธรรมเนียมการรับรอง', 'Tanúsítványdíj', 'Certificaatkosten', 'pretium certificatorium', 'Biaya Sertifikat', 'Sertifika Ücreti', 'Αμοιβή πιστοποιητικού', 'هزینه گواهینامه', 'Yuran Sijil', 'సర్టిఫికెట్ ఫీజు', 'சான்றிதழ் கட்டணம்', 'પ્રમાણપત્ર ફી', 'Opłata za certyfikat', 'Свідоцтва', 'ਸਰਟੀਫਿਕੇਟ ਫੀਸ', 'Taxă de certificat', 'လက်မှတ်ခ', 'Ijẹrisi iwe-ẹri', 'Takardar shaidar'),
(705, 'exam_fee', 'Exam Fee', 'পরীক্ষার ফি', 'Tasa de examen', 'رسوم الامتحان', 'परीक्षा शुल्क', 'امتحان فیس', '考试费用', '試験費用', 'Taxa de exame', 'Плата за экзамен', 'Frais dexamen', '시험 비용', 'Prüfungsgebühr', 'Tassa desame', 'ค่าธรรมเนียมการสอบ', 'Vizsga díj', 'Examengeld', 'nito pretium', 'Biaya Ujian', 'Sınav Ücreti', 'Τέλος εξέτασης', 'هزینه آزمون', 'Yuran Peperiksaan', 'పరీక్ష రుసుము', 'தேர்வு கட்டணம்', 'પરીક્ષા ફી', 'Opłata egzaminacyjna', 'Іспит', 'ਪ੍ਰੀਖਿਆ ਫੀਸ', 'Exam Taxă', 'စာမေးပွဲကြေး', 'Iye owowowo', 'Binciken Binciken'),
(706, 'monthly_fee', 'Monthly Tution Fee', 'মাসিক টিউশন ফি', 'Cuota de matrícula mensual', 'الرسوم الدراسية الشهرية', 'मासिक शिक्षण शुल्क', 'ماہانہ ٹیوشن فیس', '每月学费', '月額授業料', 'Mensalidade Mensal', 'Ежемесячная плата за обучение', 'Frais de scolarité mensuels', '월 수업료', 'Monatliche Studiengebühr', 'Quota di iscrizione mensile', 'ค่าเล่าเรียนรายเดือน', 'Havi tandíj', 'Maandelijks collegegeld', 'Menstrua feodo DISCIPLINA', 'Biaya Kuliah Bulanan', 'Aylık Öğrenim Ücreti', 'Μηνιαίο τέλος φοίτησης', 'هزینه تحصیل ماهانه', 'Yuran Tuisyen Bulanan', 'మంత్లీ ట్యూషన్ ఫీజు', 'மாதாந்திர கட்டணம் கட்டணம்', 'માસિક ટયુશન ફી', 'Opłata miesięczna za naukę', 'Щомісячна плата за навчання', 'ਮਹੀਨਾਵਾਰ ਟਿਊਸ਼ਨ ਫੀਸ', 'Taxă lunară de școlarizare', 'လစဉ်ကျူရှင်ကြေး', 'Awọn owo Ikẹkọ Oṣooṣu Oṣooṣu', 'Biyan ku] a] e na watanni'),
(707, 'about', 'About', 'এবাউট', 'Acerca de', 'حول', 'के बारे में', 'کے بارے میں', '关于', '約', 'Sobre', 'Около', 'Sur', '약', 'Über', 'Di', 'เกี่ยวกับ', 'Ról ről', 'Over', 'circa', 'Tentang', 'hakkında', 'Σχετικά με', 'در باره', 'Mengenai', 'గురించి', 'பற்றி', 'વિશે', 'O', 'Про', 'ਇਸ ਬਾਰੇ', 'Despre', 'အကွောငျး', 'Nipa', 'Game da'),
(708, 'social_link', 'Social Link', 'সামাজিক লিংক', 'Vínculo social', 'وصلة اجتماعية', 'सामाजिक लिंक', 'سوشل لنک', '社交链接', 'ソーシャルリンク', 'Link social', 'Социальная связь', 'Lien social', '소셜 링크', 'Soziale Verbindung', 'Collegamento sociale', 'Social Link', 'Közösségi link', 'Sociale link', 'Social Link', 'Jaringan sosial', 'Sosyal link', 'Κοινωνική σύνδεση', 'پیوند اجتماعی', 'Pautan Sosial', 'సామాజిక లింక్', 'சமூக இணைப்பு', 'સામાજિક લિંક', 'Link społecznościowy', 'Соціальна Посилання', 'ਸੋਸ਼ਲ ਲਿੰਕ', 'Legătură socială', 'လူမှု Link ကို', 'Asopọ Awujọ', 'Ƙungiyar Jiki'),
(709, 'get_in_touch', 'Get in Touch', 'স্পর্শ করুন', 'Estar en contacto', 'ابقى على تواصل', 'संपर्क में रहो', 'رابطے میں رہنا', '保持联系', '連絡する', 'Entrar em contato', 'Связаться', 'Entrer en contact', '연락하기', 'In Kontakt kommen', 'Mettiti in contatto', 'ได้รับการติดต่อ', 'Felveszi a kapcsolatot', 'Neem contact op', 'Get in Touch', 'Berhubungan', 'Temasta olmak', 'Ερχομαι σε επαφή', 'در تماس بودن', 'Dapatkan Sentuhan', 'అందుబాటులో ఉండు', 'தொடர்பில் இருங்கள்', 'સંપર્કમાં રહેવા', 'Bądź w kontakcie', 'Будемо на звязку', 'ਸੰਪਰਕ ਵਿੱਚ ਰਹੇ', 'Intrați în contact', 'Touch ကိုအတွက် Get', 'Gba ni Fọwọkan', 'Samun shiga'),
(710, 'staff', 'Staff', 'কর্মী', 'Personal', 'العاملين', 'कर्मचारी', 'اسٹاف', '员工', 'スタッフ', 'Funcionários', 'Сотрудники', 'Personnel', '직원', 'Mitarbeiter', 'Personale', 'บุคลากร', 'Személyzet', 'Personeel', 'Staff', 'Staf', 'Personel', 'Προσωπικό', 'کارکنان', 'Kakitangan', 'స్టాఫ్', 'ஊழியர்கள்', 'સ્ટાફ', 'Personel', 'Персонал', 'ਸਟਾਫ਼', 'Personal', 'ဝန်ထမ်း', 'Oṣiṣẹ', 'Maaikata'),
(711, 'contact_us', 'Contact Us', 'আমাদের সাথে যোগাযোগ করুন', 'Contáctenos', 'اتصل بنا', 'हमसे संपर्क करें', 'ہم سے رابطہ کریں', '联系我们', 'お問い合わせ', 'Contate-Nos', 'Свяжитесь с нами', 'Contactez nous', '연락처', 'Kontaktiere uns', 'Contattaci', 'ติดต่อเรา', 'Lépjen kapcsolatba velünk', 'Neem contact met ons op', 'Nobis loquere', 'Hubungi kami', 'Bizimle iletişime geçin', 'Επικοινωνήστε μαζί μας', 'تماس با ما', 'Hubungi Kami', 'మమ్మల్ని సంప్రదించండి', 'எங்களை தொடர்பு கொள்ள', 'અમારો સંપર્ક કરો', 'Skontaktuj się z nami', 'Звяжіться з нами', 'ਸਾਡੇ ਨਾਲ ਸੰਪਰਕ ਕਰੋ', 'Contacteaza-ne', 'ကြှနျုပျတို့ကိုဆကျသှယျရနျ', 'Pe wa', 'Tuntuɓi Mu'),
(712, 'comment', 'Comment', 'মন্তব্য', 'Comentario', 'تعليق', 'टिप्पणी', 'تبصرہ', '评论', 'コメント', 'Comente', 'Комментарий', 'Commentaire', '논평', 'Kommentar', 'Commento', 'คิดเห็น', 'Megjegyzés', 'Commentaar', 'comment', 'Komentar', 'Yorum Yap', 'Σχόλιο', 'اظهار نظر', 'Komen', 'వ్యాఖ్య', 'கருத்து', 'ટિપ્પણી કરો', 'Komentarz', 'Коментар', 'ਟਿੱਪਣੀ', 'cometariu', 'မှတ်ချက်', 'Ọrọìwòye', 'Sharhi'),
(713, 'read_more', 'Read More', 'আরও পড়ুন', 'Lee mas', 'اقرأ أكثر', 'और पढो', 'مزید پڑھ', '阅读更多', '続きを読む', 'consulte Mais informação', 'Прочитайте больше', 'Lire la suite', '더 읽기', 'Weiterlesen', 'Leggi di più', 'อ่านเพิ่มเติม', 'Olvass tovább', 'Lees verder', 'Lege plus', 'Baca lebih banyak', 'Daha fazla oku', 'Διαβάστε περισσότερα', 'ادامه مطلب', 'Baca Lebih Lanjut', 'ఇంకా చదవండి', 'மேலும் வாசிக்க', 'વધુ વાંચો', 'Czytaj więcej', 'Читати далі', 'ਹੋਰ ਪੜ੍ਹੋ', 'Citeste mai mult', 'ဆက်ဖတ်ရန်', 'Ka siwaju', 'Kara karantawa'),
(714, 'terms_and_condition', 'Terms & Condition', 'বিধি - নিষেধ এবং শর্তাবলী', 'Términos y Condiciones', 'الشروط والأحكام', 'नियम व शर्त', 'شرائط اور حالت', '条款与协议', '利用規約', 'Termos e Condições', 'Условия и условия', 'Termes et conditions', '약관 및 조건', 'Allgemeine Geschäftsbedingungen', 'Termini e condizioni', 'ข้อตกลงและเงื่อนไข', 'Felhasználási feltételek', 'Regels en voorwaarden', 'Terms & Condition', 'Syarat & Ketentuan', 'Şartlar ve koşullar', 'Όροι & Προϋποθέσεις', 'شرایط و ضوابط', 'Terma dan syarat', 'నియమాలు & నిబంధన', 'விதிமுறைகள் & நிபந்தனை', 'શરતો અને સ્થિતિ', 'Zasady i warunki', 'Умови та умови', 'ਸ਼ਰਤਾਂ ਅਤੇ ਸ਼ਰਤਾਂ', 'Termeni si conditii', 'စည်းမျဉ်းစည်းကမ်းများ & အခြေအနေ', 'Awọn ofin & Ipò', 'Terms & Yanayin'),
(715, 'privacy_policy', 'Privacy Policy', 'গোপনীয়তা নীতি', 'Política de privacidad', 'سياسة الخصوصية', 'गोपनीयता नीति', 'پرائیویسی پالیسی', '隐私政策', '個人情報保護方針', 'Política de Privacidade', 'политика конфиденциальности', 'Politique de confidentialité', '개인 정보 정책', 'Datenschutz-Bestimmungen', 'politica sulla riservatezza', 'นโยบายส่วนบุคคล', 'Adatvédelmi irányelvek', 'Privacybeleid', 'Privacy policy', 'Kebijakan pribadi', 'Gizlilik Politikası', 'Πολιτική Απορρήτου', 'سیاست حفظ حریم خصوصی', 'Dasar Privasi', 'గోప్యతా విధానం', 'தனியுரிமை கொள்கை', 'ગોપનીયતા નીતિ', 'Polityka prywatności', 'Політика конфіденційності', 'ਪਰਾਈਵੇਟ ਨੀਤੀ', 'Politica de confidentialitate', 'ကိုယ်ရေးအချက်အလက်မူဝါဒ', 'Ìpamọ Afihan', 'takardar kebantawa'),
(716, 'event_info', 'Event Info', 'ইভেন্ট তথ্য', 'Información del evento', 'معلومات الحدث', 'ईवेंट जानकारी', 'واقعہ کی معلومات', '活动信息', 'イベント情報', 'Informação do Evento', 'Информация о событии', 'Informations sur lévénement', '이벤트 정보', 'Ereignisinformationen', 'Informazioni sullevento', 'ข้อมูลเหตุการณ์', 'Esemény információ', 'Evenement info', 'res Info', 'Info Acara', 'Etkinlik Bilgisi', 'Πληροφορίες εκδήλωσης', 'اطلاعات رویداد', 'Maklumat Acara', 'ఈవెంట్ సమాచారం', 'நிகழ்வு தகவல்', 'ઇવેન્ટ માહિતી', 'Informacje o wydarzeniu', 'Інформація про події', 'ਇਵੈਂਟ ਜਾਣਕਾਰੀ', 'Informații despre eveniment', 'အဖြစ်အပျက်အင်ဖို', 'Alaye ti oyan', 'Bayanin Event'),
(717, 'admission_form', 'Admission Form', 'ভর্তির ফর্ম', 'Formulario de admisión', 'شكل القبول', 'प्रवेश फार्म', 'داخلہ فارم', '入场表格', '入学式', 'Formulário de admissão', 'Форма приема', 'Formulaire dadmission', '입학 허가서', 'Aufnahmeformular', 'Modulo di ammissione', 'แบบฟอร์มเข้าศึกษา', 'Felvételi űrlap', 'Toelatingsformulier', 'Admission Form', 'Formulir Pendaftaran', 'Kabul formu', 'Έντυπο Εισαγωγής', 'فرم پذیرش', 'Borang Kemasukan', 'అడ్మిషన్ ఫారం', 'சேர்க்கை படிவம்', 'પ્રવેશ ફોર્મ', 'Formularz przyjęcia', 'Форма прийому', 'ਦਾਖ਼ਲਾ ਫਾਰਮ', 'Formular de admitere', 'ဝန်ခံချက် Form ကို', 'Fọọmu Gbigba', 'Takardar izinin shiga'),
(718, 'home', 'Home', 'হোম', 'Casa', ' الصفحة الرئيسية', 'होम', 'گھر', '家', 'ホーム', 'Casa', 'Главная', 'Accueil', '집', 'Zuhause', 'Casa', 'บ้าน', 'itthon', 'Huis', 'domum', 'Rumah', 'Ev', 'Σπίτι', 'خانه', 'Rumah', 'హోమ్', 'முகப்பு', 'હોમ', 'Dom', 'Будинок', 'ਘਰ', 'Acasă', 'နေအိမ်', 'Ile', 'Home'),
(719, 'previous', 'Previous', 'পূর্ববর্তী', 'Anterior', 'سابق', 'पिछला', 'پچھلا', '以前', '前', 'Anterior', 'предыдущий', 'précédent', '너무 이른', 'Bisherige', 'Precedente', 'ก่อน', 'Előző', 'voorgaand', 'priorem', 'Sebelumnya', 'Önceki', 'Προηγούμενος', 'قبلی', 'Sebelum ini', 'మునుపటి', 'முந்தைய', 'અગાઉના', 'Poprzedni', 'Попередній', 'ਪਿਛਲਾ', 'Anterior', 'လွန်ခဲ့သော', 'Tẹlẹ', 'A baya'),
(720, 'last_name', 'Last Name', 'নামের শেষাংশ', 'Apellido', 'الكنية', 'अंतिम नाम', 'آخری نام', '姓 ', '苗字', 'Último nome', 'Фамилия', 'Nom de famille', '성', 'Familienname, Nachname', 'Cognome', 'นามสกุล', 'Vezetéknév', 'Achternaam', 'Cognomen', 'Nama keluarga', 'Soyadı', 'Επίθετο', 'نام خانوادگی', 'Nama terakhir', 'చివరి పేరు', 'கடைசி பெயர்', 'છેલ્લું નામ', 'Nazwisko', 'Прізвище', 'ਆਖਰੀ ਨਾਂਮ', 'Numele de familie', 'မျိုးနွယ်အမည်', 'Oruko idile', 'Sunan mahaifa'),
(721, 'school_fax', 'Fax', 'ফ্যাক্স', 'Fax', 'فاكس', 'फैक्स', 'فیکس', '传真', 'ファックス', 'Fax', 'факс', 'Fax', '팩스', 'Fax', 'Fax', 'แฟกซ์', 'Fax', 'Fax', 'Fax', 'Fax', 'Faks', 'Φαξ', 'فکس', 'Faks', 'ఫ్యాక్స్', 'தொலைநகல்', 'ફેક્સ', 'Faks', 'Факс', 'ਫੈਕਸ', 'Fax', 'ဖက်စ်', 'Faksi', 'Fax'),
(722, 'admission', 'Admission', 'ভর্তি', 'Admisión', 'قبول', 'दाखिला', 'داخلہ', '入场', '入場料', 'Admissão', 'вход', 'Admission', '입장', 'Eintritt', 'Ammissione', 'การรับเข้า', 'Belépés', 'Toelating', 'Praesent', 'Penerimaan', 'kabul', 'Αδεια', 'پذیرش', 'Kemasukan', 'అడ్మిషన్', 'சேர்க்கை', 'પ્રવેશ', 'Wstęp', 'Вхід', 'ਦਾਖ਼ਲਾ', 'Admitere', 'ဝင်ခွင့်ပေးခြင်း', 'Gbigba wọle', 'Shiga'),
(723, 'check_at_least_one', 'Please check at least one checkbox', 'অন্তত একটি চেকবক্স চেক করুন দয়া করে', 'Por favor marque al menos una casilla', 'يرجى التحقق من مربع اختيار واحد على الأقل', 'कृपया कम से कम एक चेकबॉक्स को चेक करें', 'براہ کرم کم از کم ایک چیک باکس چیک کریں', '请至少检查一个复选框', '少なくとも1つのチェックボックスをオンにしてください', 'Por favor, marque pelo menos uma caixa de seleção', 'Установите хотя бы один флажок', 'Veuillez cocher au moins une case', '하나 이상의 확인란을 선택하십시오.', 'Bitte kreuzen Sie mindestens eine Checkbox an', 'Si prega di verificare almeno una casella di controllo', 'โปรดเลือกช่องทำเครื่องหมายอย่างน้อยหนึ่งรายการ', 'Kérjük, ellenőrizze legalább egy jelölőnégyzetet', 'Controleer minimaal één selectievakje', 'Please saltem reprehendo', 'Silakan periksa setidaknya satu kotak centang', 'Lütfen en az bir onay kutusunu işaretleyin', 'Επιλέξτε τουλάχιστον ένα πλαίσιο ελέγχου', 'لطفا حداقل یک کادر را بررسی کنید', 'Sila semak sekurang-kurangnya satu kotak semak', 'దయచేసి కనీసం ఒక చెక్బాక్స్ను తనిఖీ చేయండి', 'குறைந்தது ஒரு பெட்டியை சரிபார்க்கவும்', 'કૃપા કરી ઓછામાં ઓછું એક ચેકબૉક્સ તપાસો', 'Zaznacz co najmniej jedno pole wyboru', 'Перевірте хоча б одну прапорець', 'ਕਿਰਪਾ ਕਰਕੇ ਘੱਟੋ ਘੱਟ ਇੱਕ ਚੈਕਬੌਕਸ ਦੀ ਜਾਂਚ ਕਰੋ', 'Verificați cel puțin o casetă de selectare', 'အနည်းဆုံး checkbox ကိုစစ်ဆေးပါ', 'Jowo ṣayẹwo ṣayẹwo o kere ju apoti kan', 'Da fatan a duba akalla akwati ɗaya'),
(724, 'extra_charge', 'Extra Charge', 'অতিরিক্ত মূল্য', 'Carga extra', 'رسوم اضافية', 'अतिरिक्त प्रभार', 'اضافی چارج', '额外收费', '追加の費用', 'Custo extra', 'Дополнительная плата', 'Supplément', '추가 요금', 'Aufpreis', 'Costo aggiuntivo', 'ค่าบริการพิเศษ', 'Felár', 'Toeslag', 'extra crimen', 'Biaya tambahan', 'Ek ücret', 'Επιπλέον χρέωση', 'هزینه اضافی', 'Caj tambahan', 'అదనపు ధర', 'கூடுதல் கட்டணம்', 'વધારાની કિમત', 'Dodatkowa opłata', 'Додатковий збір', 'ਵਾਧੂ ਚਾਰਜ', 'Tarif suplimentar', 'အပိုငွေကောက်ခံမှု', 'Afikun Afikun', 'Karin caji'),
(725, 'ccavenue', 'CCAvenue', 'সিসি এভিনিউ', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'Ccavenue', 'CCAvenue', 'CCAvenue', 'Επιπλέον χρέωση', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'CCAvenue', 'Ibi Ilana', 'Cibiyar'),
(726, 'merchant_key', 'Merchant Key', 'মার্চেন্ট কি', 'Clave del comerciante', 'مفتاح التاجر', 'व्यापारी कुंजी', 'مرچنٹ کلیدی', '商家钥匙', 'マーチャントキー', 'Chave do comerciante', 'Торговый ключ', 'Clé du marchand', '판매자 키', 'Händlerschlüssel', 'Chiave del commerciante', 'Merchant Key', 'Merchant kulcs', 'Verkopersleutel', 'Key mercator', 'Kunci Pedagang', 'Satıcı Anahtarı', 'Εμπορικό κλειδί', 'کلید تجاری', 'Kunci Pedagang', 'మర్చంట్ కీ', 'Merchant Key', 'વેપારી કી', 'Klucz sprzedawcy', 'Торговельний ключ', 'ਵਪਾਰੀ ਕੁੰਜੀ', 'Cheia comerciantului', 'ကုန်သည် Key ကို', 'Oluṣowo Iṣowo', 'Maɓalli mai ciniki'),
(727, 'merchant_mid', 'Merchant MID', 'মার্চেন্ট মিড্', 'Merchant MID', 'Merchant MID', 'व्यापारी एमआईडी', 'مرچنٹ MID', '商家MID', 'Merchant MID', 'Comerciante MID', 'Merchant MID', 'Marchand MID', '판매자 MID', 'Händler-MID', 'Merchant MID', 'Merchant MID', 'Merchant MID', 'Merchant MID', 'MEDIUS mercator', 'Merchant MID', 'Merchant MID', 'Merchant MID', 'مرچنت MID', 'Merchant MID', 'మర్చెంట్ MID', 'Merchant MID', 'મર્ચન્ટ MID', 'Merchant MID', 'Merchant MID', 'ਵਪਾਰੀ ਮਿਡ', 'Meridian MID', 'ကုန်သည်လယ်', 'Iṣowo Iṣowo', 'MID M'),
(728, 'paytm', 'PayTM', 'পে টিম', 'PayTM', 'PayTM', 'Paytm', 'پی ٹی ٹی ایم', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'BezahlenTM', 'PayTM', 'Paytm', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'Paytm', 'Paytm', 'પેટીએમ', 'PayTM', 'PayTM', 'PayTM', 'PayTM', 'Paytm', 'PayTM', 'PayTM'),
(729, 'website', 'Website', 'ওয়েবসাইট', 'Sitio web', 'موقع الكتروني', 'वेबसाइट', 'ویب سائٹ', '网站', 'ウェブサイト', 'Local na rede Internet', 'Веб-сайт', 'Site Internet', '웹 사이트', 'Webseite', 'Sito web', 'เว็บไซต์', 'Weboldal', 'Website', 'website', 'Situs web', 'Web sitesi', 'Δικτυακός τόπος', 'سایت اینترنتی', 'Laman web', 'వెబ్సైట్', 'இணையதளம்', 'વેબસાઇટ', 'Stronie internetowej', 'Веб-сайт', 'ਵੈੱਬਸਾਇਟ', 'website', 'ဝက်ဘ်ဆိုက်', 'Aaye ayelujara', 'Yanar Gizo'),
(730, 'text_local', 'Text Local', 'টেক্সট লোকাল', 'Texto local', 'نص محلي', 'पाठ स्थानीय', 'متن مقامی', '文字本地', 'テキストローカル', 'Texto local', 'Текстовые локальные', 'Texte local', '텍스트 로컬', 'Text lokal', 'Testo locale', 'ข้อความ Local', 'Helyi szöveg', 'Tekst Lokaal', 'Locus text', 'Teks Lokal', 'Metin Yerel', 'Κείμενο τοπικό', 'متن محلی', 'Teks Tempatan', 'స్థానిక టెక్స్ట్', 'உள்ளூர் உரை', 'ટેક્સ્ટ લોકલ', 'Tekst lokalny', 'Текст локально', 'ਟੈਕਸਟ ਸਥਾਨਕ', 'Text local', 'စာသားမဒေသခံ', 'Ọrọ Agbegbe', 'Text Local'),
(731, 'hash_key', 'Hash Key', 'হ্যাশ কী', 'Clave hash', 'مفتاح التجزئة', 'हैश कुंजी', 'ہش کلیدی', '散列键', 'ハッシュキー', 'Chave de hash', 'Хэш-ключ', 'Touche dièse', '해시 키', 'Hash-Schlüssel', 'Tasto cancelletto', 'คีย์แฮช', 'Hash gomb', 'Hash sleutel', 'Key Nullam', 'Kunci Hash', 'Kare tuşu', 'Κλειδί Hash', 'کلید هش', 'Hash Key', 'హాష్ కీ', 'ஹாஷ் கீ', 'હેશ કી', 'Klucz skrótu', 'Hash Key', 'ਹੈਸ਼ ਕੁੰਜੀ', 'Tasta Diez', 'hash Key ကို', 'Bọtini Iwọn', 'Hash Key'),
(732, 'sms_country', 'SMS Country', 'এস এম এস কান্ট্রি', 'País SMS', 'بلد SMS', 'एसएमएस देश', 'ایس ایم ایس ملک', 'SMS国家', 'SMS国', 'País SMS', 'Страна SMS', 'SMS Pays', 'SMS 국가', 'SMS Land', 'Paese SMS', 'ประเทศ SMS', 'SMS ország', 'SMS-land', 'SMS patriae', 'Negara SMS', 'SMS Ülke', 'SMS Χώρα', 'اس ام اس کشور', 'SMS Negara', 'SMS దేశం', 'SMS நாடு', 'એસએમએસ દેશ', 'Kraj SMS', 'SMS Країна', 'ਐਸਐਮਐਸ ਦੇਸ਼', 'Țara SMS', 'SMS ကိုနိုင်ငံ', 'SMS Latin', 'SMS Country'),
(733, 'school_code', 'School Code', 'স্কুল কোড', 'Código escolar', 'كود مدرسة', 'स्कूल कोड', 'سکول کوڈ', '学号', '学校コード', 'Código escolar', 'Школьный код', 'Code détablissement', '학교 코드', 'Schulcode', 'Codice della scuola', 'รหัสโรงเรียน', 'Iskolák kódja', 'Schoolcode', 'Code School', 'Kode Sekolah', 'Okul Kodu', 'Σχολικός κώδικας', 'کد مدرسه', 'Kod Sekolah', 'స్కూల్ కోడ్', 'பள்ளி குறியீடு', 'શાળા કોડ', 'Kod szkoły', 'Шкільний кодекс', 'ਸਕੂਲ ਕੋਡ', 'Codul școlii', 'ကျောင်းစာအုပ် Code ကို', 'Koodu Ile-iwe', 'Lambar Makarantar'),
(734, 'enable_rtl', 'Enable RTL', 'এনাবল আর টি এল', 'Activar RTL', 'تمكين RTL', 'आरटीएल सक्षम करें', 'RTL کو فعال کریں', '启用RTL', 'RTLを有効にする', 'Ativar RTL', 'Включить RTL', 'Activer RTL', 'RTL 사용', 'Aktivieren Sie RTL', 'Abilita RTL', 'เปิดใช้งาน RTL', 'Engedélyezze az RTL engedélyezését', 'Schakel RTL in', 'Admitte License', 'Aktifkan RTL', 'RTLyi etkinleştir', 'Ενεργοποίηση RTL', 'فعال کردن RTL', 'Dayakan RTL', 'RTL ప్రారంభించు', 'RTL ஐ இயக்கு', 'RTL સક્ષમ કરો', 'Włącz RTL', 'Увімкнути RTL', 'RTL ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ', 'Activează RTL', 'ဘန်ဝစ် Enable', 'Mu RTL ṣiṣẹ', 'Enable RTL'),
(735, 'enable_frontend', 'Enable Frontend', 'এনাবল ফ্রন্টএন্ড', 'Habilitar Frontend', 'تمكين الواجهة الأمامية', 'Frontend सक्षम करें', 'فرنٹ اینڈ کو فعال کریں', '启用前端', 'フロントエンドを有効にする', 'Ativar Frontend', 'Включить Frontend', 'Activer le frontend', '프론트 엔드 사용', 'Frontend aktivieren', 'Abilita Frontend', 'เปิดใช้ Frontend', 'Engedélyezze a Frontendet', 'Frontend inschakelen', 'Admitte Frontend', 'Aktifkan Frontend', 'Ön Uçu Etkinleştir', 'Ενεργοποιήστε το Frontend', 'فعال کردن ظاهر', 'Dayakan Frontend', 'ఫ్రంటెండ్ని ప్రారంభించండి', 'Frontend ஐ இயக்கு', 'અગ્રભાગને સક્ષમ કરો', 'Włącz interfejs użytkownika', 'Увімкнути Frontend', 'ਫਰੰਟਐਂਡ ਨੂੰ ਸਮਰੱਥ ਬਣਾਓ', 'Activați Frontend', 'Frontend Enable', 'Mu Frontend ṣiṣẹ', 'Ƙara Farfaɗa'),
(736, 'session_start_month', 'Session Start Month', 'সেশন শুরু মাস', 'Mes de inicio de sesión', 'شهر بدء الجلسات', 'सत्र प्रारंभ महीना', 'سیشن شروع ماہ', '会议开始月', 'セッション開始月', 'Mês de Início da Sessão', 'Начальный месяц сеанса', 'Mois de début de la session', '세션 시작 달', 'Sitzungsstartmonat', 'Mese di inizio sessione', 'เดือนเริ่มต้นของเซสชัน', 'Session Start Month', 'Sessie startmaand', 'Satus mense Sessio', 'Bulan Awal Sesi', 'Oturum Başlangıç Ayı', 'Μήνας Έναρξης Συνόδου', 'ماه شروع جلسه', 'Bulan Mula Sesi', 'సెషన్ ప్రారంభం నెల', 'அமர்வு தொடக்க மாதம்', 'સત્ર પ્રારંભ મહિનો', 'Miesiąc rozpoczęcia sesji', 'Місяць заснування сесії', 'ਸੈਸ਼ਨ ਸ਼ੁਰੂ ਕਰੋ ਮਹੀਨਾ', 'Luna de începere a sesiunii', 'session Start ကိုလ', 'Akoko Ibere Akọ', 'Zama Saiti'),
(737, 'session_end_month', 'Session End Month', 'সেশন শেষ মাস', 'Mes de final de sesión', 'جلسة نهاية الشهر', 'सत्र अंत महीने', 'اجلاس اختتام ماہ', '会议结束月', 'セッション終了月', 'Mês Final da Sessão', 'Конечный месяц сеанса', 'Session Fin du mois', '세션 종료 월', 'Sitzungsende Monat', 'Sessione Fine mese', 'เดือนสิ้นสุดเซสชัน', 'Session End Hónap', 'Session End Month', 'Sessio finem mense', 'Bulan Akhir Sesi', 'Oturum Bitiş Ayı', 'Μήνας λήξης περιόδου σύνδεσης', 'ماه پایان جلسه', 'Bulan Tamat Sesi', 'సెషన్ ముగింపు నెల', 'அமர்வு முடிவு மாதம்', 'સત્ર સમાપ્તિ મહિનો', 'Miesiąc zakończenia sesji', 'Session End Month', 'ਸੈਸ਼ਨ ਅੰਤ ਦੀ ਮਹੀਨਾ', 'Luna sfârșitului sesiunii', 'session အဆုံးလ', 'Ipari Ilana Ipade', 'Ƙarshen Watan Ƙarshe'),
(738, 'admission_no', 'Admission  No', 'ভর্তি নম্বর', 'Admisión no', 'رقم القبول', 'प्रवेश संख्या', 'داخلہ نمبر', '入场号', '入場無料', 'Admissão Não', 'Вход Нет', 'Admission No', '입장료 없음', 'Eintritt Nr', 'Ingresso n', 'ค่าเข้าชม', 'Felvételi száma', 'Toegangsnummer', 'Praesent nulla', 'Penerimaan No', 'Giriş No', 'Εισαγωγή αριθ', 'پذیرش شماره', 'Kemasukan No', 'అడ్మిషన్ సంఖ్య', 'சேர்க்கை எண்', 'પ્રવેશ નં', 'Miesiąc zakończenia sesji', 'Вхід №', 'ਦਾਖਲਾ ਨੰਬਰ', 'Admitere nr', 'ဝန်ခံချက်အဘယ်သူမျှမ', 'Gbigbawọle Bẹẹkọ', 'Shiga Aa'),
(740, 'age', 'Age', 'বয়স', 'Años', 'عمر', 'आयु', 'عمر', '年龄', '年齢', 'Era', 'Возраст', 'Âge', '나이', 'Alter', 'Età', 'อายุ', 'Kor', 'Leeftijd', 'age', 'Usia', 'Yaş', 'Ηλικία', 'سن', 'Umur', 'వయసు', 'வயது', 'ઉંમર', 'Wiek', 'Вік', 'ਉਮਰ', 'Vârstă', 'အသက်အရွယ်', 'Ọjọ ori', 'Shekaru'),
(741, 'transfer', 'Transfer', 'হস্তান্তর', 'Transferir', 'نقل', 'स्थानांतरण', 'منتقلی', '转让', '転送', 'Transferir', 'Перевод', 'Transfert', '이전', 'Transfer', 'Trasferimento', 'โอน', 'Átruházás', 'Overdracht', 'De translatione', 'Transfer', 'Aktar', 'ΜΕΤΑΦΟΡΑ', 'انتقال', 'Pemindahan', 'ట్రాన్స్ఫర్', 'மாற்றம்', 'પરિવહન', 'Transfer', 'Трансфер', 'ਟ੍ਰਾਂਸਫਰ ਕਰੋ', 'Transfer', 'လွှဲပြောင်း', 'Gbigbe lọ', 'Canja wurin'),
(742, 'health_condition', 'Health Condition', 'স্বাস্থ্যের অবস্থা', 'Estado de salud', 'الحالة الصحية', 'स्वास्थ्य की स्थिति', 'صحت کی کیفیت', '健康状况', '健康状態', 'Condição de saúde', 'Состояние здоровья', 'État de santé', '건강 상태', 'Gesundheitszustand', 'Condizione di salute', 'เงื่อนไขสุขภาพ', 'Egészségi állapot', 'Gezondheid', 'salutem Description', 'Kondisi kesehatan', 'Sağlık durumu', 'Η κατάσταση της υγείας', 'وضعیت سلامتی', 'Keadaan kesihatan', 'ఆరోగ్య స్థితి', 'உடல் நிலை', 'આરોગ્યની સ્થિતિ', 'Stan zdrowia', 'Стан здоровя', 'ਸਿਹਤ ਦੀ ਸਥਿਤੀ', 'Starea de sănătate', 'ကနျြးမာရေးအခြေအနေ', 'Ipo ilera', 'Yanayin Lafiya'),
(743, 'national_id', 'National ID', 'জাতীয় আইডি', 'Identificación nacional', 'الهوية الوطنية', 'राष्ट्रीय पहचान पत्र', 'قومی شناختی', '国民身份证', '国民ID', 'identidade nacional', 'Национальный идентификатор', 'carte didentité', '국립 ID', 'Personalausweis', 'ID nazionale', 'รหัสประจำตัวประชาชน', 'Nemzeti azonosító', 'Nationaal ID', 'National ID', 'ID Nasional', 'Ulusal Kimliği', 'Εθνική ταυτότητα', 'کد ملی', 'ID kebangsaan', 'జాతీయ గుర్తింపు', 'தேசிய ஐடி', 'રાષ્ટ્રીય ID', 'Dowód osobisty', 'Національний ID', 'ਰਾਸ਼ਟਰੀ ਆਈਡੀ', 'buletin', 'အမျိုးသား ID ကို', 'ID orile-ede', 'ID na kasa'),
(744, 'relation_with', 'Relation With Guardian', 'গার্ডিয়ান সঙ্গে সম্পর্ক', 'Relación con Guardian', 'العلاقة مع الجارديان', 'अभिभावक के साथ संबंध', 'گارڈین کے ساتھ تعلقات', '与卫报的关系', 'ガーディアンとの関係', 'Relação Com Guardião', 'Связь с опекуном', 'Relation avec Guardian', '가디언과의 관계', 'Beziehung mit dem Wächter', 'Relazione con Guardian', 'ความสัมพันธ์กับ Guardian', 'Kapcsolat az Őrzővel', 'Relatie met Guardian', 'In relatione Custodes', 'Hubungan dengan Guardian', 'Guardian ile İlişkisi', 'Σχέση με τον Κηδεμόνα', 'رابطه با نگهبان', 'Hubungan dengan Guardian', 'గార్డియన్తో సంబంధం', 'கார்டியன் உடன் உறவு', 'ગાર્ડિયન સાથે સંબંધ', 'Relacja z opiekunem', 'Відношення до опікуна', 'ਗਾਰਡੀਅਨ ਨਾਲ ਸਬੰਧ', 'Relația cu Gardianul', 'ဂါးဒီးယန်းသတင်းစာနှင့်ဆက်ဆံရေး', 'Ibasepo pẹlu Alagbato', 'Abota da Guardian'),
(745, 'education', 'Education', 'শিক্ষা', 'Educación', 'التعليم', 'शिक्षा', 'تعلیم', '教育', '教育', 'Educação', 'образование', 'Éducation', '교육', 'Bildung', 'Formazione scolastica', 'การศึกษา', 'Oktatás', 'Onderwijs', 'Education', 'pendidikan', 'Eğitim', 'Εκπαίδευση', 'تحصیلات', 'Pendidikan', 'చదువు', 'கல்வி', 'શિક્ષણ', 'Edukacja', 'Освіта', 'ਸਿੱਖਿਆ', 'Educaţie', 'ပညာရေး', 'Eko', 'Ilimi'),
(746, 'information', 'Information', 'তথ্য', 'Información', 'معلومات', 'जानकारी', 'معلومات', '信息', '情報', 'Em formação', 'Информация', 'Information', '정보', 'Information', 'Informazione', 'ข้อมูล', 'Információ', 'Informatie', 'Information', 'Informasi', 'Bilgi', 'Πληροφορίες', 'اطلاعات', 'Maklumat', 'సమాచారం', 'தகவல்', 'માહિતી', 'Informacja', 'Інформація', 'ਜਾਣਕਾਰੀ', 'informație', 'သတင်းအချက်အလက်', 'Alaye', 'Bayani'),
(747, 'basic', 'Basic', 'মৌলিক', 'BASIC', 'الأساسية', 'बुनियादी', 'بنیادی', '基本', 'ベーシック', 'Basic', 'основной', 'De base', '기본', 'Basic', 'Di base', 'ขั้นพื้นฐาน', 'Alapvető', 'basis-', 'basic', 'Dasar', 'Temel', 'Βασικός', 'پایه ای', 'Asas', 'ప్రాథమిక', 'அடிப்படை', 'પાયાની', 'Podstawowy', 'Основний', 'ਬੇਸਿਕ', 'De bază', 'အခြေခံပညာ', 'Ipilẹ', 'Basic'),
(748, 'other', 'Other', 'অন্যান্য', 'Otro', 'آخر', 'अन्य', 'دیگر', '其他', 'その他', 'De outros', 'Другие', 'Autre', '다른', 'Andere', 'Altro', 'อื่น ๆ', 'Más', 'anders', 'alius', 'Lain', 'Diğer', 'Αλλα', 'دیگر', 'Lain-lain', 'ఇతర', 'மற்ற', 'અન્ય', 'Inny', 'Інший', 'ਹੋਰ', 'Alte', 'အခြား', 'Miiran', 'Sauran'),
(749, 'contact', 'Contact', 'যোগাযোগ', 'Contacto', 'اتصل', 'संपर्क करें', 'رابطہ کریں', '联系', '接触', 'Contato', 'контакт', 'Contact', '접촉', 'Kontakt', 'Contatto', 'ติดต่อ', 'Kapcsolatba lépni', 'Contact', 'Contact', 'Kontak', 'Temas', 'Επικοινωνία', 'تماس', 'Hubungi', 'సంప్రదించండి', 'தொடர்பு', 'સંપર્ક કરો', 'Kontakt', 'Звязатися', 'ਸੰਪਰਕ ਕਰੋ', 'a lua legatura', 'ထိတှေ့', 'Kan si', 'Saduwa'),
(750, 'academic', 'Academic', 'একাডেমিক', 'Académico', 'أكاديمي', 'अकादमिक', 'تعلیمی', '学术的', 'アカデミック', 'Acadêmico', 'академический', 'Académique', '학생', 'Akademisch', 'Accademico', 'วิชาการ', 'Akadémiai', 'Academic', 'academic', 'Akademik', 'Akademik', 'Ακαδημαϊκός', 'علمی', 'Akademik', 'అకడమిక్', 'அகாடமிக்', 'શૈક્ષણિક', 'Akademicki', 'Академічний', 'ਅਕਾਦਮਿਕ', 'Academic', 'ပညာရေးဆိုင်ရာ', 'Ile ẹkọ', 'Kwalejin'),
(758, 'next_year', 'Next Year', 'আগামী বছর', 'El próximo año', 'العام القادم', 'अगले वर्ष', 'اگلے سال', '明年', '来年', 'Próximo ano', 'Следующий год', 'Lannée prochaine', '내년', 'Nächstes Jahr', 'Lanno prossimo', 'ปีหน้า', 'Következő év', 'Volgend jaar', 'Proximo anno', 'Tahun depan', 'Gelecek yıl', 'Του χρόνου', 'سال آینده', 'Tahun hadapan', 'వచ్చే సంవత్సరం', 'அடுத்த வருடம்', 'આગામી વર્ષ', 'Następny rok', 'Наступного року', 'ਅਗਲੇ ਸਾਲ', 'Anul urmator', 'နောက်နှစ်', 'Odun to nbo', 'Kashe na gaba'),
(759, 'manage_next_year_student', 'Manage Next Year Student', 'পরবর্তী বছর ছাত্র পরিচালনা করুন', 'Administrar estudiante del próximo año', 'إدارة طالب العام القادم', 'अगले वर्ष छात्र को प्रबंधित करें', 'اگلے سال کے طالب علم کا انتظام کریں', '管理明年学生', '来年の学生を管理する', 'Gerenciar o aluno do próximo ano', 'Управление Студентом следующего года', 'Gérer létudiant de lannée prochaine', '다음 학년 학생 관리', 'Verwalten Sie nächstes Jahr Student', 'Gestisci studente del prossimo anno', 'จัดการนักศึกษาปีถัดไป', 'A következő év hallgatójának kezelése', 'Volgend jaar student beheren', 'Curo Next Year Student', 'Kelola Siswa Tahun Depan', 'Gelecek Yıl Öğrenci Yönet', 'Διαχείριση φοιτητής επόμενου έτους', 'مدیریت دانش آموز سال آینده', 'Mengurus Pelajar Tahun Depan', 'తదుపరి ఇయర్ స్టూడెంట్ను నిర్వహించండి', 'அடுத்த ஆண்டு மாணவர் நிர்வகி', 'આગામી વર્ષ વિદ્યાર્થી મેનેજ કરો', 'Zarządzaj przyszłym studentem', 'Управління студентом наступного року', 'ਅਗਲੇ ਸਾਲ ਵਿਦਿਆਰਥੀ ਦਾ ਪ੍ਰਬੰਧ ਕਰੋ', 'Gestionați elevul anului viitor', 'Next ကိုတစ်နှစ်တာကျောင်းသားစီမံခန့်ခွဲရန်', 'Ṣakoso awọn ọmọ-iwe tókàn', 'Sarrafa Ɗabban Kashe na gaba'),
(760, 'enter_purchase_code', 'Enter Purchase Code', 'ক্রয় কোড লিখুন', 'Ingrese el código de compra', 'أدخل رمز الشراء', 'खरीद कोड दर्ज करें', 'خریداری کوڈ درج کریں', '输入购买代码', '購入コードを入力', 'Digite o código de compra', 'Введите код покупки', 'Entrer le code dachat', '구매 코드 입력', 'Geben Sie den Kaufcode ein', 'Inserisci il codice di acquisto', 'ป้อนรหัสการสั่งซื้อ', 'Írja be a beszerzési kódot', 'Voer de aankoopcode in', 'Enter code Purchase', 'Masukkan Kode Pembelian', 'Satınalma kodunu giriniz', 'Εισαγάγετε τον κωδικό αγοράς', 'کد خرید را وارد کنید', 'Masukkan Kod Pembelian', 'కొనుగోలు కోడ్ను నమోదు చేయండి', 'கொள்முதல் கோடு உள்ளிடவும்', 'ખરીદી કોડ દાખલ કરો', 'Wprowadź kod zakupu', 'Введіть код покупки', 'ਖਰੀਦ ਕੋਡ ਦਾਖਲ ਕਰੋ', 'Introduceți codul de cumpărare', 'အရစ်ကျ Code ကိုရိုက်ထည့်ပါ', 'Tẹ koodu rira', 'Shigar da Dokar Siya'),
(761, 'purchase_code', 'Purchase Code', 'ক্রয় কোড', 'Código de compra', 'كود شراء', 'खरीद कोड', 'خریداری کوڈ', '购买代码', '購入コード', 'Código de Compra', 'Код покупки', 'Code dachat', '구매 코드', 'Kaufcode', 'Codice dacquisto', 'รหัสการสั่งซื้อ', 'Vásárlási kód', 'Aankoopcode', 'Purchase Code', 'Kode Pembelian', 'Satın alma kodu', 'Κωδικός αγοράς', 'کد خرید', 'Kod Pembelian', 'కొనుగోలు కోడ్', 'கொள்முதல் கோட்', 'ખરીદી કોડ', 'Kup kod', 'Код покупок', 'ਖਰੀਦ ਕੋਡ', 'Codul de cumpărare', 'အရစ်ကျ Code ကို', 'Koodu rira', 'Katin sayen'),
(762, 'parent', 'Parent', 'পিতামাতা', 'Padre', 'الأبوين', 'माता-पिता', 'والدین', '亲', '親', 'Pai', 'родитель', 'Parent', '부모의', 'Elternteil', 'Genitore', 'ผู้ปกครอง', 'Szülő', 'Ouder', 'parens', 'Induk', 'ebeveyn', 'Μητρική εταιρεία', 'والدین', 'Ibu bapa', 'మాతృ', 'பெற்றோர்', 'માતાપિતા', 'Rodzic', 'Батько', 'ਮਾਪੇ', 'Mamă', 'မိဘ', 'Obi', 'Uba'),
(763, 'written', 'Written', 'লিখিত', 'Escrito', 'مكتوب', 'लिखा हुआ', 'لکھا ہوا', '书面', '書かれた', 'Escrito', 'написано', 'Écrit', '쓴', 'Geschrieben', 'Scritto', 'เขียน', 'Írott', 'Geschreven', 'Scriptum', 'Tertulis', 'Yazılı', 'Γραπτός', 'نوشته شده است', 'Ditulis', 'రాసిన', 'எழுதப்பட்டது', 'લખેલું', 'Pisemny', 'Написано', 'ਲਿਖਿਆ ਗਿਆ', 'Scris', 'Written', 'Kọwe', 'An rubuta'),
(764, 'practical', 'Practical', 'ব্যবহারিক', 'Práctico', 'عملي', 'व्यावहारिक', 'عملی', '实际的', '実践的', 'Prático', 'практический', 'Pratique', '실용적인', 'Praktisch', 'pratico', 'ประยุกต์', 'Gyakorlati', 'praktisch', 'practical', 'Praktis', 'Pratik', 'Πρακτικός', 'کاربردی', 'Praktikal', 'ప్రాక్టికల్', 'நடைமுறை', 'પ્રાયોગિક', 'Praktyczny', 'Практичний', 'ਵਿਹਾਰਕ', 'Practic', 'လက်တွေ့', 'Ilowo', 'M'),
(765, 'tutorial', 'Tutorial', 'টিউটরিআল', 'Tutorial', 'الدورة التعليمية', 'ट्यूटोरियल', 'سبق', '教程', 'チュートリアル', 'Tutorial', 'Руководство', 'Didacticiel', '지도 시간', 'Tutorial', 'lezione', 'เกี่ยวกับการสอน', 'oktatói', 'Tutorial', 'doceo', 'Tutorial', 'Eğitimi', 'Φροντιστήριο', 'آموزش', 'Tutorial', 'ట్యుటోరియల్', 'பயிற்சி', 'ટ્યુટોરીયલ', 'Seminarium', 'Підручник', 'ਟਿਊਟੋਰਿਅਲ', 'Tutorial', 'tutorial', 'Ibaṣepọ', 'Koyawa'),
(766, 'viva', 'Viva', 'ভাইভা', 'Viva', 'تحيا', 'सलाम', 'زبانی', '欢呼声', 'ビバ', 'Viva', 'да здравствует', 'Viva', '만세', 'Viva', 'Viva', 'ขอให้มีอายุยืนยาว', 'éljen', 'Viva', 'Vivaldi', 'Viva', 'sözlü', 'Viva', 'ویوا', 'Viva', 'వివా', 'விவா', 'વિવા', 'Wiwat', 'Віва', 'ਵਿਵਾ', 'Viva', 'Viva', 'Viva', 'Viva'),
(767, 'mark', 'Mark', 'মার্ক', 'marca', 'علامة', 'निशान', 'مارک', '标记', 'マーク', 'Marca', 'отметка', 'marque', '표', 'Kennzeichen', 'marchio', 'เครื่องหมาย', 'Mark', 'Mark', 'Evangelium secundum Marcum', 'Menandai', 'işaret', 'Σημάδι', 'علامت', 'Mark', 'మార్క్', 'மார்க்', 'ચિહ્ન', 'znak', 'Марка', 'ਮਾਰਕ', 'marcă', 'အမှတ်', 'Samisi', 'Mark'),
(768, 'obtain', 'Obtain', 'প্রাপ্ত', 'Obtener', 'الحصول على', 'प्राप्त', 'حاصل کریں', '获得', '入手します', 'Obtivermos', 'получать', 'Obtenir', '얻다', 'Erhalten', 'Ottenere', 'ได้รับ', 'Szerezze', 'Verkrijgen', 'Vitam', 'Memperoleh', 'elde etmek', 'Αποκτώ', 'به دست آوردن', 'Dapatkan', 'పొందటానికి', 'பெறுதல்', 'મેળવો', 'Uzyskać', 'Отримати', 'ਪ੍ਰਾਪਤ ਕਰੋ', 'Obține', 'ရရှိသည်', 'Gba', 'Samun'),
(769, 'result_card', 'Result Card', 'ফলাফল কার্ড', 'Tarjeta de resultado', 'بطاقة النتيجة', 'परिणाम कार्ड', 'نتیجہ کارڈ', '结果卡', '結果カード', 'Cartão de Resultado', 'Карта результатов', 'Carte de résultat', '결과 카드', 'Ergebniskarte', 'Scheda dei risultati', 'การ์ดผลลัพธ์', 'Eredménykártya', 'Resultaatkaart', 'effectus Card', 'Kartu Hasil', 'Sonuç Kartı', 'Κάρτα αποτελεσμάτων', 'نتیجه کارت', 'Kad Keputusan', 'ఫలితం కార్డ్', 'முடிவு அட்டை', 'પરિણામ કાર્ડ', 'Karta wyników', 'Результат картки', 'ਨਤੀਜਾ ਕਾਰਡ', 'Cardul de rezultate', 'ရလဒ် Card ကို', 'Kaadi Kaadi', 'Katin Amintacce'),
(770, 'bus_stop', 'Bus Stop', 'বাস স্টপ', 'Parada de autobús', 'موقف باص', 'बस स्टॉप', 'بس اسٹاپ', '公交车站', 'バス停', 'Ponto de ônibus', 'Автобусная остановка', 'Arrêt de bus', '버스 정류장', 'Bushaltestelle', 'Fermata dellautobus', 'ป้ายรถเมล์', 'Buszmegálló', 'Bushalte', 'bus Sistere', 'Pemberhentian bus', 'Otobüs durağı', 'Στάση λεωφορείου', 'ایستگاه اتوبوس', 'Perhentian bas', 'బస్ స్టాప్', 'பேருந்து நிறுத்தம்', 'બસ સ્ટોપ', 'Przystanek autobusowy', 'Автобусна зупинка', 'ਬੱਸ ਅੱਡਾ', 'Stație de autobuz', 'ဘတ်စ်ကားမှတ်တိုင်', 'Ibudo oko', 'Bus Stop'),
(771, 'grade', 'Grade', 'গ্রেড', 'Grado', 'درجة', 'ग्रेड', 'گریڈ', '年级', 'グレード', 'Grau', 'класс', 'Qualité', '학년', 'Klasse', 'Grado', 'เกรด', 'Fokozat', 'Rang', 'gradus', 'Kelas', 'sınıf', 'Βαθμός', 'مقطع تحصیلی', 'Gred', 'గ్రేడ్', 'தர', 'ગ્રેડ', 'Stopień', 'Оцінка', 'ਗਰੇਡ', 'calitate', 'grade', 'Ipele', 'Grade'),
(772, 'point', 'Point', 'পয়েন্ট', 'Punto', 'نقطة', 'बिंदु', 'پوائنٹ', '点', 'ポイント', 'Ponto', 'точка', 'Point', '포인트', 'Punkt', 'Punto', 'จุด', 'Pont', 'Punt', 'Point', 'Titik', 'Puan', 'Σημείο', 'نقطه', 'Titik', 'పాయింట్', 'புள்ளி', 'બિંદુ', 'Punkt', 'Точка', 'ਬਿੰਦੂ', 'Punct', 'အမှတ်', 'Ojuami', 'Point'),
(773, 'lowest', 'Lowest', 'সর্বনিম্ন', 'Más bajo', 'أدنى', 'सबसे कम', 'سب سے کم', '最低', '最低', 'Menor', 'низший', 'Le plus bas', '최저', 'Niedrigste', 'minore', 'ต่ำที่สุด', 'A legalacsonyabb', 'laagste', 'lowest', 'Terendah', 'En düşük', 'Χαμηλότερο', 'پایین ترین', 'Terendah', 'అత్యల్ప', 'குறைந்த', 'ન્યૂનતમ', 'Najniższy', 'Найменший', 'ਸਭ ਤੋਂ ਘੱਟ', 'Cel mai mic', 'နိမ့်ဆုံး', 'Ti o kere julọ', 'Ƙananan'),
(774, 'height', 'Height', 'সর্বোচ্চ', 'Altura', 'ارتفاع', 'ऊंचाई', 'اونچائی', '高度', '高さ', 'Altura', 'Высота', 'la taille', '신장', 'Höhe', 'Altezza', 'ความสูง', 'Magasság', 'Hoogte', 'altitudo', 'Tinggi', 'Yükseklik', 'Υψος', 'ارتفاع', 'Ketinggian', 'ఎత్తు', 'உயரம்', 'ઊંચાઈ', 'Wysokość', 'Висота', 'ਕੱਦ', 'Înălţime', 'အမြင့်', 'Iga', 'Hawan'),
(775, 'position', 'Position', 'অবস্থান', 'Posición', 'موضع', 'पद', 'مقام', '位置', 'Position', 'Posição', 'Должность', 'Position', '위치', 'Position', 'Posizione', 'ตำแหน่ง', 'Pozíció', 'Positie', 'statum', 'Posisi', 'pozisyon', 'Θέση', 'موقعیت', 'Jawatan', 'స్థానం', 'நிலை', 'પોઝિશન', 'Pozycja', 'Позиція', 'ਸਥਿਤੀ', 'Poziţie', 'ရာထူး', 'Ipo', 'Matsayi'),
(776, 'merit_list', 'Merit List', 'মেধা তালিকা', 'Lista de mérito', 'قائمة الاستحقاق', 'मेरिट सूची', 'میرٹ کی فہرست', '优点列表', 'メリットリスト', 'Lista de Mérito', 'Список заслуг', 'Liste de mérite', '장점 목록', 'Leistungsliste', 'Lista dei Meriti', 'รายชื่อบุญ', 'Érdemjegy', 'Merit List', 'merito List', 'Daftar Kelebihan', 'Liyakat listesi', 'Λίστα αξιών', 'فهرست شایستگی', 'Senarai Merit', 'మెరిట్ జాబితా', 'தகுதி பட்டியல்', 'મેરિટ લિસ્ટ', 'Lista zasłużonych', 'Список заслуг', 'ਮੈਰਿਟ ਲਿਸਟ', 'Lista de merit', 'ကောင်းမှုကုသိုလ်များစာရင်း', 'Àtòkọ Ẹrọ', 'Lissafin Ƙasa'),
(777, 'passed', 'Passed', 'উত্তীর্ণ', 'Pasado', 'مرت', 'बीतने के', 'منظور', '通过', '合格', 'Passado', 'Прошло', 'Passé', '합격', 'Bestanden', 'Passato', 'ผ่าน', 'elmúlt', 'Geslaagd', 'transierunt', 'Lulus', 'geçti', 'Πέρασε', 'گذشت', 'Lulus', 'Passed', 'கடந்து', 'પસાર થઈ', 'Przeszedł', 'Пройдено', 'ਪਾਸ ਹੋਇਆ', 'A trecut', 'လွန်', 'Ti kọja', 'An wuce'),
(778, 'failed', 'Failed', 'ব্যর্থ', 'Ha fallado', 'فشل', 'अनुत्तीर्ण होना', 'ناکام', '失败', '失敗', 'Falhou', 'Не смогли', 'Échoué', '실패한', 'Gescheitert', 'mancato', 'ล้มเหลว', 'nem sikerült', 'mislukt', 'Deficio', 'Gagal', 'Başarısız oldu', 'Απέτυχε', 'ناموفق', 'Gagal', 'విఫలమైంది', 'தோல்வி', 'નિષ્ફળ થયું', 'Nie powiodło się', 'Помилка', 'ਅਸਫਲ', 'A eșuat', 'Failed', 'Kuna', 'Ba a yi nasarar ba'),
(779, 'manage_result', 'Manage Result', 'ফলাফল পরিচালনা করুন', 'Administrar el resultado', 'إدارة النتيجة', 'परिणाम प्रबंधित करें', 'نتائج کا نظم کریں', '管理结果', '結果を管理する', 'Gerenciar resultado', 'Управление результатами', 'Gérer le résultat', '결과 관리', 'Ergebnis verwalten', 'Gestisci risultato', 'จัดการผลลัพธ์', 'Eredmény kezelése', 'Resultaat beheren', 'curo results', 'Kelola Hasil', 'Sonucu Yönet', 'Διαχείριση αποτελεσμάτων', 'مدیریت نتیجه', 'Uruskan Keputusan', 'ఫలితాన్ని నిర్వహించండి', 'முடிவு நிர்வகி', 'પરિણામ મેનેજ કરો', 'Zarządzaj wynikiem', 'Управління результатом', 'ਨਤੀਜਾ ਪ੍ਰਬੰਧਿਤ ਕਰੋ', 'Gestionați rezultatul', 'ရလဒ်စီမံခန့်ခွဲရန်', 'Ṣiṣe Abajade', 'Sarrafa sakamakon'),
(780, 'manage', 'Manage', 'পরিচালনা করুন', 'Gestionar', 'تدبير', 'प्रबंधित', 'انتظام کریں', '管理', '管理', 'Gerir', 'управлять', 'Gérer', '꾸리다', 'Verwalten', 'Gestire', 'จัดการ', 'kezel', 'beheren', 'curo', 'Mengelola', 'yönetme', 'Διαχειρίζονται', 'مدیریت کردن', 'Mengurus', 'నిర్వహించడానికి', 'நிர்வகிக்கவும்', 'મેનેજ કરો', 'Zarządzanie', 'Керувати', 'ਪ੍ਰਬੰਧ ਕਰਨਾ, ਕਾਬੂ ਕਰਨਾ', 'Administra', 'စီမံခန့်ခွဲရန်', 'Ṣakoso', 'Sarrafa'),
(781, 'admitted', 'Admitted', 'ভর্তি', 'Aceptado', 'اعترف', 'स्वीकार किया', 'اعتراف', '承认', '授与された', 'Admitido', 'Допускаются', 'Admis', '수락 한', 'Zugelassen', 'Ammesso', 'ที่ยอมรับ', 'Felvételt nyer', 'toegelaten', 'admissus', 'Mengakui', 'kabul edilmiş', 'Παράδεκτος', 'پذیرفته', 'Diterima', 'చేరినవారి', 'அனுமதிக்கப்பட்டார்', 'સ્વીકૃત', 'Przyznał', 'Прийнято', 'ਦਾਖਲ', 'Admis', 'ဝန်ခံ', 'Ti gba', 'Admitted'),
(782, 'promoted', 'Promoted', 'উন্নীত', 'Promovido', 'رقية', 'प्रचारित', 'فروغ دیا', '提拔', 'プロモート', 'Promovido', 'Повышен', 'Promu', '승격 된', 'Gefördert', 'Promossa', 'การเลื่อนตำแหน่ง', 'promotált', 'gepromoveerd', 'promoted', 'Dipromosikan', 'Tanıtılan', 'Προωθήθηκε', 'ترویج شده', 'Dipromosikan', 'ప్రమోట్', 'விளம்பர', 'બઢતી', 'Lansowany', 'Промотований', 'ਪ੍ਰਮੋਟ ਕੀਤਾ', 'Promovat', 'ရာထူးတိုး', 'Igbegaga', 'Ci gaba'),
(783, 'drop_out', 'Drop Out', 'বাদ পরা', 'Abandonar', 'أوقع', 'ड्रॉप आउट', 'باہر چھوڑ', '退出', '脱落', 'Cair fora', 'Выбывать', 'Abandonner', '탈락', 'Aussteigen', 'Buttare fuori', 'ปล่อยออก', 'Kidobni', 'Afvaller', 'EXSTILLO', 'Keluar', 'Bırakmak', 'Εγκαταλείπω', 'رها کردن', 'Tercicir', 'వదిలివేయడం', 'வெளியேற்று', 'છોડી દીધેલ', 'Wycofać się', 'Викинути', 'ਛੱਡ ਦੇਣਾ', 'Renunța', 'နှုတ်ထွက်သည်', 'Eniti o ko lati se nkan', 'Daina'),
(784, 'advanced', 'Advanced', 'অগ্রিম', 'Avanzado', 'المتقدمة', 'उन्नत', 'اعلی درجے کی', '高级', '上級', 'Avançado', 'продвинутый', 'Avancée', '많은', 'Fortgeschritten', 'Avanzate', 'สูง', 'Fejlett', 'gevorderd', 'provectus', 'Maju', 'ileri', 'Προχωρημένος', 'پیشرفته', 'Advanced', 'ఆధునిక', 'மேம்பட்ட', 'અદ્યતન', 'zaawansowane', 'Розширений', 'ਤਕਨੀਕੀ', 'Avansat', 'အဆင့်မြင့်', 'Ti ni ilọsiwaju', 'Na ci gaba'),
(785, 'collection', 'Collection', 'সংগ্রহ', 'Colección', 'مجموعة', 'संग्रह', 'مجموعہ', '采集', 'コレクション', 'Coleção', 'Коллекция', 'Collection', '수집', 'Sammlung', 'Collezione', 'ชุด', 'Gyűjtemény', 'Verzameling', 'collectio', 'Koleksi', 'Toplamak', 'Συλλογή', 'مجموعه', 'Koleksi', 'కలెక్షన్', 'சேகரிப்பு', 'સંગ્રહ', 'Kolekcja', 'Колекція', 'ਭੰਡਾਰ', 'Colectie', 'စုဆောင်းမှု', 'Gbigba', 'Tarin'),
(786, 'avg_of_all_exam', 'Average of All Exam', 'সব পরীক্ষার গড়', 'Promedio de todos los exámenes', 'متوسط كل الامتحانات', 'सभी परीक्षा का औसत', 'تمام امتحانوں کا اوسط', '所有考试的平均值', 'すべての試験の平均', 'Média de todos os exames', 'Среднее значение всего экзамена', 'Moyenne de tous les examens', '모든 시험의 평균', 'Durchschnitt aller Prüfungen', 'Media di tutti gli esami', 'ค่าเฉลี่ยของการสอบทั้งหมด', 'Átlagos összes vizsgája', 'Gemiddelde van alle examen', 'Omnes mediocris de nito', 'Rata-Rata Semua Ujian', 'Tüm sınavın ortalaması', 'Μέσος όρος όλων των εξετάσεων', 'میانگین امتحانات', 'Purata Semua Peperiksaan', 'అన్ని పరీక్షల సగటు', 'அனைத்து தேர்வு சராசரி', 'તમામ પરીક્ષાનું સરેરાશ', 'Średnia wszystkich egzaminów', 'Середній бал усіх іспитів', 'ਸਭ ਪ੍ਰੀਖਿਆ ਦਾ ਔਸਤ', 'Media tuturor examenelor', 'အားလုံးစာမေးပွဲ၏ပျမ်းမျှ', 'Iwọn ti Gbogbo Ayẹwo', 'Matsayin Duk Kwara'),
(787, 'only_of_fianl_exam', 'Only Based on Final Exam', 'শুধু ফাইনাল পরীক্ষার ভিত্তিতে', 'Solo basado en el examen final', 'يعتمد فقط على الاختبار النهائي', 'केवल अंतिम परीक्षा के आधार पर', 'صرف حتمی امتحان کی بنیاد پر', '仅基于期末考试', '最終試験のみに基づいて', 'Apenas com base no exame final', 'Только на основе итогового экзамена', 'Seulement basé sur lexamen final', '최종 시험에만 근거 함', 'Nur basierend auf der Abschlussprüfung', 'Solo in base allesame finale', 'ขึ้นอยู่กับการสอบปลายภาค', 'Csak a záróvizsga alapján', 'Alleen gebaseerd op eindexamen', 'Ex tantum Exam', 'Hanya Berdasarkan Ujian Akhir', 'Sadece Final Sınavına Dayalı', 'Βασίζεται μόνο στην τελική εξέταση', 'فقط بر اساس آزمون نهایی', 'Hanya Berdasarkan Peperiksaan Akhir', 'అంతిమ పరీక్షల ఆధారంగా మాత్రమే', 'இறுதி தேர்வு அடிப்படையில் மட்டுமே', 'માત્ર અંતિમ પરીક્ષા પર આધારિત', 'Tylko na podstawie egzaminu końcowego', 'Тільки на підставі остаточного іспиту', 'ਕੇਵਲ ਅੰਤਿਮ ਪ੍ਰੀਖਿਆ ਦੇ ਆਧਾਰ ਤੇ', 'Numai pe baza examenului final', 'သာနောက်ဆုံးစာမေးပွဲအပေါ် အခြေခံ.', 'Nikan Da lori Igbeyewo Ayẹwo', 'Binciken Bincike ne kawai'),
(788, 'template', 'Template', 'টেমপ্লেট', 'Modelo', 'قالب', 'खाका', 'سانچے', '模板', 'テンプレート', 'Modelo', 'шаблон', 'Modèle', '주형', 'Vorlage', 'Modello', 'แบบ', 'Sablon', 'Sjabloon', 'Home', 'Template', 'şablon', 'Πρότυπο', 'قالب', 'Templat', 'మూస', 'டெம்ப்ளேட்', 'ઢાંચો', 'Szablon', 'Шаблон', 'ਟੈਂਪਲੇਟ', 'Format', 'template', 'Awoṣe', 'Samfurin'),
(789, 'absent', 'Absent', 'অনুপস্থিত', 'Ausente', 'غائب', 'अनुपस्थित', 'غیر حاضر', '缺席', '不在', 'Ausente', 'Нет на месте', 'Absent', '없는', 'Abwesend', 'Assente', 'ขาด', 'Hiányzó', 'Afwezig', 'absens', 'Tidak hadir', 'Yok', 'Απών', 'غایب', 'Tidak hadir', 'ఆబ్సెంట్', 'இருக்காது', 'ગેરહાજર', 'Nieobecny', 'Відсутня', 'ਗੈਰਹਾਜ਼ਰੀ', 'Absent', 'မရှိသော', 'Ti ko ni', 'Ba ya nan'),
(790, 'due_fee', 'Due Fee', 'বাকি ফি', 'Cuota debida', 'الرسوم المستحقة', 'शुल्क शुल्क', 'وجہ سے فیس', '到期费用', '延滞料', 'Taxa devida', 'Должная плата', 'Frais dus', '연회비', 'Fällige Gebühr', 'Tariffa dovuta', 'ค่าธรรมเนียมครบกำหนด', 'Díjköteles', 'Verschuldigde vergoeding', 'ob pretium', 'Uang Muka', 'Due Ücreti', 'Προκαταβολή', 'پرداخت هزینه', 'Bayaran terhutang', 'ఈ రుసుము', 'கட்டண கட்டணம்', 'નિયુક્ત ફી', 'Należna opłata', 'Декларація', 'ਨਿਯੁਕਤੀ ਫੀਸ', 'Taxă de plată', 'ကြောင့်ကြေး', 'Nitori Owo', 'Saboda haraji'),
(791, 'activity_log', 'Activity Log', 'কার্য বিবরণ', 'Registro de actividades', 'سجل النشاطات', 'गतिविधि लॉग', 'سرگرمی لاگ ان', '活动日志', '活動記録', 'Registro de atividade', 'Журнал активности', 'Journal dactivité', '활동 로그', 'Aktivitätsprotokoll', 'Registro delle attività', 'บันทึกกิจกรรม', 'Naplót', 'Activiteiten logboek', 'Actio iniuriarum', 'Log aktivitas', 'Etkinlik Günlüğü', 'Αρχείο καταγραφής δραστηριότητας', 'گزارش فعالیت', 'Log aktiviti', 'కార్యాచరణ లాగ్', 'நடவடிக்கை பதிவு', 'પ્રવૃત્તિ લૉગ', 'Dziennik aktywności', 'Журнал активності', 'ਸਰਗਰਮੀ ਲਾਗ', 'Jurnalul de activitate', 'လှုပ်ရှားမှုမှတ်တမ်း', 'Wọle iṣẹ', 'Sabis na Ayyuka'),
(792, 'generate_csv', 'Generate CSV', 'সিএসভি তৈরি করুন', 'Generar CSV', 'إنشاء ملف CSV', 'सीएसवी उत्पन्न करें', 'CSV بنائیں', '生成CSV', 'CSVを生成する', 'Gerar CSV', 'Создание CSV', 'Générer un fichier CSV', 'CSV 생성', 'CSV generieren', 'Genera CSV', 'สร้าง CSV', 'CSV létrehozása', 'CSV genereren', 'CSV generate', 'Hasilkan CSV', 'CSV oluştur', 'Δημιουργία CSV', 'ایجاد CSV', 'Menjana CSV', 'CSV ను సృష్టించండి', 'CSV ஐ உருவாக்கவும்', 'CSV જનરેટ કરો', 'Wygeneruj plik CSV', 'Створити CSV', 'ਸੀਐਸਵੀ ਬਣਾਉ', 'Generați CSV', 'CSV ကို Generate', 'Fi CSV ti o lagbara', 'Samar da CSV'),
(793, 'csv_file', 'CSV File', 'সিএসভি ফাইল', 'Archivo CSV', 'ملف CSV', 'सीएसवी फ़ाइल', 'CSV فائل', 'CSV文件', 'CSVファイル', 'Arquivo CSV', 'Файл CSV', 'Fichier CSV', 'CSV 파일', 'CSV-Datei', 'File CSV', 'ไฟล์ CSV', 'CSV fájl', 'CSV-bestand', 'File CSV', 'File CSV', 'CSV Dosyası', 'Αρχείο CSV', 'فایل CSV', 'Fail CSV', 'CSV ఫైల్', 'CSV கோப்பு', 'CSV ફાઇલ', 'Plik CSV', 'CSV-файл', 'CSV ਫਾਈਲ', 'Fișier CSV', 'CSV ဖိုင်ဖိုင်မှတ်တမ်း', 'Faili CSV', 'Fayil ɗin CSV'),
(794, 'id', 'ID', 'আইডি', 'CARNÉ DE IDENTIDAD', 'هوية شخصية', 'आईडी', 'ID', 'ID', 'ID', 'identidade', 'Я БЫ', 'ID', '신분증', 'ICH WÜRDE', 'ID', 'ID', 'ID', 'ID kaart', 'id', 'ID', 'İD', 'ταυτότητα', 'شناسه', 'ID', 'ID', 'ஐடி', 'ID', 'ID', 'Ідентифікатор', 'ID', 'ID-ul', 'ID ကို', 'ID', 'ID'),
(795, 'bulk_student_instruction_1', 'At first select the Class and Section', 'প্রথমে ক্লাস এবং বিভাগ নির্বাচন করুন', 'Al principio, seleccione la Clase y la Sección', 'في البداية حدد الفصل والقسم', 'पहले कक्षा और अनुभाग का चयन करें', 'سب سے پہلے کلاس اور سیکشن کو منتخب کریں', '首先选择Class和Section', 'まずクラスとセクションを選択します。', 'Inicialmente selecione a Classe e Seção', 'Сначала выберите класс и раздел', 'Au début, sélectionnez la classe et la section', '먼저 클래스와 섹션을 선택하십시오.', 'Wählen Sie zunächst die Klasse und den Abschnitt aus', 'Inizialmente seleziona la classe e la sezione', 'ตอนแรกให้เลือก Class และ Section', 'Először válassza ki az osztályt és a szakaszt', 'Selecteer eerst de klasse en sectie', '§ eligere et in primo classis', 'Mula-mula pilih Kelas dan Bagian', 'İlk önce Sınıf ve Bölümü seçin', 'Αρχικά επιλέξτε την κλάση και την ενότητα', 'ابتدا کلاس و بخش را انتخاب کنید', 'Pada mulanya pilih Kelas dan Bahagian', 'మొదట క్లాస్ మరియు సెక్షన్ ఎంచుకోండి', 'முதலில் வகுப்பு மற்றும் பிரிவு தேர்ந்தெடுக்கவும்', 'પ્રથમ વર્ગ અને વિભાગ પસંદ કરો', 'Najpierw wybierz klasę i sekcję', 'Спочатку виберіть клас і розділ', 'ਪਹਿਲਾਂ ਕਲਾਸ ਅਤੇ ਸੈਕਸ਼ਨ ਦੀ ਚੋਣ ਕਰੋ', 'Mai întâi selectați Clasa și secțiunea', 'ပထမဦးဆုံးမှာအတန်းအစားနှင့်ပုဒ်မကို select', 'Ni akọkọ yan Kilasi ati Abala', 'Da farko zaɓi Class da Sashe'),
(796, 'bulk_student_instruction_2', 'Generate CSV file', 'সিএসভি ফাইল তৈরি করুন', 'Generar archivo CSV', 'إنشاء ملف CSV', 'सीएसवी फ़ाइल जेनरेट करें', 'CSV فائل بنائیں', '生成CSV文件', 'CSVファイルを生成する', 'Gerar arquivo CSV', 'Создание файла CSV', 'Générer un fichier CSV', 'CSV 파일 생성', 'Generieren Sie eine CSV-Datei', 'Genera file CSV', 'สร้างไฟล์ CSV', 'CSV fájl létrehozása', 'Genereer CSV-bestand', 'CSV lima generate', 'Hasilkan file CSV', 'CSV dosyası oluştur', 'Δημιουργία αρχείου CSV', 'ایجاد فایل CSV', 'Buat fail CSV', 'CSV ఫైల్ను సృష్టించండి', 'CSV கோப்பை உருவாக்கவும்', 'CSV ફાઇલ જનરેટ કરો', 'Wygeneruj plik CSV', 'Створити файл CSV', 'CSV ਫਾਈਲ ਉਤਪੰਨ ਕਰੋ', 'Generați fișierul CSV', 'CSV ဖိုင် Generate', 'Fifẹ CSV faili', 'Samar da fayil CSV'),
(797, 'bulk_student_instruction_3', 'Open the downloaded CSV file and enter student information with unique email', 'ডাউনলোড করা সিএসভি ফাইলটি খুলুন এবং ইউনিক ইমেলের মাধ্যমে শিক্ষার্থী তথ্য প্রবেশ করুন', 'Abra el archivo CSV descargado e ingrese la información del estudiante con un correo electrónico único', 'افتح ملف CSV الذي تم تنزيله وأدخل معلومات الطالب برسالة بريد إلكتروني فريدة', 'डाउनलोड की गई CSV फ़ाइल खोलें और अद्वितीय ईमेल के साथ छात्र जानकारी दर्ज करें', 'ڈاؤن لوڈ کردہ CSV فائل کو کھولیں اور طالب علم کی معلومات کو منفرد ای میل کے ساتھ درج کریں', '打开下载的CSV文件，并使用唯一的电子邮件输入学生信息', 'ダウンロードしたCSVファイルを開き、ユニークなメールで学生情報を入力してください', 'Abra o arquivo CSV baixado e insira as informações do aluno com e-mail exclusivo', 'Откройте загруженный CSV-файл и введите информацию о студенте с уникальным адресом электронной почты', 'Ouvrez le fichier CSV téléchargé et entrez les informations sur létudiant avec un e-mail unique', '다운로드받은 CSV 파일을 열어 고유 한 이메일 주소로 학생 정보를 입력하십시오.', 'Öffnen Sie die heruntergeladene CSV-Datei und geben Sie die Schülerinformationen mit einer eindeutigen E-Mail-Adresse ein', 'Apri il file CSV scaricato e inserisci le informazioni dello studente con une-mail univoca', 'เปิดไฟล์ CSV ที่ดาวน์โหลดและใส่ข้อมูลของนักเรียนด้วยอีเมลที่ไม่ซ้ำกัน', 'Nyissa meg a letöltött CSV-fájlt, és adja meg a hallgatói adatokat egyedi e-mail címmel', 'Open het gedownloade CSV-bestand en geef studentinformatie op met unieke e-mail', 'Downloaded CSV lima notitia aperire et intrare studiosum cum unique inscriptio', 'Buka file CSV yang diunduh dan masukkan informasi siswa dengan email unik', 'İndirilen CSV dosyasını açın ve benzersiz e-posta ile öğrenci bilgilerini girin', 'Ανοίξτε το αρχείο CSV που κατεβάσατε και εισάγετε τις πληροφορίες σπουδαστών με μοναδικά μηνύματα ηλεκτρονικού ταχυδρομείου', 'فایل CSV دانلود شده را باز کنید و اطلاعات دانشجویی را با ایمیل منحصر به فرد وارد کنید', 'Buka fail CSV yang dimuat turun dan masukkan maklumat pelajar dengan e-mel yang unik', 'డౌన్లోడ్ చేసిన CSV ఫైల్ను తెరిచి విద్యార్థి ఇమెయిల్ సమాచారాన్ని ఏకైక ఇమెయిల్తో నమోదు చేయండి', 'பதிவிறக்கம் செய்யப்பட்ட CSV கோப்பை திறந்து, தனிப்பட்ட மின்னஞ்சல் மூலம் மாணவர் தகவலை உள்ளிடவும்', 'ડાઉનલોડ કરેલ CSV ફાઇલને ખોલો અને અનન્ય ઇમેઇલ સાથે વિદ્યાર્થી માહિતી દાખલ કરો', 'Otwórz pobrany plik CSV i wprowadź informacje o uczniu za pomocą unikatowego adresu e-mail', 'Відкрийте завантажений файл CSV та введіть інформацію про студент із унікальною електронною адресою', 'ਡਾਊਨਲੋਡ ਕੀਤੀ CSV ਫਾਈਲ ਖੋਲੋ ਅਤੇ ਵਿਲੱਖਣ ਈਮੇਲ ਦੇ ਨਾਲ ਵਿਦਿਆਰਥੀ ਜਾਣਕਾਰੀ ਦਰਜ ਕਰੋ', 'Deschideți fișierul CSV descărcat și introduceți informații despre student cu e-mail unic', 'ဒေါင်း CSV ဖိုင်ကိုဖွင့်ပြီးထူးခြားတဲ့အီးမေးလ်နှင့်ကျောင်းသားသတင်းအချက်အလက်ထည့်သွင်း', 'Šii faili CSV ti a gba lati ayelujara ati tẹ alaye ile-iwe pẹlu alaye imeeli ti o yatọ', 'Bude fayil din CSV da aka sauke kuma shigar da bayanan dalibai tare da imel na musamman');
INSERT INTO `languages` (`id`, `label`, `english`, `bengali`, `spanish`, `arabic`, `hindi`, `urdu`, `chinese`, `japanese`, `portuguese`, `russian`, `french`, `korean`, `german`, `italian`, `thai`, `hungarian`, `dutch`, `latin`, `indonesian`, `turkish`, `greek`, `persian`, `malay`, `telugu`, `tamil`, `gujarati`, `polish`, `ukrainian`, `panjabi`, `romanian`, `burmese`, `yoruba`, `hausa`) VALUES
(798, 'bulk_student_instruction_4', 'Take the Guardian ID from Guardian list', 'গার্ডিয়ান তালিকা থেকে গার্ডিয়ান আইডি নিন', 'Tome la ID de Guardian de la lista de Guardian', 'خذ بطاقة الجارديان من قائمة الجارديان', 'अभिभावक सूची से गार्जियन आईडी लें', 'گارڈین کی شناخت سے گارڈین کی فہرست لے لو', '从Guardian列表中获取Guardian ID', 'GuardianリストからGuardian IDを取得する', 'Pegue o Guardian ID da lista do Guardian', 'Возьмите идентификатор Guardian из списка Guardian', 'Prenez lidentifiant Guardian de la liste Guardian', 'Guardian 목록에서 Guardian ID 가져 오기', 'Nimm die Wächter-ID aus der Wächterliste', 'Prendi lID Guardian dallelenco dei guardiani', 'นำ ID Guardian จากรายการ Guardian', 'Vegye a Guardian azonosítót a Guardian listából', 'Neem de Guardian ID van de Guardian-lijst', 'Guardiani accipere a Guardiano id album', 'Ambil ID Guardian dari daftar Guardian', 'Guardian IDsini Guardian listesinden alın', 'Πάρτε τον κωδικό Guardian από τη λίστα Guardian', 'نگاهی به شناسه نگهبان از فهرست گاردین', 'Ambil ID Guardian dari senarai Guardian', 'గార్డియన్ ఐడి నుండి గార్డియన్ ఐడిని తీసుకోండి', 'கார்டியன் ஐடி கார்டியன் பட்டியலில் இருந்து எடுத்துக் கொள்ளுங்கள்', 'ગાર્ડિયન સૂચિમાંથી ગાર્ડિયન ID લો', 'Weź identyfikator Guardian z listy Guardian', 'Візьміть ідентифікатор опікуна з списку охоронців', 'ਗਾਰਡੀਅਨ ਸੂਚੀ ਤੋਂ ਗਾਰਡੀਅਨ ਆਈਡੀ ਲਵੋ', 'Luați ID-ul Guardian din lista Guardian', 'ဂါးဒီးယန်း list ကနေဂါးဒီးယန်း ID ကိုယူပါ', 'Mu ID IDE kuro lati akojọ Awọn olutọju', 'Ɗauki ID na Guardian daga jerin sunayen Guardian'),
(799, 'bulk_student_instruction_5', 'Save the edited CSV file', 'সম্পাদিত সিএসভি  ফাইল সংরক্ষণ করুন', 'Guarde el archivo CSV editado', 'احفظ ملف CSV الذي تم تحريره', 'संपादित सीएसवी फ़ाइल सहेजें', 'ترمیم شدہ CSV فائل کو محفوظ کریں', '保存已编辑的CSV文件', '編集したCSVファイルを保存する', 'Salve o arquivo CSV editado', 'Сохранить отредактированный файл CSV', 'Enregistrez le fichier CSV modifié', '편집 된 CSV 파일 저장', 'Speichern Sie die bearbeitete CSV-Datei', 'Salva il file CSV modificato', 'บันทึกไฟล์ CSV ที่แก้ไขแล้ว', 'Mentse a szerkesztett CSV fájlt', 'Sla het bewerkte CSV-bestand op', 'CSV lima edited by salvificem', 'Simpan file CSV yang diedit', 'Düzenlenen CSV dosyasını kaydet', 'Αποθηκεύστε το επεξεργασμένο αρχείο CSV', 'فایل CSV ویرایش شده را ذخیره کنید', 'Simpan fail CSV yang diedit', 'సవరించిన CSV ఫైల్ను సేవ్ చేయండి', 'திருத்தப்பட்ட CSV கோப்பை சேமி', 'સંપાદિત CSV ફાઇલ સાચવો', 'Zapisz edytowany plik CSV', 'Зберегти редагований файл CSV', 'ਸੰਪਾਦਿਤ CSV ਫਾਈਲ ਸੁਰੱਖਿਅਤ ਕਰੋ', 'Salvați fișierul CSV editat', 'အဆိုပါ edited CSV ဖိုင် Save', 'Fipamọ faili CSV ti o satunkọ', 'Ajiye fayil ɗin CSV da aka gyara'),
(800, 'bulk_student_instruction_6', 'Upload again CSV file you just edited and submit', 'এডিট করা ফাইলটি আবার আপলোড করুন এবং সাবমিট করুন', 'Sube de nuevo el archivo CSV que acabas de editar y enviar', 'قم بتحميل ملف CSV مرة أخرى قمت بتحريره وإرساله', 'फिर से संपादित और जमा करें CSV फ़ाइल अपलोड करें', 'دوبارہ ترمیم کریں اور جمع کرائیں CSV فائل دوبارہ اپ لوڈ کریں', '再次上传您刚编辑并提交的CSV文件', '編集して送信したCSVファイルを再度アップロードする', 'Carregue novamente o ficheiro CSV que acabou de editar e envie', 'Загрузите снова CSV-файл, который вы только что отредактировали и отправили', 'Téléchargez à nouveau le fichier CSV que vous venez déditer et de soumettre', '방금 수정하고 제출 한 CSV 파일을 다시 업로드하십시오.', 'Laden Sie erneut die CSV-Datei hoch, die Sie gerade bearbeitet und gesendet haben', 'Carica di nuovo il file CSV che hai appena modificato e invia', 'อัปโหลดอีกครั้งไฟล์ CSV ที่คุณเพิ่งแก้ไขและส่ง', 'Töltse meg újra a szerkesztett és benyújtott CSV fájlt', 'Upload opnieuw CSV-bestand dat u zojuist hebt bewerkt en verzendt', 'CSV lima upload denuo edidit et vos iustus submittere', 'Unggah lagi file CSV yang baru saja Anda edit dan kirim', 'Düzenlediğiniz ve gönderdiğiniz yeni CSV dosyasını tekrar yükleyin', 'Ανεβάστε ξανά αρχείο CSV που μόλις επεξεργαστήκατε και υποβάλατε', 'دوباره فایل CSV را که ویرایش کرده اید بارگذاری کنید و ارسال کنید', 'Muat naik fail CSV yang baru sahaja anda edit dan hantar', 'మళ్ళీ అప్లోడ్ CSV ఫైల్ మీరు సవరించిన మరియు సమర్పించండి', 'பதிவேற்ற மீண்டும் CSV கோப்பை நீங்கள் திருத்தப்பட்டு சமர்ப்பிக்கவும்', 'તમે હમણાં સંપાદિત અને સબમિટ કરો છો તે CSV ફાઇલ ફરીથી અપલોડ કરો', 'Prześlij ponownie plik CSV, który właśnie edytowałeś i przesłałeś', 'Завантажте файл CSV, який ви щойно редагували та подали', 'ਦੁਬਾਰਾ CSV ਫਾਈਲ ਅਪਲੋਡ ਕਰੋ ਜੋ ਤੁਸੀਂ ਹੁਣੇ ਸੰਪਾਦਿਤ ਅਤੇ ਪ੍ਰਸਤੁਤ ਕਰਦੇ ਹੋ', 'Încărcați din nou fișierul CSV pe care tocmai l-ați editat și trimis', 'CSV ဖိုင်ရုံ edited သင် file များနှင့်တင်သွင်းသည်နောက်တဖန် Upload လုပ်ပါ', 'Ṣe atunse faili CSV ti o ṣatunkọ ati firanṣẹ', 'Shigar da fayil ɗin CSV kawai da aka gyara da kuma mika shi'),
(801, 'manage_activity', 'Manage Activity', 'কার্যকলাপ পরিচালনা করুন', 'Administrar actividad', 'إدارة النشاط', 'गतिविधि प्रबंधित करें', 'سرگرمی کا نظم کریں', '管理活动', 'アクティビティの管理', 'Gerenciar atividade', 'Управление деятельностью', 'Gérer lactivité', '활동 관리', 'Aktivität verwalten', 'Gestisci attività', 'จัดการกิจกรรม', 'Tevékenység kezelése', 'Activiteit beheren', 'curo activitate', 'Kelola Aktivitas', 'Etkinliği Yönet', 'Διαχείριση της δραστηριότητας', 'مدیریت فعالیت', 'Urus Aktiviti', 'కార్యాచరణను నిర్వహించండి', 'செயல்பாட்டை நிர்வகி', 'પ્રવૃત્તિનું સંચાલન કરો', 'Zarządzaj aktywnością', 'Керування діяльністю', 'ਸਰਗਰਮੀ ਵਿਵਸਥਿਤ ਕਰੋ', 'Gestionați activitatea', 'Activity ကိုစီမံခန့်ခွဲရန်', 'Ṣakoso Awọn aṣayan iṣẹ', 'Sarrafa Ayyukan'),
(802, 'activity', 'Activity', 'কার্যকলাপ', 'Actividad', 'نشاط', 'गतिविधि', 'سرگرمی', '活动', 'アクティビティ', 'Atividade', 'Мероприятия', 'Activité', '활동', 'Aktivität', 'Attività', 'กิจกรรม', 'Tevékenység', 'Activiteit', 'actio', 'Aktivitas', 'Aktivite', 'Δραστηριότητα', 'فعالیت', 'Aktiviti', 'కార్యాచరణ', 'செயல்பாடு', 'પ્રવૃત્તિ', 'Czynność', 'Діяльність', 'ਸਰਗਰਮੀ', 'Activitate', 'လှုပ်ရှားမှု', 'Iṣẹ', 'Ayyuka'),
(803, 'default_time_zone', 'Default Time Zone', 'ডিফল্ট টাইম জোন', 'Zona horaria predeterminada', 'المنطقة الزمنية الافتراضية', 'डिफ़ॉल्ट समय क्षेत्र', 'ڈیفالٹ ٹائم زون', '默认时区', 'デフォルトのタイムゾーン', 'Fuso horário padrão', 'Часовой пояс по умолчанию', 'Fuseau horaire par défaut', '기본 시간대', 'Standardzeitzone', 'Fuso orario predefinito', 'เขตเวลาเริ่มต้น', 'Alapértelmezett időzóna', 'Standaard tijdzone', 'Default Time Zone', 'Zona Waktu Default', 'Varsayılan Zaman Dilimi', 'Προεπιλεγμένη ζώνη ώρας', 'منطقه زمانی پیش فرض', 'Zon Masa Lalai', 'డిఫాల్ట్ టైమ్ జోన్', 'இயல்புநிலை நேர மண்டலம்', 'ડિફૉલ્ટ સમય ઝોન', 'Domyślna strefa czasowa', 'Часовий пояс за замовчуванням', 'ਡਿਫਾਲਟ ਸਮਾਂ ਜ਼ੋਨ', 'Fusul orar implicit', 'default အချိန်ဇုန်', 'Aago Aago Aiyipada', 'Yanayin lokaci na tsohuwar'),
(804, 'check_all', 'Check All', 'সব টিক চিহ্ন দিন', 'Verificar todo', 'تحقق من الكل', 'सभी की जांच करो', 'سب چیک کریں', '选择所有', 'すべてチェック', 'Verificar tudo', 'Отметить все', 'Vérifie tout', '모두 확인', 'Alle überprüfen', 'Seleziona tutto', 'เลือกทั้งหมด', 'Ellenőrizni mind', 'Controleer alles', 'reprehendo omnes', 'Periksa Semua', 'Tümünü Kontrol Et', 'Ελεγξε τα ολα', 'بررسی همه', 'Memeriksa semua', 'అన్నింటినీ తనిఖీ చేయండి', 'எல்லாம் சரிபார்க்கவும்', 'બધા તપાસો', 'Zaznacz wszystkie', 'Перевірити все', 'ਸਾਰੇ ਚੈੱਕ ਕਰੋ', 'Selectați toate', 'အားလုံးစစ်ပါ', 'Ṣayẹwo Gbogbo', 'Duba Duk'),
(805, 'uncheck_all', 'Uncheck All', 'সব টিক চিহ্ন তুলে দিন', 'Desmarcar todo', 'الغاءالكل', 'सब को अचयनित करें', 'سبھی کو نشان زد کریں', '取消所有', 'すべてのチェックを外す', 'Desmarcar todos', 'Снять все', 'Décocher tout', '모두 선택 취소', 'Alle deaktivieren', 'Deseleziona tutto', 'ยกเลิกการเลือกทั้งหมด', 'Minden választás törlése', 'Deselecteer alles', 'omnes Licens', 'Jangan tandai semua', 'Tümünü işaretleme', 'Αποεπιλογή όλων', 'همه موارد را از حالت انتخاب خارج کنید', 'Nyahtanda Semua', 'అన్నీ తనిఖీ చేయి', 'அனைத்தையும் அகற்றவும்', 'બધાને અનચેક કરો', 'Odznacz wszystkie', 'Зніміть прапорець біля всіх', 'ਸਭ ਹਟਾਓ', 'Deselecteaza tot', 'Uncheck အားလုံး', 'Ṣii Gbogbo rẹ', 'Cire Dukkan'),
(806, 'statement', 'Statement', 'স্টেটমেন্ট', 'Declaración', 'بيان', 'बयान', 'بیان', '声明', 'ステートメント', 'Declaração', 'утверждение', 'Déclaration', '성명서', 'Erklärung', 'dichiarazione', 'คำแถลง', 'Nyilatkozat', 'Uitspraak', 'dicitur', 'Pernyataan', 'Beyan', 'Δήλωση', 'بیانیه', 'Kenyataan', 'ప్రకటన', 'அறிக்கை', 'નિવેદન', 'Komunikat', 'Заява', 'ਬਿਆਨ', 'Afirmație', 'ထုတ်ပြန်ချက်', 'Gbólóhùn', 'Bayanin'),
(807, 'transaction', 'Transaction', 'লেনদেন', 'Transacción', 'عملية تجارية', 'लेन-देन', 'ٹرانزیکشن', '交易', 'トランザクション', 'Transação', 'Сделка', 'Transaction', '트랜잭션', 'Transaktion', 'Transazione', 'การซื้อขาย', 'Tranzakció', 'Transactie', 'transaction', 'Transaksi', 'işlem', 'Συναλλαγή', 'معامله', 'Transaksi', 'లావాదేవీ', 'பரிவர்த்தனை', 'વ્યવહાર', 'Transakcja', 'Транзакція', 'ਟ੍ਰਾਂਜੈਕਸ਼ਨ', 'Tranzacţie', 'ကိစ္စ', 'Iṣowo', 'Maamala'),
(808, 'debit', 'Debit', 'ডেবিট', 'Débito', 'مدين', 'नामे', 'ڈیبٹ', '借方', 'デビット', 'Débito', 'Дебет', 'Débit', '차변', 'Lastschrift', 'Addebito', 'หักบัญชี', 'tartozás', 'Debiteren', 'Debita', 'Debet', 'borç', 'Χρέωση', 'بدهی', 'Debit', 'డెబిట్', 'டெபிட்', 'ડેબિટ', 'Obciążyć', 'Дебет', 'ਡੈਬਿਟ', 'Debit', 'debit', 'Debit', 'Haɗi'),
(809, 'credit', 'Credit', 'ক্রেডিট', 'Crédito', 'ائتمان', 'श्रेय', 'کریڈٹ', '信用', 'クレジット', 'Crédito', 'кредит', 'Crédit', '신용', 'Kredit', 'Credito', 'เครดิต', 'Hitel', 'Credit', 'fidem', 'Kredit', 'Kredi', 'Πίστωση', 'اعتبار', 'Kredit', 'క్రెడిట్', 'கடன்', 'ક્રેડિટ', 'Kredyt', 'Кредит', 'ਕ੍ਰੈਡਿਟ', 'Credit', 'အကြွေး', 'Ike', 'Credit'),
(810, 'reset_user_email', 'Reset User Email', 'ব্যবহারকারীর ইমেল রিসেট করুন', 'Restablecer correo electrónico', 'إعادة تعيين البريد الإلكتروني للمستخدم', 'उपयोगकर्ता ईमेल रीसेट करें', 'صارف ای میل ری سیٹ کریں', '重置用户电子邮件', 'ユーザーの電子メールをリセットする', 'Redefinir email do usuário', 'Сброс электронной почты пользователя', 'Réinitialiser lemail', '사용자 이메일 재설정', 'Benutzer-E-Mail zurücksetzen', 'Reimposta e-mail utente', 'รีเซ็ตอีเมลผู้ใช้', 'Felhasználói e-mail visszaállítása', 'Reset gebruikersmail', 'Mobile Version Email', 'Setel ulang Email Pengguna', 'Kullanıcı e-postasını sıfırla', 'Επαναφορά ηλεκτρονικού ταχυδρομείου χρήστη', 'تنظیم مجدد ایمیل کاربر', 'Tetapkan semula E-mel Pengguna', 'యూజర్ ఇమెయిల్ను రీసెట్ చేయండి', 'பயனர் மின்னஞ்சல் மீட்டமை', 'વપરાશકર્તા ઇમેઇલ ફરીથી સેટ કરો', 'Zresetuj e-mail użytkownika', 'Скинути електронну адресу користувача', 'ਰੀਸੈਟ ਯੂਜਰ ਈਮੇਲ', 'Resetați e-mailul utilizatorului', 'အသုံးပြုသူအီးမေးလ် Reset', 'Atunto Olumulo Olumulo', 'Sake saitin Imel mai amfani'),
(811, 'reset_email', 'Reset Email', 'ইমেল রিসেট করুন', 'Restablecer Email', 'إعادة تعيين البريد الإلكتروني', 'ईमेल रीसेट करें', 'ای میل ری سیٹ کریں', '重置邮箱', '電子メールをリセットする', 'Redefinir email', 'Сбросить электронную почту', 'Reset Email', '이메일 재설정', 'E-Mail zurücksetzen', 'Ripristina email', 'รีเซ็ตอีเมล', 'E-mail visszaállítása', 'Reset e-mail', 'Reddere praeferentias Email', 'Setel ulang Email', 'E-postayı sıfırla', 'Επαναφορά ηλεκτρονικού ταχυδρομείου', 'تنظیم مجدد ایمیل', 'Tetapkan semula E-mel', 'ఇమెయిల్ను రీసెట్ చేయండి', 'மின்னஞ்சல் மீட்டமை', 'ઇમેઇલ ફરીથી સેટ કરો', 'Zresetuj email', 'Скидання електронної пошти', 'ਈਮੇਲ ਦੁਬਾਰਾ ਸੈਟ ਕਰੋ', 'Resetați e-mailul', 'အီးမေးလ် Reset', 'Tunto Imeeli', 'Sake saita Imel'),
(812, 'date_format', 'Date Format', 'ডেট ফরমেট', 'Formato de fecha', 'صيغة التاريخ', 'डेटा प्रारूप', 'تاریخ کی شکل', '日期格式', '日付形式', 'Formato de data', 'Формат даты', 'Format de date', '날짜 형식', 'Datumsformat', 'Formato data', 'รูปแบบวันที่', 'Dátum formátum', 'Datumnotatie', 'Forma Date', 'Format tanggal', 'Tarih formatı', 'Μορφή ημερομηνίας', 'فرمت تاریخ', 'Format tarikh', 'తేదీ ఫార్మాట్', 'தேதி வடிவமைப்பு', 'તારીખ ફોર્મેટ', 'Format daty', 'Формат дати', 'ਤਾਰੀਖ ਫਾਰਮੈਟ', 'Formatul datei', 'နေ့စွဲပုံစံ', 'Ọjọ kika', 'Kwanan wata Tsarin'),
(813, 'social', 'Social', 'সামাজিক', 'Social', 'اجتماعي', 'सामाजिक', 'سماجی', '社会', 'ソーシャル', 'Social', 'Социальное', 'Social', '사회적인', 'Sozial', 'Sociale', 'สังคม', 'Társadalmi', 'sociaal', 'Social', 'Sosial', 'Sosyal', 'Κοινωνικός', 'اجتماعی', 'Sosial', 'సామాజిక', 'சமூக', 'સામાજિક', 'Społeczny', 'Соціальний', 'ਸਮਾਜਿਕ', 'Social', 'လူမှုရေး', 'Awujọ', 'Social'),
(814, 'position_in_class', 'Position in Class', 'ক্লাসে অবস্থান', 'Posición en clase', 'موقف في الصف', 'कक्षा में स्थिति', 'کلاس میں مقام', '在课堂上的位置', 'クラス内の位置', 'Posição na classe', 'Должность в классе', 'Position en classe', '클래스의 위치', 'Position in der Klasse', 'Posizione in classe', 'ตำแหน่งในชั้นเรียน', 'Pozíció az osztályban', 'Positie in de klas', 'Statum Paleonemertea Class', 'Posisi di Kelas', 'Sınıftaki pozisyonu', 'Θέση στην τάξη', 'موقعیت در کلاس', 'Kedudukan dalam Kelas', 'తరగతి లో స్థానం', 'வகுப்பில் நிலை', 'વર્ગમાં સ્થાન', 'Pozycja w klasie', 'Позиція в класі', 'ਕਲਾਸ ਵਿਚ ਸਥਿਤੀ', 'Poziția în clasă', 'အတန်းအစားထဲမှာရာထူး', 'Ipo ni Kilasi', 'Matsayi a Class'),
(815, 'position_in_section', 'Position in Section', 'বিভাগে অবস্থান', 'Posición en la Sección', 'موقف في القسم', 'खंड में स्थिति', 'سیکشن میں مقام', '在部分中的位置', 'セクション内の位置', 'Posição na seção', 'Должность в разделе', 'Position dans la section', '섹션의 위치', 'Position im Abschnitt', 'Posizione nella sezione', 'ตำแหน่งในส่วน', 'Pozíció a fejezetben', 'Positie in sectie', 'Situ Art', 'Posisi dalam Bagian', 'Bölümdeki pozisyon', 'Θέση στην Ενότητα', 'موقعیت در بخش', 'Kedudukan dalam Seksyen', 'విభాగంలో స్థానం', 'பிரிவில் நிலை', 'વિભાગમાં સ્થાન', 'Pozycja w sekcji', 'Позиція в розділі', 'ਸੈਕਸ਼ਨ ਵਿੱਚ ਸਥਿਤੀ', 'Poziția în secțiune', 'Section မှာရာထူး', 'Ipo ni Abala', 'Matsayi a Sashi'),
(816, 'percentage', 'Percentage', 'শতকরা হার', 'Porcentaje', 'النسبة المئوية', 'प्रतिशत', 'فی صد', '百分比', 'パーセンテージ', 'Percentagem', 'процент', 'Pourcentage', '백분율', 'Prozentsatz', 'Percentuale', 'ร้อยละ', 'Százalék', 'Percentage', 'CENTESIMA', 'Persentase', 'Yüzde', 'Ποσοστό', 'درصد', 'Peratusan', 'శాతం', 'சதவிதம்', 'ટકાવારી', 'Odsetek', 'Відсоток', 'ਪ੍ਰਤੀਸ਼ਤ', 'Procent', 'ရာခိုင်နှုန်း', 'Ogorun', 'Kashi'),
(817, 'principal', 'Principal', 'অধ্যক্ষ', 'Director de escuela', 'المالك', 'प्रधान अध्यापक', 'پرنسپل', '主要', '主要な', 'Diretor', 'принципал', 'Principal', '주요한', 'Schulleiter', 'Principale', 'หลัก', 'Fő', 'principaal', 'principalem', 'Kepala Sekolah', 'anapara', 'ΔΙΕΥΘΥΝΤΡΙΑ σχολειου', 'سرپرست', 'Pengetua', 'ప్రిన్సిపాల్', 'முதல்வர்', 'આચાર્યશ્રી', 'Dyrektor', 'Головний', 'ਪ੍ਰਿੰਸੀਪਲ', 'Principal', 'ကြောငျးအုပျကွီး', 'Ilana', 'Babban'),
(819, 'registration', 'Registration', 'নিবন্ধন', 'Registro', 'التسجيل', 'पंजीकरण', 'رجسٹریشن', '注册', '登録', 'Cadastro', 'Постановка на учет', 'enregistrement', '기재', 'Anmeldung', 'Registrazione', 'การลงทะเบียน', 'Bejegyzés', 'registratie', 'Registration', 'Pendaftaran', 'kayıt', 'Εγγραφή', 'ثبت', 'Pendaftaran', 'నమోదు', 'பதிவு', 'નોંધણી', 'Rejestracja', 'Реєстрація', 'ਰਜਿਸਟਰੇਸ਼ਨ', 'Înregistrare', 'မှတ်ပုံတင်ခြင်း', 'Iforukọ', 'Rijistar'),
(820, 'feedback', 'Feedback', 'প্রতিক্রিয়া', 'Realimentación', 'ردود الفعل', 'प्रतिक्रिया', 'تاثرات', '反馈', 'フィードバック', 'Comentários', 'Обратная связь', 'Retour d\'information', '피드백', 'Feedback', 'Risposta', 'ผลตอบรับ', 'Visszacsatolás', 'terugkoppeling', 'feedback', 'Umpan balik', 'geri bildirim', 'Ανατροφοδότηση', 'بازخورد', 'Maklumbalas', 'అభిప్రాయం', 'பின்னூட்டம்', 'પ્રતિક્રિયા', 'Sprzężenie zwrotne', 'Зворотній зв\'язок', 'ਸੁਝਾਅ', 'Parere', 'တုံ့ပြန်ချက်', 'Idahun', 'Feedback'),
(821, 'super_admin', 'Super Admin', 'সুপার অ্যাডমিন', 'Super admin', 'مشرف متميز', 'सुपर व्यवस्थापक', 'سپر ایڈمن', '超级管理员', 'スーパー管理者', 'Super Admin', 'Супер администратор', 'Super Admin', '수퍼 관리자', 'höchster Vorgesetzter', 'Super Admin', 'ผู้ดูแลระบบขั้นสูง', 'Super Admin', 'Superbeheerder', 'super Maecenas et ipsum', 'Admin Super', 'Süper Yönetici', 'Super Admin', 'مدیر فوق العاده', 'Super Admin', 'సూపర్ అడ్మిన్', 'சூப்பர் நிர்வாகம்', 'સુપર એડમિન', 'Superadministrator', 'Супер адміністратор', 'ਸੁਪਰ ਐਡਮਿਨ', 'Super Admin', 'စူပါအဒ်မင်', 'Super abojuto', 'Super Admin'),
(822, 'is_publish', 'Is Publish?', 'প্রকাশ করা হয়?', 'Es publicar?', 'هل تنشر؟', 'प्रकाशित है?', 'شائع کیا ہے؟', '发布了吗？', 'パブリッシュですか？', 'É publicar?', 'Опубликован?', 'Est Publier?', '게시 하시겠습니까?', 'Ist Veröffentlichen?', 'È pubblico?', 'เผยแพร่แล้วหรือไม่?', 'Publikál?', 'Is publiceren?', 'Auditum est?', 'Apakah Publikasikan?', 'Yayınlanıyor mu?', 'Είναι η δημοσίευση;', 'انتشار است؟', 'Adakah Terbitkan?', 'ప్రచురించాలా?', 'வெளியிட வேண்டுமா?', 'પ્રકાશિત છે?', 'Czy publikujesz?', 'Опублікувати?', 'ਕੀ ਪਬਲਿਸ਼ ਹੈ?', 'Este publicat?', 'Publish သလဲ?', 'Ṣe Atọjade?', 'Ana Buga?'),
(823, 'location', 'Location', 'অবস্থান', 'Ubicación', 'موقعك', 'स्थान', 'مقام', '地点', 'ロケーション', 'Localização', 'Место нахождения', 'Emplacement', '위치', 'Ort', 'Posizione', 'ที่ตั้ง', 'Elhelyezkedés', 'Plaats', 'Location', 'Lokasi', 'yer', 'Τοποθεσία', 'محل', 'Lokasi', 'స్థానం', 'இருப்பிடம்', 'સ્થાન', 'Lokalizacja', 'Розташування', 'ਸਥਾਨ', 'Locație', 'တည်နေရာ', 'Ipo', 'Yanayi'),
(824, 'header', 'Header', 'হেডার', 'Encabezamiento', 'رأس', 'हैडर', 'ہیڈر', '头', 'ヘッダ', 'Cabeçalho', 'заголовок', 'Entête', '머리글', 'Header', 'Intestazione', 'ส่วนหัว', 'Fejléc', 'hoofd', 'header', 'Header', 'Başlık', 'Επί κεφαλής', 'سرتیتر', 'Kepala', 'శీర్షిక', 'தலைப்பு', 'હેડર', 'nagłówek', 'Заголовок', 'ਹੈਡਰ', 'Antet', 'header', 'Akọsori', 'Rubuta'),
(825, 'brand', 'Brand', 'ব্র্যান্ড', 'Marca', 'علامة تجارية', 'ब्रांड', 'برانڈ', '牌', 'ブランド', 'Marca', 'марка', 'Marque', '상표', 'Marke', 'Marca', 'ส่วนหัว', 'Márka', 'Merk', 'Brand', 'Merek', 'Marka', 'Μάρκα', 'نام تجاری', 'Jenama', 'బ్రాండ్', 'பிராண்ட்', 'બ્રાન્ડ', 'Marka', 'Бренд', 'ਬ੍ਰਾਂਡ', 'Marca', 'အမှတ်တံဆိပ်', 'Brand', 'Alamar'),
(826, 'google_analytics', 'Google Analytics', 'গুগল এনালিটিক্স', 'Google analitico', 'تحليلات كوكل', 'गूगल विश्लेषिकी', 'گوگل تجزیہ کار', '谷歌分析', 'グーグルアナリティクス', 'Google Analytics', 'Гугл Аналитика', 'Google Analytics', 'Google 애널리틱스', 'Google Analytics', 'statistiche di Google', 'Google Analytics', 'A Google Analytics', 'Google Analytics', 'Google Analytics', 'Google Analytics', 'Google Analytics', 'Google Analytics', 'تجزیه و تحلیل ترافیک گوگل', 'Google Analytics', 'గూగుల్ విశ్లేషణలు', 'கூகுள் அனலிட்டிக்ஸ்', 'ગૂગલ ઍનલિટિક્સ', 'Google Analytics', 'Google Analytics', 'ਗੂਗਲ ਵਿਸ਼ਲੇਸ਼ਣ', 'Google Analytics', 'Google Analytics', 'Atupale Google', 'Google Analytics'),
(827, 'have_any_question', 'Have you any question?', 'আপনার কোন প্রশ্ন আছে?', '¿Tienes alguna pregunta?', 'هل لديك أي سؤال؟', 'क्या आपका कोई सवाल है?', 'کیا آپ کا کوئی سوال ہے', '你有什么问题吗？', '何か質問ありますか？', 'Você tem alguma pergunta?', 'У вас есть вопрос?', 'Avez-vous une question?', '질문 있니?', 'Hast du eine Frage?', 'Hai qualche domanda?', 'คุณมีคำถามหรือไม่?', 'Kérdése van?', 'Heb je een vraag?', 'Have vos interrogare?', 'Apakah Anda punya pertanyaan?', 'Bir sorunuz var mı?', 'Έχετε κάποια ερώτηση;', 'آیا شما هر گونه سوال', 'Adakah anda mempunyai soalan?', 'మీకు ఏదైనా ప్రశ్న ఉందా?', 'உங்களிடம் ஏதாவது கேள்வி இருக்கிறதா?', 'શું તમને કોઈ પ્રશ્ન છે?', 'Masz jakieś pytanie?', 'У вас є якесь питання?', 'ਕੀ ਤੁਹਾਨੂੰ ਕੋਈ ਸਵਾਲ ਹੈ?', 'Aveți vreo întrebare?', 'သင်သည်မည်သည့်မေးခွန်းရှိပါသလား?', 'Ṣe o ni eyikeyi ibeere?', 'Shin kuna da wata tambaya?'),
(828, 'call_us', 'Call us', 'আমাদের কল করুন', 'Llamanos', 'اتصل بنا', 'हमें बुलाओ', 'ہمیں بلائیں', '打电话给我们', 'お電話ください', 'Ligue para nós', 'Позвоните нам', 'Appelez nous', '전화주세요.', 'Ruf uns an', 'Chiamaci', 'โทรหาเรา', 'Hívjon bennünket', 'Bel ons', 'nos voca', 'Hubungi kami', 'Bizi arayın', 'Καλέστε μας', 'با ما تماس بگیرید', 'Hubungi kami', 'మాకు కాల్ చేయండి', 'எங்களை அழை', 'અમને કૉલ કરો', 'Zadzwoń do nas', 'Зателефонуйте нам', 'ਸਾਨੂੰ ਕਾਲ ਕਰੋ', 'Sună-ne', 'ကျွန်တော်တို့ကို Call', 'Pe wa', 'Kira mana'),
(829, 'email_us', 'Email us', 'আমাদেরকে ইমেইল করুন', 'Envíenos un correo electrónico', 'أرسل لنا', 'हमे ईमेल करे', 'ہمیں ای میل کریں', '电邮我们', '私達に電子メールを送り', 'Envia-nos um email', 'Свяжитесь с нами по электронной почте', 'Envoyez-nous un email', '이메일 문의', 'Schreiben Sie uns eine E-Mail', 'Mandaci una email', 'ส่งอีเมลถึงเรา', 'Küldj egy emailt nekünk', 'Email ons', 'email us', 'Email kami', 'Bize e-posta', 'Στείλτε μας email', 'به ما ایمیل بزنید', 'Email kami', 'మాకు ఇమెయిల్ చేయండి', 'எங்களுக்கு மின்னஞ்சல்', 'અમને ઇમેઇલ કરો', 'Wyślij do nas e-mail', 'Напишіть нам', 'ਸਾਨੂੰ ਈਮੇਲ ਕਰੋ', 'Trimite-ti-ne un e-mail', 'ကျွန်တော်တို့ကိုအီးမေး', 'Imeeli wa', 'Email mu'),
(830, 'welcome_to', 'Welcome to', 'স্বাগতম', 'Bienvenido a', 'مرحبا بك في', 'में स्वागत', 'میں خوش آمدید', '欢迎来到', 'ようこそ', 'Bem-vindo ao', 'Добро пожаловать в', 'Bienvenue à', '에 오신 것을 환영합니다', 'Willkommen zu', 'Benvenuto a', 'ยินดีต้อนรับสู่', 'Isten hozott a', 'Welkom bij', 'gratam', 'Selamat Datang di', 'Hoşgeldiniz', 'Καλωσόρισες στο', 'خوش آمدید به', 'Selamat datang ke', 'స్వాగతం', 'வரவேற்கிறோம்', 'સ્વાગત', 'Witamy w', 'Ласкаво просимо до', 'ਸਵਾਗਤ ਹੈ', 'Bun venit la', 'မှလှိုက်လှဲစွာကြိုဆိုပါသည်', 'Kaabo si', 'Barka da zuwa'),
(831, 'now', 'Now', 'এখন', 'Ahora', 'الآن', 'अभी व', 'ابھی', '现在', '今', 'Agora', 'Сейчас', 'À présent', '지금', 'Jetzt', 'Adesso', 'ตอนนี้', 'Most', 'Nu', 'autem', 'Sekarang', 'şimdi', 'Τώρα', 'اکنون', 'Sekarang', 'ఇప్పుడు', 'இப்போது', 'હવે', 'Teraz', 'Зараз', 'ਹੁਣ', 'Acum', 'ယခု', 'Bayi', 'Yanzu'),
(832, 'our', 'Our', 'আমাদের', 'Nuestro', 'لنا', 'हमारी', 'ہمارا', '我们的', '私たち', 'Nosso', 'наш', 'Notre', '우리의', 'Unsere', 'Nostro', 'ของเรา', 'a', 'Onze', 'nostrum', 'Kami', 'bizim', 'Μας', 'ما', 'Kami', 'మా', 'எங்கள்', 'અમારું', 'Nasz', 'Наша', 'ਸਾਡਾ', 'Al nostru', 'ကျွန်တော်တို့၏', 'Wa', 'Mu'),
(833, 'facilities', 'Facilities', 'সু্যোগ  সুবিধা', 'Instalaciones', 'مرافق', 'सुविधाएं', 'سہولیات', '设备', '施設', 'Instalações', 'оборудование', 'Installations', '시설', 'Anlagen', 'Strutture', 'สิ่งอำนวยความสะดวก', 'Felszerelés', 'uitrusting', 'facilities', 'Fasilitas', 'tesisler', 'Εγκαταστάσεις', 'امکانات', 'Kemudahan', 'సౌకర్యాలు', 'வசதிகள்', 'સુવિધાઓ', 'Udogodnienia', 'Засоби', 'ਸੁਵਿਧਾਵਾਂ', 'Facilităţi', 'အဆောက်အဦးများ', 'Awọn ohun elo', 'Ayyuka'),
(834, 'experienced', 'Experienced', 'অভিজ্ঞ', 'Experimentado', 'يختبر', 'अनुभव', 'تجربہ کار', '有经验的', '経験豊富な', 'Com experiência', 'опытный', 'Expérimenté', '숙련 된', 'Erfahren', 'Esperto', 'มีประสบการณ์', 'Tapasztalt', 'Ervaren', 'periti', 'Berpengalaman', 'Deneyimli', 'Εμπειρος', 'با تجربه', 'Berpengalaman', 'అనుభవజ్ఞులైన', 'அனுபவமிக்க', 'અનુભવી', 'Doświadczony', 'Досвідчений', 'ਤਜਰਬੇਕਾਰ', 'Cu experienta', 'တွေ့ကြုံ', 'Ti ni iriri', 'Dandana'),
(835, 'achivement', 'Achievement', 'অর্জন', 'Logro', 'موهلات', 'उपलब्धि', 'کامیابی', '成就', '成果', 'Realização', 'Достижение', 'Réussite', '성취', 'Leistung', 'realizzazione', 'ความสำเร็จ', 'Teljesítmény', 'prestatie', 'factum', 'Prestasi', 'Başarı', 'Κατόρθωμα', 'دستاورد', 'Pencapaian', 'అచీవ్మెంట్', 'சாதனையாளர்', 'સિદ્ધિ', 'Osiągnięcie', 'Досягнення', 'ਪ੍ਰਾਪਤੀ', 'Realizare', 'အောင်မြင်ချက်', 'Aseyori', 'Sakamakon'),
(836, 'by', 'By', 'দ্বারা', 'Por', 'بواسطة', 'द्वारा', 'کی طرف سے', '通过', 'によって', 'Por', 'От', 'Par', '으로', 'Durch', 'Di', 'โดย', 'Által', 'Door', 'a', 'Oleh', 'Tarafından', 'Με', 'توسط', 'Oleh', 'ద్వారా', 'மூலம்', 'દ્વારા', 'Przez', 'По', 'ਨਾਲ', 'De', 'အားဖြင့်', 'Nipa', 'By'),
(837, 'what_guardian_say', 'What Guardian Say?', 'গার্ডিয়ান কি বলে?', '¿Qué dice el guardián?', 'ما الوصي قل؟', 'क्या गार्जियन कहते हैं?', 'کیا گارڈین کہتے ہیں؟', '卫报怎么说？', 'ガーディアンは何を言っているの？', 'O que o guardião diz?', 'Что сказал Хранитель?', 'Que dit le gardien?', '가디언이 뭐라 구요?', 'Was Wächter sagen?', 'Che cosa dice il guardiano?', 'อะไร Guardian Say?', 'Milyen Guardian mondja?', 'Welke bewaker zegt?', 'Custos, quid dices?', 'Apa yang dikatakan Guardian?', 'Koruyucu ne diyor?', 'Τι λέει ο Guardian;', 'چه گاردی می گوید؟', 'Apa yang dikatakan Guardian?', 'గార్డియన్ ఏమి చెబుతారు?', 'கார்டியன் என்ன சொல்கிறது?', 'ગાર્ડિયન શું કહે છે?', 'Co mówi strażnik?', 'Що каже гадаю?', 'ਗਾਰਡੀਅਨ ਕੀ ਕਹਿੰਦੇ ਹਨ?', 'Ce spune Guardian?', 'အဘယ်အရာကိုဂါးဒီးယန်းပြောရမည်မှာ,', 'Kini Oluṣọ Kan Sọ?', 'Abin da Guardian Say?'),
(838, 'apply_now_for_your_kid', 'Apply Now for Your Kids', 'আপনার বাচ্চাদের জন্য এখন আবেদন করুন', 'Solicite ahora para sus hijos', 'قدم الآن لأطفالك', 'अपने बच्चों के लिए अभी आवेदन करें', 'اپنے بچوں کے لئے اب درخواست دیں', '立即申请您的孩子', 'あなたの子供たちに今すぐ応募する', 'Inscreva-se agora para seus filhos', 'Применить сейчас для своих детей', 'Appliquez maintenant pour vos enfants', '자녀에게 지금 신청하십시오', 'Bewerben Sie sich jetzt für Ihre Kinder', 'Fai domanda per i tuoi bambini', 'สมัครตอนนี้เพื่อลูกของคุณ', 'Jelentkezz most a gyerekeknek', 'Meld je nu aan voor je kinderen', 'Applicare autem tuus pro Kids', 'Ajukan Sekarang untuk Anak-Anak Anda', 'Çocuklarınız için Şimdi Başvurun', 'Εφαρμόστε τώρα για τα παιδιά σας', 'اکنون برای کودکان خود اعمال کنید', 'Sapukan Sekarang untuk Anak-Anak Anda', 'ఇప్పుడు మీ కిడ్స్ కోసం దరఖాస్తు చేసుకోండి', 'உங்கள் பிள்ளைகளுக்கு இப்போது விண்ணப்பிக்கவும்', 'તમારા બાળકો માટે હવે અરજી કરો', 'Złóż aplikację teraz dla swoich dzieci', 'Застосувати зараз для своїх дітей', 'ਆਪਣੇ ਬੱਚਿਆਂ ਲਈ ਹੁਣੇ ਅਪਲਾਈ ਕਰੋ', 'Aplicați acum pentru copiii dvs.', 'သင့်ရဲ့ကလေးတွေကအဘို့အ Now ကို Apply', 'Ṣe Waye Bayi fun Awọn ọmọ wẹwẹ rẹ', 'Nemi Yanzu Don Yaracenku'),
(839, 'apply', 'Apply', 'আবেদন করুন ', 'Aplicar', 'تطبيق', 'लागू करें', 'درخواست دیں', '应用', '適用', 'Aplique', 'Применять', 'Appliquer', '대다', 'Sich bewerben', 'Applicare', 'ใช้', 'Alkalmaz', 'Van toepassing zijn', 'Applicare', 'Menerapkan', 'Uygulamak', 'Ισχύουν', 'درخواست دادن', 'Memohon', 'వర్తించు', 'விண்ணப்பிக்கவும்', 'અરજી કરો', 'Zastosować', 'Застосувати', 'ਲਾਗੂ ਕਰੋ', 'aplica', 'Apply', 'Waye', 'Aiwatar'),
(840, 'visit', 'Visit', 'পরিদর্শন', 'Visitar', 'يزور', 'पर जाएँ', 'ملاحظہ کریں', '访问', '訪問', 'Visita', 'Визит', 'Visite', '방문', 'Besuch', 'Visita', 'เยือน', 'Látogatás', 'Bezoek', 'visita', 'Mengunjungi', 'Ziyaret etmek', 'Επίσκεψη', 'بازدید', 'Lawati', 'సందర్శించండి', 'வருகை', 'મુલાકાત લો', 'Odwiedzić', 'Відвідайте', 'ਮੁਲਾਕਾਤ', 'Vizita', 'အလည်အပတ်', 'Ṣabẹwo', 'Ziyarci'),
(841, 'publish', 'Publish', 'প্রকাশিত', 'Publicar', 'نشر', 'प्रकाशित करना', 'شائع کریں', '发布', '公開する', 'Publicar', 'Публиковать', 'Publier', '게시', 'Veröffentlichen', 'Pubblicare', 'ประกาศ', 'közzétesz', 'Publiceren', 'publish', 'Menerbitkan', 'Yayınla', 'Δημοσιεύω', 'انتشار', 'Menerbitkan', 'ప్రచురించు', 'வெளியிடு', 'પ્રકાશિત કરો', 'Publikować', 'Опублікувати', 'ਪਬਲਿਸ਼ ਕਰੋ', 'Publica', 'ပုံနှိပ်ထုတ်ဝေ', 'Ṣe atẹjade', 'Buga'),
(842, 'unpublish', 'Unpublish', 'অপ্রকাশিত', 'No publicar', 'إلغاء النشر', 'अप्रकाशित', 'غیر اشاعت شدہ', '取消发布', '公開しない', 'Cancelar publicação', 'Отменить публикацию', 'Annuler la publication', '게시 취소', 'Veröffentlichung rückgängig machen', 'Non pubblicato', 'ยกเลิกการเผยแพร่', 'közzétételének', 'Publicatie ongedaan maken', 'Unpublishway', 'Batalkan publikasi', 'Yayından Kaldır', 'Κατάργηση δημοσίευσης', 'لغو انتشار', 'Tidak dapat menerbitkan', 'ప్రచురించని', 'வெளியிடாதே', 'અનપ્રકાશિત', 'Cofnij publikację', 'Скасувати публікацію', 'ਅਪ੍ਰਕਾਸ਼ਿਤ', 'Anulați publicarea', 'မထုတ်ဝေရသေးသော', 'Aṣejade', 'Unpublish'),
(843, 'detail', 'Detail', 'বিস্তারিত', 'Detalle', 'التفاصيل', 'विस्तार', 'تفصیل', '详情', '詳細', 'Detalhe', 'подробность', 'Détail', '세부 묘사', 'Detail', 'Dettaglio', 'รายละเอียด', 'Részlet', 'Detail', 'detail', 'Detail', 'detay', 'Λεπτομέρεια', 'جزئیات', 'Terperinci', 'వివరాలు', 'விவரம்', 'વિગતવાર', 'Szczegół', 'Подробиці', 'ਵੇਰਵੇ', 'Detaliu', 'အသေးစိတ်', 'Apejuwe', 'Detail'),
(844, 'school_lat', 'Latitude', 'অক্ষাংশ', 'Latitud', 'خط العرض', 'अक्षांश', 'طول', '纬度', '緯度', 'Latitude', 'широта', 'Latitude', '위도', 'Breite', 'Latitudine', 'ละติจูด', 'Szélességi kör', 'Breedtegraad', 'latitudo', 'Lintang', 'Enlem', 'Γεωγραφικό πλάτος', 'عرض جغرافیایی', 'Latitud', 'అక్షాంశం', 'அட்சரேகை', 'અક્ષાંશ', 'Szerokość', 'Широта', 'ਵਿਥਕਾਰ', 'Latitudine', 'လတီ္တတွဒ်', 'Iwọn', 'Latitude'),
(845, 'school_lng', 'Longitude', 'দ্রাঘিমা', 'Longitud', 'خط الطول', 'देशान्तर', 'لمبائی', '经度', '経度', 'Longitude', 'Долгота', 'Longitude', '경도', 'Längengrad', 'Longitudine', 'ลองจิจูด', 'Hosszúság', 'Lengtegraad', 'longitudo', 'Garis bujur', 'Boylam', 'Γεωγραφικό μήκος', 'عرض جغرافیایی', 'Longitud', 'రేఖాంశం', 'தீர்க்கரேகை', 'રેખાંશ', 'Długość geograficzna', 'Довгота', 'ਲੰਬਕਾਰ', 'Longitudine', 'လောင်ဂျီတွဒ်', 'Gunitude', 'Longitude'),
(846, 'galleries', 'Galleries', 'গ্যালারী', 'Galerias', 'المعارض', 'गैलरी', 'گیلریوں', '画廊', 'ギャラリー', 'Galerias', 'галереи', 'Galeries', '갤러리', 'Galerien', 'Gallerie', 'แกลลอรี่', 'galériák', 'Galleries', 'supportabant porticus', 'Galeri', 'Galeriler', 'Γκαλερί', 'گالری ها', 'Galeri', 'గ్యాలరీలు', 'காட்சியகங்கள்', 'ગેલેરીઓ', 'Galerie', 'Галереї', 'ਗੈਲਰੀਆਂ', 'Galerii', 'ပြခန်း', 'Awọn aworan aworan', 'Galleries'),
(847, 'events', 'Events', 'ইভেন্টস', 'Eventos', 'أحداث', 'आयोजन', 'تقریبات', '活动', 'イベント', 'Eventos', 'События', 'Événements', '이벤트', 'Veranstaltungen', 'eventi', 'เหตุการณ์ที่เกิดขึ้น', 'Események', 'Evenementen', 'Events', 'Acara', 'Olaylar', 'Εκδηλώσεις', 'مناسبت ها', 'Peristiwa', 'ఈవెంట్స్', 'நிகழ்வுகள்', 'ઘટનાઓ', 'Wydarzenia', 'Події', 'ਸਮਾਗਮ', 'Evenimente', 'ဖြစ်ရပ်များ', 'Awọn iṣẹlẹ', 'Events'),
(848, 'notices', 'Notices', 'নোটিশস', 'Avisos', 'إشعارات', 'नोटिस', 'نوٹس', '通告', '通知', 'Avisos', 'Извещения', 'Les avis', '공지 사항', 'Bemerkungen', 'Avvisi', 'การบอกกล่าว', 'közlemények', 'Mededelingen', 'III', 'Pemberitahuan', 'Uyarılar', 'Ειδοποιήσεις', 'اطلاعیه ها', 'Notis', 'నోటీసులు', 'அறிவிப்புகள்', 'સૂચનાઓ', 'Powiadomienia', 'Сповіщення', 'ਸੂਚਨਾਵਾਂ', 'Notificări', 'သတိပေးချက်များ', 'Awọn akiyesi', 'Sanarwa'),
(849, 'holidays', 'Holidays', 'হলিডেজ', 'Vacaciones', 'العطل', 'छुट्टियां', 'چھٹیوں', '假期', '休日', 'Feriados', 'каникулы', 'Vacances', '휴가', 'Ferien', 'Vacanze', 'วันหยุด', 'Ünnepek', 'Vakantie', 'feriae', 'Liburan', 'Bayram', 'Διακοπές', 'تعطیلات', 'Cuti', 'సెలవులు', 'விடுமுறை', 'રજાઓ', 'Wakacje', 'Свята', 'ਛੁੱਟੀਆਂ', 'concediu', 'အားလပ်ရက်', 'Awọn isinmi', 'Ranaku Masu Tsarki'),
(850, 'pls_remove_child_data', 'Please delete child data before delete this.', 'এই ডাটা  মুছে ফেলার আগে প্লিজ ডিলিট চাইল্ড ডাটা', 'Por favor, elimine los datos secundarios antes de eliminar esto.', 'يرجى حذف البيانات الفرعية قبل حذفها.', 'इसे हटाने से पहले कृपया बाल डेटा हटाएं।', 'براہ کرم اس کو حذف کرنے سے قبل بچے کے ڈیٹا کو حذف کریں.', '删除之前请删除子数据。', '削除する前に子データを削除してください。', 'Por favor, apague os dados da criança antes de deletar isto.', 'Удалите дочерние данные перед удалением.', 'Veuillez supprimer les données enfants avant de supprimer ceci.', '삭제하기 전에 하위 데이터를 삭제하십시오.', 'Bitte löschen Sie untergeordnete Daten, bevor Sie diese löschen.', 'Si prega di cancellare i dati figlio prima di eliminarlo.', 'โปรดลบข้อมูลเด็กก่อนลบข้อมูลนี้', 'Kérjük, törölje a gyermekadatokat a törlés előtt.', 'Wis onderliggende gegevens voordat u deze verwijdert.', 'Delete hoc in conspectu delete notitia puero placet.', 'Hapus data anak sebelum menghapus ini.', 'Lütfen bunu silmeden önce çocuk verilerini silin', 'Διαγράψτε τα δεδομένα παιδιού πριν διαγράψετε αυτό το θέμα.', 'لطفا قبل از حذف این اطلاعات فرزند را حذف کنید.', 'Sila padamkan data kanak-kanak sebelum memadamkannya.', 'దీన్ని తొలగించడానికి ముందు పిల్లల డేటాను తొలగించండి.', 'இதை நீக்குவதற்கு முன் குழந்தைத் தரவை நீக்குக.', 'કૃપા કરીને આને કાઢી નાખતા પહેલા બાળ ડેટા કાઢી નાખો.', 'Usuń dane podrzędne, zanim je usuniesz.', 'Будь ласка, видаліть дочірні дані, перш ніж видалити це.', 'ਕਿਰਪਾ ਕਰਕੇ ਇਸਨੂੰ ਮਿਟਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਬੱਚੇ ਦਾ ਡੇਟਾ ਮਿਟਾਓ.', 'Ștergeți datele copilului înainte de a șterge acest lucru.', 'မတိုင်မှီကဒီကိုဖျက်ကလေးက data တွေကိုဖျက်ပစ်ပါ။', 'Jọwọ pa awọn ọmọ ọmọkunrin rẹ ṣaaju ki o to paarẹ.', 'Da fatan a share bayanan jariri kafin a share wannan.'),
(851, 'industry_type', 'Industry Type', 'ইন্ডাস্ট্রি টাইপ', 'Tipo de industria', 'نوع الصناعة', 'उद्योग के प्रकार', 'صنعت کی قسم', '行业类型', '業種別', 'tipo industrial', 'Тип промышленности', 'type d\'industrie', '업종', 'Branchentyp', 'Tipo d\'industria', 'ประเภทอุตสาหกรรม', 'Ipari típus', 'industrie type', 'Type Industry', 'Jenis Industri', 'Endüstri Tipi', 'Τύπος βιομηχανίας', 'نوع صنعت', 'Jenis Industri', 'పరిశ్రమ పద్ధతి', 'தொழில் வகை', 'ઉદ્યોગ પ્રકાર', 'typ przemysłu', 'Тип промисловості', 'ਉਦਯੋਗ ਕਿਸਮ', 'tipul industriei', 'စက်မှုအမျိုးအစား', 'Iru iṣẹ Iru', 'Masana\'antu'),
(851, 'industry_type', 'Industry Type', 'ইন্ডাস্ট্রি টাইপ', 'Tipo de industria', 'نوع الصناعة', 'उद्योग के प्रकार', 'صنعت کی قسم', '行业类型', '業種別', 'tipo industrial', 'Тип промышленности', 'type d\'industrie', '업종', 'Branchentyp', 'Tipo d\'industria', 'ประเภทอุตสาหกรรม', 'Ipari típus', 'industrie type', 'Type Industry', 'Jenis Industri', 'Endüstri Tipi', 'Τύπος βιομηχανίας', 'نوع صنعت', 'Jenis Industri', 'పరిశ్రమ పద్ధతి', 'தொழில் வகை', 'ઉદ્યોગ પ્રકાર', 'typ przemysłu', 'Тип промисловості', 'ਉਦਯੋਗ ਕਿਸਮ', 'tipul industriei', 'စက်မှုအမျိုးအစား', 'Iru iṣẹ Iru', 'Masana\'antu');

-- --------------------------------------------------------

--
-- Table structure for table `library_members`
--

CREATE TABLE `library_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `custom_member_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `written_mark` int(11) NOT NULL,
  `written_obtain` int(11) NOT NULL,
  `tutorial_mark` int(11) NOT NULL,
  `tutorial_obtain` int(11) NOT NULL,
  `practical_mark` int(11) NOT NULL,
  `practical_obtain` int(11) NOT NULL,
  `viva_mark` int(11) NOT NULL,
  `viva_obtain` int(11) NOT NULL,
  `exam_total_mark` int(11) NOT NULL,
  `obtain_total_mark` int(11) NOT NULL,
  `remark` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `mark_emails`
--

CREATE TABLE `mark_emails` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `receivers` text CHARACTER SET utf8 NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `sender_role_id` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `mark_smses`
--

CREATE TABLE `mark_smses` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `sms_gateway` varchar(50) CHARACTER SET utf8 NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `sender_role_id` int(11) NOT NULL,
  `receivers` text CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_at` datetime NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `attachment` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `message_relationships`
--

CREATE TABLE `message_relationships` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_trash` tinyint(1) NOT NULL,
  `is_draft` smallint(1) NOT NULL,
  `is_favorite` tinyint(1) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `module_slug` varchar(50) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_slug`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'Setting', 'setting', 1, '2017-11-13 22:55:19', '2017-11-13 22:57:10', 1, 1),
(2, 'Theme', 'theme', 1, '2017-12-12 13:34:52', '0000-00-00 00:00:00', 1, 0),
(3, 'Language', 'language', 1, '2017-12-12 13:36:11', '0000-00-00 00:00:00', 1, 0),
(4, 'Administrator', 'administrator', 1, '2017-12-12 13:36:35', '0000-00-00 00:00:00', 1, 0),
(5, 'Human Resource', 'hrm', 1, '2017-12-12 13:38:30', '0000-00-00 00:00:00', 1, 0),
(6, 'Teacher', 'teacher', 1, '2017-12-12 13:39:01', '0000-00-00 00:00:00', 1, 0),
(7, 'Academic Activity', 'academic', 1, '2017-12-12 13:42:24', '0000-00-00 00:00:00', 1, 0),
(8, 'Guardian', 'guardian', 1, '2017-12-12 13:43:01', '0000-00-00 00:00:00', 1, 0),
(9, 'Student', 'student', 1, '2017-12-12 13:43:28', '0000-00-00 00:00:00', 1, 0),
(10, 'Attendance', 'attendance', 1, '2017-12-12 13:45:03', '0000-00-00 00:00:00', 1, 0),
(11, 'Assignment', 'assignment', 1, '2017-12-12 13:45:45', '0000-00-00 00:00:00', 1, 0),
(12, 'Exam', 'exam', 1, '2017-12-12 13:46:13', '0000-00-00 00:00:00', 1, 0),
(14, 'Library', 'library', 1, '2017-12-12 13:46:33', '0000-00-00 00:00:00', 1, 0),
(15, 'Transport', 'transport', 1, '2017-12-12 13:46:52', '0000-00-00 00:00:00', 1, 0),
(16, 'Hostel', 'hostel', 1, '2017-12-12 13:47:15', '0000-00-00 00:00:00', 1, 0),
(17, 'Message, Email & SMS', 'message', 1, '2017-12-12 13:47:48', '2017-12-14 08:48:49', 1, 1),
(18, 'Announcement', 'announcement', 1, '2017-12-12 13:48:23', '0000-00-00 00:00:00', 1, 0),
(19, 'Event', 'event', 1, '2017-12-12 13:48:36', '0000-00-00 00:00:00', 1, 0),
(20, 'Visitor Info', 'visitor', 1, '2017-12-12 13:49:05', '0000-00-00 00:00:00', 1, 0),
(21, 'Accounting', 'accounting', 1, '2017-12-12 13:49:32', '0000-00-00 00:00:00', 1, 0),
(22, 'Report', 'report', 1, '2017-12-12 13:51:09', '0000-00-00 00:00:00', 1, 0),
(13, 'Exam Mark', 'exam', 1, '2017-12-14 00:00:00', '2017-12-14 09:07:46', 1, 1),
(23, 'Certificate', 'certificate', 1, '2018-03-17 16:27:14', '0000-00-00 00:00:00', 2, 0),
(24, 'Media Gallery', 'gallery', 1, '2018-03-22 06:46:46', '0000-00-00 00:00:00', 1, 0),
(25, 'Frontend', 'frontend', 1, '2018-03-23 03:40:22', '0000-00-00 00:00:00', 1, 0),
(26, 'Payroll', 'payroll', 1, '2018-03-25 02:07:46', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date` date NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `news` text CHARACTER SET utf8 NOT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date` date NOT NULL,
  `notice` text CHARACTER SET utf8 NOT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `operations`
--

CREATE TABLE `operations` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `operation_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `operation_slug` varchar(50) CHARACTER SET utf8 NOT NULL,
  `is_view_vissible` tinyint(1) DEFAULT '0',
  `is_add_vissible` tinyint(1) DEFAULT '0',
  `is_edit_vissible` tinyint(1) DEFAULT '0',
  `is_delete_vissible` tinyint(1) DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operations`
--

INSERT INTO `operations` (`id`, `module_id`, `operation_name`, `operation_slug`, `is_view_vissible`, `is_add_vissible`, `is_edit_vissible`, `is_delete_vissible`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 1, 'General Setting', 'setting', 1, 1, 1, 0, 1, '2017-12-12 16:06:25', '2018-02-09 01:24:50', 1, 1),
(2, 1, 'Payment Setting', 'payment', 1, 1, 1, 0, 1, '2017-12-12 16:06:55', '2018-02-09 01:24:40', 1, 1),
(3, 1, 'SMS Setting', 'sms', 1, 1, 1, 0, 1, '2017-12-12 16:07:07', '2018-02-09 01:05:32', 1, 1),
(4, 2, 'Theme', 'theme', 1, 0, 1, 0, 1, '2017-12-12 16:08:39', '2018-01-03 07:02:51', 1, 1),
(5, 3, 'Language', 'language', 1, 1, 1, 1, 1, '2017-12-12 16:09:22', '2018-01-03 07:03:03', 1, 1),
(6, 4, 'Academic Year', 'year', 1, 1, 1, 1, 1, '2017-12-12 16:10:34', '2018-01-03 07:03:18', 1, 1),
(7, 4, 'User Role', 'role', 1, 1, 1, 1, 1, '2017-12-12 16:10:55', '2018-01-03 07:03:31', 1, 1),
(8, 4, 'Role Permission', 'permission', 1, 0, 1, 0, 1, '2017-12-12 16:12:10', '2018-01-03 07:05:00', 1, 1),
(64, 4, 'Reset User Password', 'password', 0, 0, 1, 0, 1, '2017-12-13 20:14:23', '2018-01-03 07:05:11', 1, 1),
(10, 5, 'Designation', 'designation', 1, 1, 1, 1, 1, '2017-12-12 16:15:38', '2018-01-03 07:07:38', 1, 1),
(11, 5, 'Employee', 'employee', 1, 1, 1, 1, 1, '2017-12-12 16:15:55', '2018-01-03 07:19:54', 1, 1),
(12, 6, 'Teacher', 'teacher', 1, 1, 1, 1, 1, '2017-12-12 16:17:22', '2018-01-03 07:25:07', 1, 1),
(14, 7, 'Classes', 'classes', 1, 1, 1, 1, 1, '2017-12-12 16:19:01', '2018-01-03 07:25:17', 1, 1),
(15, 7, 'Section', 'section', 1, 1, 1, 1, 1, '2017-12-12 16:19:24', '2018-01-03 07:25:24', 1, 1),
(16, 7, 'Subject', 'subject', 1, 1, 1, 1, 1, '2017-12-12 16:19:48', '2018-01-03 07:25:33', 1, 1),
(17, 7, 'Syllabus', 'syllabus', 1, 1, 1, 1, 1, '2017-12-12 16:20:32', '2018-01-03 07:25:54', 1, 1),
(18, 7, 'Class Routine', 'routine', 1, 1, 1, 1, 1, '2017-12-12 16:20:56', '2018-01-03 07:26:13', 1, 1),
(19, 7, 'Promotion', 'promotion', 1, 1, 0, 0, 1, '2017-12-12 16:21:17', '2018-02-09 01:42:57', 1, 1),
(20, 8, 'Guardian', 'guardian', 1, 1, 1, 1, 1, '2017-12-12 16:23:32', '2018-01-03 07:29:06', 1, 1),
(21, 9, 'Student', 'student', 1, 1, 1, 1, 1, '2017-12-12 17:58:56', '2018-01-03 07:29:15', 1, 1),
(65, 4, 'Backup Database', 'backup', 1, 0, 0, 0, 1, '2017-12-13 20:14:39', '2018-02-09 01:29:33', 1, 1),
(23, 10, 'Employee Attendance', 'employee', 1, 1, 1, 0, 1, '2017-12-12 18:00:10', '2018-01-03 07:30:19', 1, 1),
(24, 10, 'Teacher Attendance', 'teacher', 1, 1, 1, 0, 1, '2017-12-12 18:00:51', '2018-01-03 07:29:52', 1, 1),
(25, 10, 'Student Attendance', 'student', 1, 1, 1, 0, 1, '2017-12-12 18:01:17', '2018-01-03 07:30:01', 1, 1),
(26, 11, 'Assignment', 'assignment', 1, 1, 1, 1, 1, '2017-12-12 18:02:08', '2018-01-03 07:30:40', 1, 1),
(28, 12, 'Exam Term', 'exam', 1, 1, 1, 1, 1, '2017-12-12 18:03:30', '2018-02-09 01:49:25', 1, 1),
(29, 12, 'Exam Grade', 'grade', 1, 1, 1, 1, 1, '2017-12-12 18:03:56', '2018-01-03 07:31:56', 1, 1),
(30, 12, 'Exam Schedule', 'schedule', 1, 1, 1, 1, 1, '2017-12-12 18:04:58', '2018-01-03 07:32:14', 1, 1),
(31, 12, 'Exam Suggestion', 'suggestion', 1, 1, 1, 1, 1, '2017-12-12 18:05:18', '2018-01-03 07:32:30', 1, 1),
(32, 12, 'Exam Attendance', 'attendance', 1, 1, 1, 0, 1, '2017-12-12 18:05:43', '2018-01-03 07:32:58', 1, 1),
(33, 13, 'Exam Mark', 'mark', 1, 1, 1, 0, 1, '2017-12-12 18:06:04', '2018-01-03 07:33:16', 1, 1),
(34, 13, 'Mark Sheet', 'marksheet', 1, 1, 1, 0, 1, '2017-12-12 18:06:24', '2018-01-03 07:34:08', 1, 1),
(35, 13, 'Exam Final Result', 'finalresult', 1, 1, 1, NULL, 1, '2017-12-12 18:06:41', '2018-06-27 13:45:08', 1, 1),
(37, 14, 'Library Book', 'book', 1, 1, 1, 1, 1, '2017-12-12 18:09:17', '2018-01-03 07:36:02', 1, 1),
(38, 14, 'Library Member', 'member', 1, 1, 0, 1, 1, '2017-12-12 18:09:33', '2018-01-03 07:36:24', 1, 1),
(66, 14, 'Issue & Return', 'issue', 1, 1, 1, 0, 1, '2017-12-14 08:46:37', '2018-01-03 07:37:01', 1, 1),
(40, 15, 'Vehicle', 'vehicle', 1, 1, 1, 1, 1, '2017-12-12 18:10:49', '2018-01-03 07:37:11', 1, 1),
(41, 15, 'Transport Route', 'route', 1, 1, 1, 1, 1, '2017-12-12 18:11:17', '2018-01-03 07:41:27', 1, 1),
(42, 15, 'Transport Member', 'member', 1, 1, 0, 1, 1, '2017-12-12 18:11:39', '2018-01-03 07:41:46', 1, 1),
(43, 16, 'Hostel', 'hostel', 1, 1, 1, 1, 1, '2017-12-12 18:12:16', '2018-01-03 07:41:55', 1, 1),
(44, 16, 'Hostel Room', 'room', 1, 1, 1, 1, 1, '2017-12-12 18:12:37', '2018-01-03 07:42:02', 1, 1),
(45, 16, 'Hostel Member', 'member', 1, 1, 0, 1, 1, '2017-12-12 18:13:00', '2018-01-03 07:42:23', 1, 1),
(47, 17, 'Email', 'mail', 1, 1, 0, 1, 1, '2017-12-12 18:15:57', '2018-01-03 07:44:16', 1, 1),
(48, 17, 'Text SMS', 'text', 1, 1, 0, 1, 1, '2017-12-12 18:16:17', '2018-01-03 07:44:25', 1, 1),
(50, 18, 'Notice', 'notice', 1, 1, 1, 1, 1, '2017-12-12 18:20:38', '2018-01-03 07:47:39', 1, 1),
(51, 18, 'News', 'news', 1, 1, 1, 1, 1, '2017-12-12 18:20:54', '2018-01-03 07:47:46', 1, 1),
(52, 18, 'Holiday', 'holiday', 1, 1, 1, 1, 1, '2017-12-12 18:21:08', '2018-01-03 07:47:53', 1, 1),
(53, 19, 'Event', 'event', 1, 1, 1, 1, 1, '2017-12-12 18:21:35', '2018-01-03 07:48:00', 1, 1),
(54, 20, 'Visitor Info', 'visitor', 1, 1, 1, 1, 1, '2017-12-12 18:22:05', '2018-01-03 07:48:15', 1, 1),
(56, 21, 'Expenditure Head', 'exphead', 1, 1, 1, 1, 1, '2017-12-12 18:23:51', '2018-01-03 07:48:23', 1, 1),
(57, 21, 'Expenditure', 'expenditure', 1, 1, 1, 1, 1, '2017-12-12 18:24:14', '2018-01-03 07:48:32', 1, 1),
(58, 21, 'Income Head', 'incomehead', 1, 1, 1, 1, 1, '2017-12-12 18:24:42', '2018-01-03 07:48:39', 1, 1),
(59, 21, 'Income', 'income', 1, 1, 1, 1, 1, '2017-12-12 18:24:54', '2018-01-03 07:48:59', 1, 1),
(60, 21, 'Invoice', 'invoice', 1, 1, 1, 1, 1, '2017-12-12 18:25:16', '2018-01-03 07:49:12', 1, 1),
(61, 21, 'Payment', 'payment', 1, 1, 0, 0, 1, '2017-12-12 18:25:34', '2018-01-03 07:49:47', 1, 1),
(62, 22, 'Report', 'report', 1, 0, 0, 0, 1, '2017-12-12 18:26:16', '2018-01-03 07:50:00', 1, 1),
(63, 4, 'Manage User', 'user', 1, 0, 1, 0, 1, '2017-12-13 20:13:49', '2018-01-03 07:35:43', 1, 1),
(67, 13, 'Mark send by SMS', 'text', 1, 1, 0, 1, 1, '2017-12-14 09:09:58', '2018-01-03 07:34:45', 1, 1),
(68, 13, 'Mark send by Email', 'mail', 1, 1, 0, 1, 1, '2017-12-14 09:10:15', '2018-01-03 07:35:13', 1, 1),
(69, 17, 'message', 'message', 1, 1, 1, 1, 1, '2018-01-13 08:53:53', '2018-01-13 09:06:22', 2, 2),
(70, 23, 'CertificateType', 'type', 1, 1, 1, 1, 1, '2018-03-17 16:28:43', '0000-00-00 00:00:00', 2, 0),
(71, 23, 'Certificate', 'certificate', 1, NULL, NULL, NULL, 1, '2018-03-18 09:06:40', '0000-00-00 00:00:00', 1, 0),
(72, 24, 'Gallery', 'gallery', 1, 1, 1, 1, 1, '2018-03-22 06:47:27', '2018-03-22 06:48:03', 1, 1),
(73, 24, 'Image', 'image', 1, 1, 1, 1, 1, '2018-03-22 06:47:51', '0000-00-00 00:00:00', 1, 0),
(74, 25, 'Frontend', 'frontend', 1, 1, 1, 1, 1, '2018-03-23 05:06:49', '0000-00-00 00:00:00', 1, 0),
(75, 26, 'Salary Grade', 'grade', 1, 1, 1, 1, 1, '2018-03-25 02:08:21', '0000-00-00 00:00:00', 1, 0),
(76, 26, 'Payment', 'payment', 1, 1, 1, 1, 1, '2018-03-25 02:09:05', '0000-00-00 00:00:00', 1, 0),
(77, 25, 'Home Slider', 'slider', 1, 1, 1, 1, 1, '2018-03-27 18:04:48', '0000-00-00 00:00:00', 1, 0),
(78, 26, 'History', 'history', 1, NULL, NULL, NULL, 1, '2018-04-01 00:39:23', '0000-00-00 00:00:00', 1, 0),
(79, 21, 'Discount', 'discount', 1, 1, 1, 1, 1, '2018-06-05 13:52:25', '0000-00-00 00:00:00', 1, 0),
(80, 21, 'Fee Type', 'feetype', 1, 1, 1, 1, 1, '2018-06-15 11:25:47', '0000-00-00 00:00:00', 1, 0),
(81, 13, 'Result Card', 'resultcard', 1, NULL, NULL, NULL, 1, '2018-06-23 14:21:23', '0000-00-00 00:00:00', 1, 0),
(82, 13, 'Exam Result', 'examresult', 1, 1, 1, NULL, 1, '2018-06-27 12:43:47', '0000-00-00 00:00:00', 1, 0),
(83, 4, 'SMS Template', 'smstemplate', 1, 1, 1, 1, 1, '2018-07-02 09:04:26', '0000-00-00 00:00:00', 1, 0),
(84, 4, 'Email Template', 'emailtemplate', 1, 1, 1, 1, 1, '2018-07-02 09:04:52', '0000-00-00 00:00:00', 1, 0),
(85, 4, 'Activity Log', 'activitylog', 1, NULL, NULL, 1, 1, '2018-07-04 10:05:11', '0000-00-00 00:00:00', 1, 0),
(86, 9, 'Bulk Import', 'bulk', NULL, 1, NULL, NULL, 1, '2018-07-08 09:26:43', '0000-00-00 00:00:00', 1, 0),
(87, 10, 'Absent Email', 'absentemail', 1, 1, NULL, 1, 1, '2018-07-08 14:15:12', '0000-00-00 00:00:00', 1, 0),
(88, 10, 'Absent SMS', 'absentsms', 1, 1, NULL, 1, 1, '2018-07-08 14:15:49', '0000-00-00 00:00:00', 1, 0),
(89, 21, 'Due Fee Email', 'duefeeemail', 1, 1, NULL, 1, 1, '2018-07-09 08:44:10', '0000-00-00 00:00:00', 1, 0),
(90, 21, 'Due Fee SMS', 'duefeesms', 1, 1, NULL, 1, 1, '2018-07-09 08:44:38', '0000-00-00 00:00:00', 1, 0),
(91, 13, 'Result Email', 'resultemail', 1, 1, NULL, 1, 1, '2018-07-09 13:44:49', '0000-00-00 00:00:00', 1, 0),
(92, 13, 'Result SMS', 'resultsms', 1, 1, NULL, 1, 1, '2018-07-09 13:45:17', '0000-00-00 00:00:00', 1, 0),
(93, 4, 'Email Reset', 'email', NULL, NULL, 1, NULL, 1, '2018-07-19 18:20:00', '0000-00-00 00:00:00', 1, 0),
(94, 9, 'Student Activity', 'activity', 1, 1, 1, 1, 1, '2018-07-19 18:22:58', '0000-00-00 00:00:00', 1, 0),
(95, 13, 'Merit List', 'meritlist', 1, NULL, NULL, NULL, 1, '2018-08-04 13:48:02', '2018-08-04 13:50:56', 1, 1),
(96, 4, 'Feedback', 'feedback', 1, 1, 1, 1, 1, '2018-12-06 21:09:12', '0000-00-00 00:00:00', 1, 0),
(97, 8, 'Feedback', 'feedback', 1, 1, 1, 1, 1, '2018-12-07 01:27:38', '0000-00-00 00:00:00', 1, 0),
(98, 25, 'About', 'about', 1, 1, 1, NULL, 1, '2018-12-07 01:42:05', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `page_location` varchar(50) CHARACTER SET utf8 NOT NULL,
  `page_slug` varchar(100) CHARACTER SET utf8 NOT NULL,
  `page_title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `page_description` text CHARACTER SET utf8,
  `page_image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_location`, `page_slug`, `page_title`, `page_description`, `page_image`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'footer', 'privacy-policy', 'Privacy Policy', '<p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section </p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: \" open=\"\" sans\",=\"\" arial,=\"\" sans-serif;\"=\"\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham edit.</p>', '', 1, '2018-04-08 06:00:17', '2018-12-07 18:30:25', 1, 1),
(2, 'footer', 'terms--conditions', 'Terms & Conditions', '<b style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\">Lorem Ipsum</b><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\"><br></span></p><p><b style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\">Lorem Ipsum</b><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\"> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; text-align: justify;\"><br></span></p>', '', 1, '2018-04-08 06:00:56', '2018-12-07 18:30:18', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_settings`
--

CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL,
  `paypal_api_username` varchar(100) DEFAULT NULL,
  `paypal_api_password` varchar(100) DEFAULT NULL,
  `paypal_api_signature` varchar(100) DEFAULT NULL,
  `paypal_email` varchar(50) DEFAULT NULL,
  `paypal_demo` tinyint(1) DEFAULT NULL,
  `paypal_extra_charge` double(10,2) NOT NULL,
  `paypal_status` tinyint(1) DEFAULT NULL,
  `stripe_secret` varchar(100) DEFAULT NULL,
  `stripe_demo` tinyint(1) DEFAULT NULL,
  `stripe_extra_charge` double(10,2) NOT NULL,
  `stripe_status` tinyint(1) DEFAULT NULL,
  `payumoney_key` varchar(100) DEFAULT NULL,
  `payumoney_salt` varchar(100) DEFAULT NULL,
  `payumoney_demo` tinyint(1) DEFAULT NULL,
  `payu_extra_charge` double(10,2) NOT NULL,
  `payumoney_status` tinyint(1) DEFAULT NULL,
  `ccavenue_key` varchar(100) DEFAULT NULL,
  `ccavenue_salt` varchar(100) DEFAULT NULL,
  `ccavenue_demo` tinyint(1) NOT NULL DEFAULT '1',
  `ccavenue_extra_charge` double(10,2) NOT NULL,
  `ccavenue_status` tinyint(1) NOT NULL,
  `paytm_merchant_key` varchar(100) DEFAULT NULL,
  `paytm_merchant_mid` varchar(100) DEFAULT NULL,
  `paytm_merchant_website` varchar(255) DEFAULT NULL,
  `paytm_industry_type` varchar(100) DEFAULT NULL,
  `paytm_demo` tinyint(1) NOT NULL,
  `paytm_extra_charge` double(10,2) NOT NULL,
  `paytm_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_settings`
--
INSERT INTO `payment_settings` (`id`, `paypal_api_username`, `paypal_api_password`, `paypal_api_signature`, `paypal_email`, `paypal_demo`, `paypal_status`, `stripe_secret`, `stripe_demo`, `stripe_status`, `payumoney_key`, `payumoney_salt`, `payumoney_demo`, `payumoney_status`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, NULL, NULL, NULL, '', 0, 0, '', 0, 0, '', '', 0, 0, 1, '2017-08-24 10:58:24', '2018-04-15 01:30:13', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  `is_add` tinyint(1) NOT NULL,
  `is_edit` tinyint(1) NOT NULL,
  `is_view` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 1, 1, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(2, 1, 2, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(3, 1, 3, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(4, 1, 4, 0, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(5, 1, 5, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(6, 1, 6, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(7, 1, 7, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(8, 1, 8, 0, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(9, 1, 64, 0, 1, 0, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(10, 1, 65, 0, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(11, 1, 63, 0, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(12, 1, 10, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(13, 1, 11, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(14, 1, 12, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(15, 1, 14, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(16, 1, 15, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(17, 1, 16, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(18, 1, 17, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(19, 1, 18, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(20, 1, 19, 1, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(21, 1, 20, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(22, 1, 21, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(23, 1, 23, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(24, 1, 24, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(25, 1, 25, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(26, 1, 26, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(27, 1, 27, 1, 1, 1, 1, 1, '2018-01-13 09:07:29', '0000-00-00 00:00:00', 2, 0),
(28, 1, 28, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(29, 1, 29, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(30, 1, 30, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(31, 1, 31, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(32, 1, 32, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(33, 1, 33, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(34, 1, 34, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(35, 1, 35, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(36, 1, 67, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(37, 1, 68, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(38, 1, 37, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(39, 1, 38, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(40, 1, 66, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(41, 1, 40, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(42, 1, 41, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(43, 1, 42, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(44, 1, 43, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(45, 1, 44, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(46, 1, 45, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(47, 1, 46, 1, 1, 1, 1, 1, '2017-12-23 22:10:34', '0000-00-00 00:00:00', 1, 0),
(48, 1, 47, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(49, 1, 48, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(50, 1, 50, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(51, 1, 51, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(52, 1, 52, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(53, 1, 53, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(54, 1, 54, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(55, 1, 55, 1, 1, 1, 1, 1, '2017-12-23 22:10:34', '0000-00-00 00:00:00', 1, 0),
(56, 1, 56, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(57, 1, 57, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(58, 1, 58, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(59, 1, 59, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(60, 1, 60, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(61, 1, 61, 1, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(62, 1, 62, 0, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(63, 3, 1, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(64, 3, 2, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(65, 3, 3, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(66, 3, 4, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(67, 3, 5, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(68, 3, 6, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(69, 3, 7, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(70, 3, 8, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(71, 3, 64, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(72, 3, 65, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(73, 3, 63, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(74, 3, 10, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(75, 3, 11, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(76, 3, 12, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(77, 3, 14, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(78, 3, 15, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(79, 3, 16, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(80, 3, 17, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(81, 3, 18, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(82, 3, 19, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(83, 3, 20, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(84, 3, 21, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(85, 3, 23, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(86, 3, 24, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(87, 3, 25, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(88, 3, 26, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(89, 3, 27, 1, 1, 0, 1, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0),
(90, 3, 28, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(91, 3, 29, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(92, 3, 30, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(93, 3, 31, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(94, 3, 32, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(95, 3, 33, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(96, 3, 34, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(97, 3, 35, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(98, 3, 67, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(99, 3, 68, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(100, 3, 37, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(101, 3, 38, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(102, 3, 66, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(103, 3, 40, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(104, 3, 41, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(105, 3, 42, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(106, 3, 43, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(107, 3, 44, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(108, 3, 45, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(109, 3, 46, 1, 1, 0, 1, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0),
(110, 3, 47, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(111, 3, 48, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(112, 3, 50, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(113, 3, 51, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(114, 3, 52, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(115, 3, 53, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(116, 3, 54, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(117, 3, 55, 1, 1, 0, 1, 1, '2018-01-03 07:12:55', '0000-00-00 00:00:00', 1, 0),
(118, 3, 56, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(119, 3, 57, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(120, 3, 58, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(121, 3, 59, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(122, 3, 60, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(123, 3, 61, 1, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(124, 3, 62, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(125, 1, 69, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(126, 5, 1, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(127, 5, 2, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(128, 5, 3, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(129, 5, 4, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(130, 5, 5, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(131, 5, 6, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(132, 5, 7, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(133, 5, 8, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(134, 5, 64, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(135, 5, 65, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(136, 5, 63, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(137, 5, 10, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(138, 5, 11, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(139, 5, 12, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(140, 5, 14, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(141, 5, 15, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(142, 5, 16, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(143, 5, 17, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(144, 5, 18, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(145, 5, 19, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(146, 5, 20, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(147, 5, 21, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(148, 5, 23, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(149, 5, 24, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(150, 5, 25, 1, 1, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(151, 5, 26, 1, 1, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(152, 5, 27, 1, 1, 1, 0, 1, '2018-01-13 09:46:35', '0000-00-00 00:00:00', 1, 0),
(153, 5, 28, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(154, 5, 29, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(155, 5, 30, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(156, 5, 31, 1, 1, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(157, 5, 32, 1, 1, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(158, 5, 33, 1, 1, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(159, 5, 34, 1, 1, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(160, 5, 35, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(161, 5, 67, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(162, 5, 68, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(163, 5, 37, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(164, 5, 38, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(165, 5, 66, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(166, 5, 40, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(167, 5, 41, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(168, 5, 42, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(169, 5, 43, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(170, 5, 44, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(171, 5, 45, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(172, 5, 47, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(173, 5, 48, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(174, 5, 69, 1, 1, 1, 1, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(175, 5, 50, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(176, 5, 51, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(177, 5, 52, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(178, 5, 53, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(179, 5, 54, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(180, 5, 56, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(181, 5, 57, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(182, 5, 58, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(183, 5, 59, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(184, 5, 60, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(185, 5, 61, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(186, 5, 62, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(187, 13, 1, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(188, 13, 2, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(189, 13, 3, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(190, 13, 4, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(191, 13, 5, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(192, 13, 6, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(193, 13, 7, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(194, 13, 8, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(195, 13, 64, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(196, 13, 65, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(197, 13, 63, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(198, 13, 10, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(199, 13, 11, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(200, 13, 12, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(201, 13, 14, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(202, 13, 15, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(203, 13, 16, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(204, 13, 17, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(205, 13, 18, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(206, 13, 19, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(207, 13, 20, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(208, 13, 21, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(209, 13, 23, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(210, 13, 24, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(211, 13, 25, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(212, 13, 26, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(213, 13, 27, 0, 0, 0, 0, 1, '2018-02-04 04:46:43', '0000-00-00 00:00:00', 1, 0),
(214, 13, 28, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(215, 13, 29, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(216, 13, 30, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(217, 13, 31, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(218, 13, 32, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(219, 13, 33, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(220, 13, 34, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(221, 13, 35, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(222, 13, 67, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(223, 13, 68, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(224, 13, 37, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(225, 13, 38, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(226, 13, 66, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(227, 13, 40, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(228, 13, 41, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(229, 13, 42, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(230, 13, 43, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(231, 13, 44, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(232, 13, 45, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(233, 13, 47, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(234, 13, 48, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(235, 13, 69, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(236, 13, 50, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(237, 13, 51, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(238, 13, 52, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(239, 13, 53, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(240, 13, 54, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(241, 13, 56, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(242, 13, 57, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(243, 13, 58, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(244, 13, 59, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(245, 13, 60, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(246, 13, 61, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(247, 13, 62, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(248, 3, 69, 1, 1, 1, 1, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(249, 2, 1, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(250, 2, 2, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(251, 2, 3, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(252, 2, 4, 0, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(253, 2, 5, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(254, 2, 6, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(255, 2, 7, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(256, 2, 8, 0, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(257, 2, 64, 0, 1, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(258, 2, 65, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(259, 2, 63, 0, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(260, 2, 10, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(261, 2, 11, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(262, 2, 12, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(263, 2, 14, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(264, 2, 15, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(265, 2, 16, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(266, 2, 17, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(267, 2, 18, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(268, 2, 19, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(269, 2, 20, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(270, 2, 21, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(271, 2, 23, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(272, 2, 24, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(273, 2, 25, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(274, 2, 26, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(275, 2, 28, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(276, 2, 29, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(277, 2, 30, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(278, 2, 31, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(279, 2, 32, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(280, 2, 33, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(281, 2, 34, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(282, 2, 35, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(283, 2, 67, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(284, 2, 68, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(285, 2, 37, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(286, 2, 38, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(287, 2, 66, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(288, 2, 40, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(289, 2, 41, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(290, 2, 42, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(291, 2, 43, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(292, 2, 44, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(293, 2, 45, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(294, 2, 47, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(295, 2, 48, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(296, 2, 69, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(297, 2, 50, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(298, 2, 51, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(299, 2, 52, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(300, 2, 53, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(301, 2, 54, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(302, 2, 56, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(303, 2, 57, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(304, 2, 58, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(305, 2, 59, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(306, 2, 60, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(307, 2, 61, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(308, 2, 62, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(309, 4, 1, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(310, 4, 2, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(311, 4, 3, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(312, 4, 4, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(313, 4, 5, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(314, 4, 6, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(315, 4, 7, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(316, 4, 8, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(317, 4, 64, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(318, 4, 65, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(319, 4, 63, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(320, 4, 10, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(321, 4, 11, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(322, 4, 12, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(323, 4, 14, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(324, 4, 15, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(325, 4, 16, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(326, 4, 17, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(327, 4, 18, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(328, 4, 19, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(329, 4, 20, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(330, 4, 21, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(331, 4, 23, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(332, 4, 24, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(333, 4, 25, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(334, 4, 26, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(335, 4, 28, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(336, 4, 29, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(337, 4, 30, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(338, 4, 31, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(339, 4, 32, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(340, 4, 33, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(341, 4, 34, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(342, 4, 35, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(343, 4, 67, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(344, 4, 68, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(345, 4, 37, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(346, 4, 38, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(347, 4, 66, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(348, 4, 40, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(349, 4, 41, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(350, 4, 42, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(351, 4, 43, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(352, 4, 44, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(353, 4, 45, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(354, 4, 47, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(355, 4, 48, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(356, 4, 69, 1, 1, 1, 1, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(357, 4, 50, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(358, 4, 51, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(359, 4, 52, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(360, 4, 53, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(361, 4, 54, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(362, 4, 56, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(363, 4, 57, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(364, 4, 58, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(365, 4, 59, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(366, 4, 60, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(367, 4, 61, 1, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(368, 4, 62, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(369, 6, 1, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(370, 6, 2, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(371, 6, 3, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(372, 6, 4, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(373, 6, 5, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(374, 6, 6, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(375, 6, 7, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(376, 6, 8, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(377, 6, 64, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(378, 6, 65, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(379, 6, 63, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(380, 6, 10, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(381, 6, 11, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(382, 6, 12, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(383, 6, 14, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(384, 6, 15, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(385, 6, 16, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(386, 6, 17, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(387, 6, 18, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(388, 6, 19, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(389, 6, 20, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(390, 6, 21, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(391, 6, 23, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(392, 6, 24, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(393, 6, 25, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(394, 6, 26, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(395, 6, 28, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(396, 6, 29, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(397, 6, 30, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(398, 6, 31, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(399, 6, 32, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(400, 6, 33, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(401, 6, 34, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(402, 6, 35, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(403, 6, 67, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(404, 6, 68, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(405, 6, 37, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(406, 6, 38, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(407, 6, 66, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(408, 6, 40, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(409, 6, 41, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(410, 6, 42, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(411, 6, 43, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(412, 6, 44, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(413, 6, 45, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(414, 6, 47, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(415, 6, 48, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(416, 6, 69, 1, 1, 1, 1, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(417, 6, 50, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(418, 6, 51, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(419, 6, 52, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(420, 6, 53, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(421, 6, 54, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(422, 6, 56, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(423, 6, 57, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(424, 6, 58, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(425, 6, 59, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(426, 6, 60, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(427, 6, 61, 1, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(428, 6, 62, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(429, 7, 1, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(430, 7, 2, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(431, 7, 3, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(432, 7, 4, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(433, 7, 5, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(434, 7, 6, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(435, 7, 7, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(436, 7, 8, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(437, 7, 64, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(438, 7, 65, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(439, 7, 63, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(440, 7, 10, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(441, 7, 11, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(442, 7, 12, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(443, 7, 14, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(444, 7, 15, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(445, 7, 16, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(446, 7, 17, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(447, 7, 18, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(448, 7, 19, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(449, 7, 20, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(450, 7, 21, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(451, 7, 23, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(452, 7, 24, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(453, 7, 25, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(454, 7, 26, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(455, 7, 28, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(456, 7, 29, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(457, 7, 30, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(458, 7, 31, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(459, 7, 32, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(460, 7, 33, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(461, 7, 34, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(462, 7, 35, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(463, 7, 67, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(464, 7, 68, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(465, 7, 37, 1, 1, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(466, 7, 38, 1, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(467, 7, 66, 1, 1, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(468, 7, 40, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(469, 7, 41, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(470, 7, 42, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(471, 7, 43, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(472, 7, 44, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(473, 7, 45, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(474, 7, 47, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(475, 7, 48, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(476, 7, 69, 1, 1, 1, 1, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(477, 7, 50, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(478, 7, 51, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(479, 7, 52, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(480, 7, 53, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(481, 7, 54, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(482, 7, 56, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(483, 7, 57, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(484, 7, 58, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(485, 7, 59, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(486, 7, 60, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(487, 7, 61, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(488, 7, 62, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(489, 8, 1, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(490, 8, 2, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(491, 8, 3, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(492, 8, 4, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(493, 8, 5, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(494, 8, 6, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(495, 8, 7, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(496, 8, 8, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(497, 8, 64, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(498, 8, 65, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(499, 8, 63, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(500, 8, 10, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(501, 8, 11, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(502, 8, 12, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(503, 8, 14, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(504, 8, 15, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(505, 8, 16, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(506, 8, 17, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(507, 8, 18, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(508, 8, 19, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(509, 8, 20, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(510, 8, 21, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(511, 8, 23, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(512, 8, 24, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(513, 8, 25, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(514, 8, 26, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(515, 8, 28, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(516, 8, 29, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(517, 8, 30, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(518, 8, 31, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(519, 8, 32, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(520, 8, 33, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(521, 8, 34, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(522, 8, 35, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(523, 8, 67, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(524, 8, 68, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(525, 8, 37, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(526, 8, 38, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(527, 8, 66, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(528, 8, 40, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(529, 8, 41, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(530, 8, 42, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(531, 8, 43, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(532, 8, 44, 0, 0, 1, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(533, 8, 45, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(534, 8, 47, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(535, 8, 48, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(536, 8, 69, 1, 1, 1, 1, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(537, 8, 50, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(538, 8, 51, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(539, 8, 52, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(540, 8, 53, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(541, 8, 54, 1, 1, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(542, 8, 56, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(543, 8, 57, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(544, 8, 58, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(545, 8, 59, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(546, 8, 60, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(547, 8, 61, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(548, 8, 62, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(549, 9, 1, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(550, 9, 2, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(551, 9, 3, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(552, 9, 4, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(553, 9, 5, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(554, 9, 6, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(555, 9, 7, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(556, 9, 8, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(557, 9, 64, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(558, 9, 65, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(559, 9, 63, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(560, 9, 10, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(561, 9, 11, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(562, 9, 12, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(563, 9, 14, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(564, 9, 15, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(565, 9, 16, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(566, 9, 17, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(567, 9, 18, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(568, 9, 19, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(569, 9, 20, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(570, 9, 21, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(571, 9, 23, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(572, 9, 24, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(573, 9, 25, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(574, 9, 26, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(575, 9, 28, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(576, 9, 29, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(577, 9, 30, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(578, 9, 31, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(579, 9, 32, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(580, 9, 33, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(581, 9, 34, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(582, 9, 35, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(583, 9, 67, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(584, 9, 68, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(585, 9, 37, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(586, 9, 38, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(587, 9, 66, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(588, 9, 40, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(589, 9, 41, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(590, 9, 42, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(591, 9, 43, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(592, 9, 44, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(593, 9, 45, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(594, 9, 47, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(595, 9, 48, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(596, 9, 69, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(597, 9, 50, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(598, 9, 51, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(599, 9, 52, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(600, 9, 53, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(601, 9, 54, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(602, 9, 56, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(603, 9, 57, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(604, 9, 58, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(605, 9, 59, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(606, 9, 60, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(607, 9, 61, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(608, 9, 62, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(609, 1, 70, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(610, 1, 71, 0, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(611, 1, 72, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(612, 1, 73, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(613, 1, 74, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(614, 1, 75, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(615, 1, 76, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(616, 1, 77, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(617, 1, 78, 0, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(618, 4, 70, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(619, 4, 71, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(620, 4, 72, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(621, 4, 73, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(622, 4, 74, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(623, 4, 77, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(624, 4, 75, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(625, 4, 76, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(626, 4, 78, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(627, 14, 1, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(628, 14, 2, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(629, 14, 3, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(630, 14, 4, 0, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(631, 14, 5, 1, 1, 1, 1, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(632, 14, 6, 1, 1, 1, 1, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0);
INSERT INTO `privileges` (`id`, `role_id`, `operation_id`, `is_add`, `is_edit`, `is_view`, `is_delete`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(633, 14, 7, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(634, 14, 8, 0, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(635, 14, 64, 0, 1, 0, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(636, 14, 65, 0, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(637, 14, 63, 0, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(638, 14, 10, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(639, 14, 11, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(640, 14, 12, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(641, 14, 14, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(642, 14, 15, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(643, 14, 16, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(644, 14, 17, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(645, 14, 18, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(646, 14, 19, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(647, 14, 20, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(648, 14, 21, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(649, 14, 23, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(650, 14, 24, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(651, 14, 25, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(652, 14, 26, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(653, 14, 28, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(654, 14, 29, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(655, 14, 30, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(656, 14, 31, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(657, 14, 32, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(658, 14, 33, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(659, 14, 34, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(660, 14, 35, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(661, 14, 67, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(662, 14, 68, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(663, 14, 37, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(664, 14, 38, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(665, 14, 66, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(666, 14, 40, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(667, 14, 41, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(668, 14, 42, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(669, 14, 43, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(670, 14, 44, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(671, 14, 45, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(672, 14, 47, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(673, 14, 48, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(674, 14, 69, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(675, 14, 50, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(676, 14, 51, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(677, 14, 52, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(678, 14, 53, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(679, 14, 54, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(680, 14, 56, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(681, 14, 57, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(682, 14, 58, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(683, 14, 59, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(684, 14, 60, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(685, 14, 61, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(686, 14, 62, 0, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(687, 14, 70, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(688, 14, 71, 0, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(689, 14, 72, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(690, 14, 73, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(691, 14, 74, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(692, 14, 77, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(693, 14, 75, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(694, 14, 76, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(695, 14, 78, 0, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(696, 3, 70, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(697, 3, 71, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(698, 3, 72, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(699, 3, 73, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(700, 3, 74, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(701, 3, 77, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(702, 3, 75, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(703, 3, 76, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(704, 3, 78, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(705, 9, 70, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(706, 9, 71, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(707, 9, 72, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(708, 9, 73, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(709, 9, 74, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(710, 9, 77, 0, 0, 1, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(711, 9, 75, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(712, 9, 76, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(713, 9, 78, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(714, 8, 70, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(715, 8, 71, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(716, 8, 72, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(717, 8, 73, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(718, 8, 74, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(719, 8, 77, 0, 0, 1, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(720, 8, 75, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(721, 8, 76, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(722, 8, 78, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(723, 7, 70, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(724, 7, 71, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(725, 7, 72, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(726, 7, 73, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(727, 7, 74, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(728, 7, 77, 0, 0, 1, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(729, 7, 75, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(730, 7, 76, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(731, 7, 78, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(732, 6, 70, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(733, 6, 71, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(734, 6, 72, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(735, 6, 73, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(736, 6, 74, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(737, 6, 77, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(738, 6, 75, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(739, 6, 76, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(740, 6, 78, 0, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(741, 2, 70, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(742, 2, 71, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(743, 2, 72, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(744, 2, 73, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(745, 2, 74, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(746, 2, 77, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(747, 2, 75, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(748, 2, 76, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(749, 2, 78, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(750, 13, 70, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(751, 13, 71, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(752, 13, 72, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(753, 13, 73, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(754, 13, 74, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(755, 13, 77, 0, 0, 1, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(756, 13, 75, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(757, 13, 76, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(758, 13, 78, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(759, 5, 70, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(760, 5, 71, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(761, 5, 72, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(762, 5, 73, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(763, 5, 74, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(764, 5, 77, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(765, 5, 75, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(766, 5, 76, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(767, 5, 78, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(768, 1, 79, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(769, 1, 80, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(770, 1, 81, 0, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(771, 1, 82, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(772, 1, 83, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(773, 1, 84, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(774, 1, 85, 0, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(775, 1, 86, 1, 0, 0, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(776, 1, 87, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(777, 1, 88, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(778, 1, 89, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(779, 1, 90, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(780, 1, 91, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(781, 1, 92, 1, 0, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(782, 14, 83, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(783, 14, 84, 1, 1, 1, 1, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(784, 14, 85, 0, 0, 1, 1, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(785, 14, 86, 1, 0, 0, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(786, 14, 87, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(787, 14, 88, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(788, 14, 81, 0, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(789, 14, 82, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(790, 14, 91, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(791, 14, 92, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(792, 14, 79, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(793, 14, 80, 1, 1, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(794, 14, 89, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(795, 14, 90, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(796, 1, 93, 0, 1, 0, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(797, 1, 94, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(798, 2, 83, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(799, 2, 84, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(800, 2, 85, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(801, 2, 93, 0, 1, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(802, 2, 86, 1, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(803, 2, 94, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(804, 2, 87, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(805, 2, 88, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(806, 2, 81, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(807, 2, 82, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(808, 2, 91, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(809, 2, 92, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(810, 2, 79, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(811, 2, 80, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(812, 2, 89, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(813, 2, 90, 1, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(814, 1, 95, 0, 0, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(815, 2, 95, 0, 0, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(816, 3, 83, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(817, 3, 84, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(818, 3, 85, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(819, 3, 93, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(820, 3, 86, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(821, 3, 94, 0, 0, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(822, 3, 87, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(823, 3, 88, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(824, 3, 81, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(825, 3, 82, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(826, 3, 91, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(827, 3, 92, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(828, 3, 95, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(829, 3, 79, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(830, 3, 80, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(831, 3, 89, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(832, 3, 90, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(833, 4, 83, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(834, 4, 84, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(835, 4, 85, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(836, 4, 93, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(837, 4, 86, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(838, 4, 94, 0, 0, 1, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(839, 4, 87, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(840, 4, 88, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(841, 4, 81, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(842, 4, 82, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(843, 4, 91, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(844, 4, 92, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(845, 4, 95, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(846, 4, 79, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(847, 4, 80, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(848, 4, 89, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(849, 4, 90, 0, 0, 0, 0, 1, '2018-08-09 17:39:04', '0000-00-00 00:00:00', 1, 0),
(850, 5, 83, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(851, 5, 84, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(852, 5, 85, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(853, 5, 93, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(854, 5, 86, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(855, 5, 94, 0, 0, 1, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(856, 5, 87, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(857, 5, 88, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(858, 5, 81, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(859, 5, 82, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(860, 5, 91, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(861, 5, 92, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(862, 5, 95, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(863, 5, 79, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(864, 5, 80, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(865, 5, 89, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(866, 5, 90, 0, 0, 0, 0, 1, '2018-08-04 14:01:59', '0000-00-00 00:00:00', 1, 0),
(867, 6, 83, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(868, 6, 84, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(869, 6, 85, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(870, 6, 93, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(871, 6, 86, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(872, 6, 94, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(873, 6, 87, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(874, 6, 88, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(875, 6, 81, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(876, 6, 82, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(877, 6, 91, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(878, 6, 92, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(879, 6, 95, 0, 0, 0, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(880, 6, 79, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(881, 6, 80, 1, 1, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(882, 6, 89, 1, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(883, 6, 90, 1, 0, 1, 0, 1, '2018-08-04 14:03:48', '0000-00-00 00:00:00', 1, 0),
(884, 7, 83, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(885, 7, 84, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(886, 7, 85, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(887, 7, 93, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(888, 7, 86, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(889, 7, 94, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(890, 7, 87, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(891, 7, 88, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(892, 7, 81, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(893, 7, 82, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(894, 7, 91, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(895, 7, 92, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(896, 7, 95, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(897, 7, 79, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(898, 7, 80, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(899, 7, 89, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(900, 7, 90, 0, 0, 0, 0, 1, '2018-08-04 14:04:22', '0000-00-00 00:00:00', 1, 0),
(901, 8, 83, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(902, 8, 84, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(903, 8, 85, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(904, 8, 93, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(905, 8, 86, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(906, 8, 94, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(907, 8, 87, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(908, 8, 88, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(909, 8, 81, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(910, 8, 82, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(911, 8, 91, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(912, 8, 92, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(913, 8, 95, 0, 0, 0, 0, 1, '2018-08-04 14:49:46', '0000-00-00 00:00:00', 1, 0),
(914, 8, 79, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(915, 8, 80, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(916, 8, 89, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(917, 8, 90, 0, 0, 0, 0, 1, '2018-08-04 14:49:47', '0000-00-00 00:00:00', 1, 0),
(918, 9, 83, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(919, 9, 84, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(920, 9, 85, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(921, 9, 93, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(922, 9, 86, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(923, 9, 94, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(924, 9, 87, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(925, 9, 88, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(926, 9, 81, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(927, 9, 82, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(928, 9, 91, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(929, 9, 92, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(930, 9, 95, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(931, 9, 79, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(932, 9, 80, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(933, 9, 89, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(934, 9, 90, 0, 0, 0, 0, 1, '2018-08-04 14:50:32', '0000-00-00 00:00:00', 1, 0),
(935, 13, 83, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(936, 13, 84, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(937, 13, 85, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(938, 13, 93, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(939, 13, 86, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(940, 13, 94, 0, 0, 0, 0, 1, '2018-08-04 14:51:01', '0000-00-00 00:00:00', 1, 0),
(941, 13, 87, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(942, 13, 88, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(943, 13, 81, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(944, 13, 82, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(945, 13, 91, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(946, 13, 92, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(947, 13, 95, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(948, 13, 79, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(949, 13, 80, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(950, 13, 89, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(951, 13, 90, 0, 0, 0, 0, 1, '2018-08-04 14:51:02', '0000-00-00 00:00:00', 1, 0),
(952, 1, 96, 1, 1, 1, 1, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(953, 3, 96, 0, 0, 0, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(954, 3, 97, 1, 1, 1, 0, 1, '2018-12-07 01:28:22', '0000-00-00 00:00:00', 1, 0),
(955, 1, 97, 0, 0, 0, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(956, 1, 98, 1, 1, 1, 0, 1, '2018-12-07 01:42:44', '0000-00-00 00:00:00', 1, 0),
(957, 2, 96, 0, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(958, 2, 97, 0, 0, 0, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(959, 2, 98, 1, 1, 1, 0, 1, '2018-12-07 01:43:14', '0000-00-00 00:00:00', 1, 0),
(960, 14, 93, 0, 0, 0, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(961, 14, 96, 1, 0, 1, 1, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(962, 14, 97, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(963, 14, 94, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(964, 14, 95, 0, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0),
(965, 14, 98, 1, 0, 1, 0, 1, '2019-02-26 19:29:45', '0000-00-00 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `purchase_code` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `attachment` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `note` varchar(255) CHARACTER SET utf8 NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `note`, `is_default`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'super-admin', 'Super Admin', 'Super Admin User', 1, 1, '2017-08-13 12:15:17', '2018-02-09 01:58:57', 0, 1),
(2, 'admin', 'Admin', 'Admin User', 1, 1, '2017-08-13 13:01:36', '0000-00-00 00:00:00', 0, 0),
(3, 'guardian', 'Guardian', 'Guardian/Parent User', 1, 1, '2017-08-13 13:02:05', '2018-02-09 01:59:22', 0, 1),
(4, 'student', 'Student', 'Student User', 1, 1, '2017-08-13 13:02:24', '2018-02-09 01:59:34', 0, 1),
(5, 'teacher', 'Teacher', 'Teacher User', 1, 1, '2017-08-13 13:02:51', '2018-02-09 01:59:46', 0, 1),
(6, 'accountant', 'Accountant', 'Accountant User', 1, 1, '2017-08-13 13:04:00', '2018-02-09 02:00:07', 0, 1),
(7, 'librarian', 'Librarian', 'Librarian User', 1, 1, '2017-08-13 13:04:18', '2018-02-09 02:00:22', 0, 1),
(8, 'receptioniast', 'Receptioniast', 'Receptionist/ Front Desk User', 1, 1, '2017-08-13 13:04:36', '2018-02-09 02:02:30', 0, 1),
(9, 'staff', 'Staff', 'General Staff User', 0, 1, '2017-08-13 13:05:01', '2018-08-04 16:20:09', 0, 1),
(13, 'servent', 'Servent', 'Servant User', 0, 1, '2018-02-04 04:40:37', '2018-02-09 02:03:09', 1, 1),
(14, 'admin-2', 'Admin 2', 'sf gf    gh fffffffffffffffff', 0, 1, '2019-02-26 19:22:17', '2019-02-26 19:23:05', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `hostel_id` int(11) NOT NULL,
  `room_no` varchar(20) CHARACTER SET utf8 NOT NULL,
  `room_type` varchar(10) CHARACTER SET utf8 NOT NULL,
  `total_seat` varchar(50) CHARACTER SET utf8 NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `note` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `vehicle_ids` varchar(150) CHARACTER SET utf8 NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 NOT NULL,
  `route_start` varchar(255) CHARACTER SET utf8 NOT NULL,
  `route_end` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `route_stops`
--

CREATE TABLE `route_stops` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stop_name` varchar(255) NOT NULL,
  `stop_km` varchar(20) NOT NULL,
  `stop_fare` double(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `routines`
--

CREATE TABLE `routines` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `day` varchar(20) CHARACTER SET utf8 NOT NULL,
  `start_time` varchar(20) CHARACTER SET utf8 NOT NULL,
  `end_time` varchar(20) CHARACTER SET utf8 NOT NULL,
  `room_no` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `salary_grades`
--

CREATE TABLE `salary_grades` (
  `id` int(11) NOT NULL,
  `grade_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `basic_salary` double(10,2) NOT NULL,
  `house_rent` double(10,2) NOT NULL,
  `transport` double(10,2) NOT NULL,
  `medical` double(10,2) NOT NULL,
  `over_time_hourly_rate` double(10,2) NOT NULL,
  `provident_fund` double(10,2) NOT NULL,
  `hourly_rate` double(10,2) NOT NULL,
  `total_allowance` double(10,2) NOT NULL,
  `total_deduction` double(10,2) NOT NULL,
  `gross_salary` double(10,2) NOT NULL,
  `net_salary` double(10,2) NOT NULL,
  `note` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `salary_payments`
--

CREATE TABLE `salary_payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `salary_grade_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `expenditure_id` int(11) NOT NULL,
  `salary_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `salary_month` varchar(100) CHARACTER SET utf8 NOT NULL,
  `basic_salary` double(10,2) NOT NULL,
  `house_rent` double(10,2) NOT NULL,
  `transport` double(10,2) NOT NULL,
  `medical` double(10,2) NOT NULL,
  `bonus` double(10,2) NOT NULL,
  `over_time_hourly_rate` double(10,2) NOT NULL,
  `over_time_total_hour` double(10,2) NOT NULL,
  `over_time_amount` double(10,2) NOT NULL,
  `provident_fund` double(10,2) NOT NULL,
  `penalty` double(10,2) NOT NULL,
  `hourly_rate` double(10,2) DEFAULT '0.00',
  `total_hour` double(10,2) DEFAULT NULL,
  `gross_salary` double(10,2) NOT NULL,
  `total_allowance` double(10,2) NOT NULL,
  `total_deduction` double(10,2) NOT NULL,
  `net_salary` double(10,2) NOT NULL,
  `payment_method` varchar(20) CHARACTER SET utf8 NOT NULL,
  `cheque_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `bank_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `payment_to` varchar(20) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `school_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `school_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `registration_date` date DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `currency` varchar(10) CHARACTER SET utf8 NOT NULL,
  `currency_symbol` varchar(10) CHARACTER SET utf8 NOT NULL,
  `language` varchar(50) CHARACTER SET utf8 NOT NULL,
  `footer` text CHARACTER SET utf8 NOT NULL,
  `logo` varchar(120) CHARACTER SET utf8 NOT NULL,
  `front_logo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `session_start_month` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'july',
  `session_end_month` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT 'june',
  `academic_year_id` int(11) DEFAULT NULL,
  `running_year` varchar(50) CHARACTER SET utf8 NOT NULL,
  `school_fax` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `school_lat` varchar(100) DEFAULT NULL,
  `school_lng` varchar(100) DEFAULT NULL,
  `enable_rtl` tinyint(1) NOT NULL DEFAULT '0',
  `enable_frontend` tinyint(1) NOT NULL DEFAULT '1',
  `final_result_type` tinyint(1) DEFAULT '0',
  `default_time_zone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sms_date_format` varchar(100) CHARACTER SET utf8 NOT NULL,
  `google_analytics` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `about_text` text CHARACTER SET utf8,
  `about_image` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `twitter_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_plus_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `youtube_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `instagram_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pinterest_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `school_code`, `school_name`, `registration_date`, `address`, `phone`, `email`, `currency`, `currency_symbol`, `language`, `footer`, `logo`, `front_logo`, `session_start_month`, `session_end_month`, `academic_year_id`, `running_year`, `school_fax`, `school_lat`, `school_lng`, `enable_rtl`, `enable_frontend`, `final_result_type`, `default_time_zone`, `sms_date_format`, `google_analytics`, `about_text`, `about_image`, `facebook_url`, `twitter_url`, `linkedin_url`, `google_plus_url`, `youtube_url`, `instagram_url`, `pinterest_url`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, '123456', 'Windsor Park High School', '2018-12-01', '10433 Wolverine Way  Bellevue, CA 98456', '0123456789', 'info@gsms.com', 'US', '$', 'english', 'Copyright © Windsor Park High School 2018', '1523268322-school-logo.png', '1544101067-front-logo.png', 'july', 'june', 3, 'July 2018 - June 2019', '346546', '', '', 0, 1, 1, 'Asia/Dhaka', 'M j, Y', NULL, '', '', '', '', '', '', '', '', '', 1, '2017-08-23 09:40:28', '2019-02-27 16:05:36', 1, 1);

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `sms_settings`
--

CREATE TABLE `sms_settings` (
  `id` int(11) NOT NULL,
  `clickatell_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_api_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_from_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `clickatell_status` tinyint(1) DEFAULT NULL,
  `twilio_account_sid` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `twilio_auth_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `twilio_from_number` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `clickatell_mo_no` varchar(50) CHARACTER SET utf8 NOT NULL,
  `twilio_status` tinyint(1) DEFAULT NULL,
  `bulk_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bulk_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `bulk_status` tinyint(1) DEFAULT NULL,
  `msg91_auth_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `msg91_sender_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `msg91_status` tinyint(1) DEFAULT NULL,
  `plivo_auth_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `plivo_auth_token` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `plivo_from_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `plivo_status` tinyint(1) DEFAULT NULL,
  `textlocal_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `textlocal_hash_key` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `textlocal_sender_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `textlocal_status` tinyint(1) NOT NULL,
  `smscountry_username` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `smscountry_password` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `smscountry_sender_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `smscountry_status` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sms_settings`
--

INSERT INTO `sms_settings` (`id`, `clickatell_username`, `clickatell_password`, `clickatell_api_key`, `clickatell_from_number`, `clickatell_status`, `twilio_account_sid`, `twilio_auth_token`, `twilio_from_number`, `clickatell_mo_no`, `twilio_status`, `bulk_username`, `bulk_password`, `bulk_status`, `msg91_auth_key`, `msg91_sender_id`, `msg91_status`, `plivo_auth_id`, `plivo_auth_token`, `plivo_from_number`, `plivo_status`, `textlocal_username`, `textlocal_hash_key`, `textlocal_sender_id`, `textlocal_status`, `smscountry_username`, `smscountry_password`, `smscountry_sender_id`, `smscountry_status`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, '', '', '', '', 0, '', '', '', '', 0, '', '', 0, '', '', 0, '', '', '', 0, '', '', '', 0, '', '', '', 0, 1, '2017-08-24 13:22:49', '2019-02-06 16:23:27', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sms_templates`
--

CREATE TABLE `sms_templates` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admission_no` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `admission_date` date NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `relation_with` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `registration_no` varchar(50) CHARACTER SET utf8 NOT NULL,
  `group` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `present_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `blood_group` varchar(10) CHARACTER SET utf8 NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dob` date NOT NULL,
  `age` int(11) DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `other_info` text,
  `is_library_member` tinyint(1) NOT NULL DEFAULT '0',
  `is_hostel_member` tinyint(1) NOT NULL DEFAULT '0',
  `is_transport_member` tinyint(1) NOT NULL DEFAULT '0',
  `discount_id` int(11) NOT NULL,
  `previous_school` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `previous_class` int(11) DEFAULT NULL,
  `transfer_certificate` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `health_condition` text CHARACTER SET utf8,
  `national_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `second_language` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `father_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `father_education` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_profession` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_designation` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `father_photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `mother_education` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_profession` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_designation` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `mother_photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `student_activities`
--

CREATE TABLE `student_activities` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `activity` text CHARACTER SET utf8 NOT NULL,
  `activity_date` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `student_attendances`
--

CREATE TABLE `student_attendances` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `month` varchar(10) CHARACTER SET utf8 NOT NULL,
  `year` varchar(10) CHARACTER SET utf8 NOT NULL,
  `day_1` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_2` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_3` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_4` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_5` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_6` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_7` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_8` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_9` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_10` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_11` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_12` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_13` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_14` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_15` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_16` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_17` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_18` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_19` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_20` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_21` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_22` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_23` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_24` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_25` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_26` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_27` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_28` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_29` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_30` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_31` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `code` varchar(50) CHARACTER SET utf8 NOT NULL,
  `author` varchar(100) CHARACTER SET utf8 NOT NULL,
  `pass_mark` int(11) NOT NULL,
  `full_mark` int(11) NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_estonian_ci,
  `suggestion` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `syllabuses`
--

CREATE TABLE `syllabuses` (
  `id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `syllabus` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `note` text CHARACTER SET utf8,
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `national_id` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `salary_grade_id` int(11) NOT NULL,
  `salary_type` varchar(20) CHARACTER SET utf8 NOT NULL,
  `responsibility` varchar(255) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `present_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `permanent_address` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8 NOT NULL,
  `blood_group` varchar(10) CHARACTER SET utf8 NOT NULL,
  `religion` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dob` date NOT NULL,
  `joining_date` date NOT NULL,
  `resign_date` date DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `resume` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `facebook_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `linkedin_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `twitter_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `google_plus_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `instagram_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `youtube_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pinterest_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_view_on_web` tinyint(1) NOT NULL DEFAULT '0',
  `other_info` text,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `teacher_attendances`
--

CREATE TABLE `teacher_attendances` (
  `id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `month` varchar(10) CHARACTER SET utf8 NOT NULL,
  `year` varchar(10) CHARACTER SET utf8 NOT NULL,
  `day_1` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_2` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_3` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_4` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_5` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_6` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_7` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_8` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_9` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_10` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_11` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_12` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_13` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_14` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_15` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_16` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_17` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_18` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_19` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_20` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_21` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_22` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_23` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_24` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_25` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_26` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_27` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_28` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_29` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_30` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `day_31` varchar(1) CHARACTER SET utf8 DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `text_messages`
--

CREATE TABLE `text_messages` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `sender_role_id` int(11) NOT NULL,
  `receivers` text,
  `academic_year_id` int(11) NOT NULL,
  `sms_gateway` varchar(20) CHARACTER SET utf8 NOT NULL,
  `sms_type` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '1. general, 2. Attendance, 3. Due Fee, 4. Result ',
  `absent_date` date NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `name` varchar(120) CHARACTER SET utf8 NOT NULL,
  `slug` varchar(120) CHARACTER SET utf8 NOT NULL,
  `color_code` varchar(10) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL,
  `is_active` tinyint(1) NOT NULL COMMENT '1 = Active, 0 = Inactive',
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `name`, `slug`, `color_code`, `description`, `is_active`, `status`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, 'DodgerBlue ', 'dodger-blue', '#00376b', 'cbcvbced', 1, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(2, 'Black ', 'black', '#23282d', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(3, 'LightSeaGreen ', 'light-sea-green', '#20B2AA', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(4, 'MediumPurple ', 'medium-purple', '#9370DB', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(5, 'Orchid', 'orchid', '#DA70D6', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(6, 'RebeccaPurple ', 'rebecca-purple', '#663399', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(7, 'Red', 'red', '#e80000', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(8, 'SlateGray', 'slate-gray', '#2A3F54', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(9, 'Maroon', 'maroon', '#800000', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(10, 'DarkOrange', 'dark-orange', '#FF8C00', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(11, 'DeepPink', 'deep-pink', '#FF1493', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0),
(12, 'LimeGreen', 'lime-green', '#32CD32', 'cbcvbced', 0, 1, '2017-08-18 12:59:25', '2017-08-18 13:03:43', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) CHARACTER SET utf8 NOT NULL,
  `bank_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cheque_no` varchar(100) CHARACTER SET utf8 NOT NULL,
  `transaction_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `payment_date` date NOT NULL,
  `pum_first_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pum_email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `pum_phone` varchar(20) CHARACTER SET utf8 NOT NULL,
  `stripe_card_number` varchar(50) CHARACTER SET utf8 NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `transport_members`
--

CREATE TABLE `transport_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `route_stop_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `finger_print` varchar(255) NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `temp_password` varchar(255) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `reset_key` varchar(100) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1= Active, 0 = InActive',
  `last_logged_in` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_by` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `finger_print`, `unique_id`, `role_id`, `password`, `temp_password`, `email`, `reset_key`, `status`, `last_logged_in`, `created_at`, `modified_at`, `created_by`, `modified_by`) VALUES
(1, '', '', 1, 'e10adc3949ba59abbe56e057f20f883e', 'MTIzNDU2Nw==', 'superadmin@gsms.com', '', 1, '2019-02-27 02:37:48', '2013-11-15 20:33:03', '2018-01-13 10:51:12', 0, 1);


--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `number` varchar(100) CHARACTER SET utf8 NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 NOT NULL,
  `driver` varchar(100) CHARACTER SET utf8 NOT NULL,
  `license` varchar(100) CHARACTER SET utf8 NOT NULL,
  `contact` varchar(20) CHARACTER SET utf8 NOT NULL,
  `is_allocated` tinyint(1) NOT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `academic_year_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `coming_from` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `reason` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `check_in` datetime DEFAULT NULL,
  `check_out` datetime DEFAULT NULL,
  `note` text CHARACTER SET utf8 NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `book_issues`
--
ALTER TABLE `book_issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `designations`
--
ALTER TABLE `designations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `exam_attendances`
--
ALTER TABLE `exam_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `expenditures`
--
ALTER TABLE `expenditures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `expenditure_heads`
--
ALTER TABLE `expenditure_heads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `fees_amount`
--
ALTER TABLE `fees_amount`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `final_results`
--
ALTER TABLE `final_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `guardian_feedbacks`
--
ALTER TABLE `guardian_feedbacks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `hostels`
--
ALTER TABLE `hostels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `hostel_members`
--
ALTER TABLE `hostel_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `income_heads`
--
ALTER TABLE `income_heads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `library_members`
--
ALTER TABLE `library_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `mark_emails`
--
ALTER TABLE `mark_emails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `mark_smses`
--
ALTER TABLE `mark_smses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `message_relationships`
--
ALTER TABLE `message_relationships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_slug` (`page_slug`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `payment_settings`
--
ALTER TABLE `payment_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `route_stops`
--
ALTER TABLE `route_stops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `routines`
--
ALTER TABLE `routines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `salary_grades`
--
ALTER TABLE `salary_grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `salary_payments`
--
ALTER TABLE `salary_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `sms_settings`
--
ALTER TABLE `sms_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_templates`
--
ALTER TABLE `sms_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `student_activities`
--
ALTER TABLE `student_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `student_attendances`
--
ALTER TABLE `student_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `syllabuses`
--
ALTER TABLE `syllabuses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `text_messages`
--
ALTER TABLE `text_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `transport_members`
--
ALTER TABLE `transport_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `book_issues`
--
ALTER TABLE `book_issues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `designations`
--
ALTER TABLE `designations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `employee_attendances`
--
ALTER TABLE `employee_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `exam_attendances`
--
ALTER TABLE `exam_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `exam_schedules`
--
ALTER TABLE `exam_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `expenditures`
--
ALTER TABLE `expenditures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `expenditure_heads`
--
ALTER TABLE `expenditure_heads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `fees_amount`
--
ALTER TABLE `fees_amount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `final_results`
--
ALTER TABLE `final_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `guardian_feedbacks`
--
ALTER TABLE `guardian_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `hostels`
--
ALTER TABLE `hostels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `hostel_members`
--
ALTER TABLE `hostel_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `income_heads`
--
ALTER TABLE `income_heads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `library_members`
--
ALTER TABLE `library_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `mark_emails`
--
ALTER TABLE `mark_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `mark_smses`
--
ALTER TABLE `mark_smses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `message_relationships`
--
ALTER TABLE `message_relationships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `operations`
--
ALTER TABLE `operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_settings`
--
ALTER TABLE `payment_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=966;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `route_stops`
--
ALTER TABLE `route_stops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `routines`
--
ALTER TABLE `routines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `salary_grades`
--
ALTER TABLE `salary_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `salary_payments`
--
ALTER TABLE `salary_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `sms_settings`
--
ALTER TABLE `sms_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_templates`
--
ALTER TABLE `sms_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `student_activities`
--
ALTER TABLE `student_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `student_attendances`
--
ALTER TABLE `student_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `syllabuses`
--
ALTER TABLE `syllabuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `text_messages`
--
ALTER TABLE `text_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `transport_members`
--
ALTER TABLE `transport_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;