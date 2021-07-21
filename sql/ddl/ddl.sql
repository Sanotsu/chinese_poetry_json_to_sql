-- 曹操诗歌表
CREATE TABLE chinese_poetry.caocao_poetry (
	uid INT auto_increment NOT NULL COMMENT '编号',
	title varchar(100) NOT NULL COMMENT '题目',
	author varchar(45) DEFAULT "曹操" NULL COMMENT '作者',
	paragraphs TEXT NOT NULL COMMENT '诗歌正文',
	CONSTRAINT caocao_poetry_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci;


-- 楚辞
-- 本来比较纠结 Songs_of_Chu 用大些还是小写.斟酌了一下都用小写吧
CREATE TABLE chinese_poetry.songs_of_chu (
	uid int auto_increment NOT NULL,
	title varchar(100) NOT NULL COMMENT '题目',
	`section` varchar(100) NOT NULL COMMENT '编目',
	author varchar(45) DEFAULT '' NOT NULL COMMENT '作者',
	content TEXT NOT NULL COMMENT '诗歌正文',
	CONSTRAINT songs_of_chu_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='楚辞.楚辞的英文翻译就是 Songs of Chu.';


-- 宋词
CREATE TABLE chinese_poetry.song_ci (
	uid INT auto_increment NOT NULL,
	author varchar(100) NOT NULL COMMENT '作者',
	rhythmic varchar(100) NOT NULL COMMENT '词牌名',
	paragraphs TEXT NOT NULL COMMENT '正文',
	CONSTRAINT song_ci_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='宋词';

-- 唐诗
CREATE TABLE chinese_poetry.tang_poetry (
	uid INT auto_increment NOT NULL,
	author varchar(100) NOT NULL COMMENT '作者',
	title varchar(1024) NOT NULL COMMENT '题目', -- 实测,这个栏位有超过700个字的.但正如原作者所说,有误还需勘查
	paragraphs text NOT NULL COMMENT '诗歌正文',
	CONSTRAINT tang_poetry_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='唐诗';


-- 宋诗
CREATE TABLE chinese_poetry.song_poetry (
	uid INT auto_increment NOT NULL,
	author varchar(100) NOT NULL COMMENT '作者',
	title varchar(1024) NOT NULL COMMENT '题目', -- 实测,这个栏位有超过700个字的.但正如原作者所说,有误还需勘查
	paragraphs text NOT NULL COMMENT '诗歌正文',
	CONSTRAINT tang_poetry_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='宋诗';

-- 论语
CREATE TABLE chinese_poetry.analects (
	uid INT auto_increment NOT NULL,
	chapter varchar(100) NOT NULL COMMENT '篇目',
	paragraphs TEXT NOT NULL COMMENT '正文',
	CONSTRAINT analects_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='论语,英文就是Analects.';


-- 元曲
CREATE TABLE chinese_poetry.yuan_opera (
	uid INT auto_increment NOT NULL,
	author varchar(100) NOT NULL COMMENT '作者',
	title varchar(512) NOT NULL COMMENT '题目',
	paragraphs TEXT NOT NULL COMMENT '正文',
	CONSTRAINT yuan_opera_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='元曲,Yuan Opera.';


-- 幽梦影
CREATE TABLE chinese_poetry.you_meng_ying (
	uid INT auto_increment NOT NULL,
	content TEXT NOT NULL COMMENT '内容',
	comment TEXT NOT NULL COMMENT '点评',
	CONSTRAINT you_meng_ying_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='幽梦影';


-- 诗经
CREATE TABLE chinese_poetry.the_book_of_songs (
	uid INT auto_increment NOT NULL,
	title varchar(100) NOT NULL COMMENT '题目',
	chapter varchar(100) NOT NULL COMMENT '部分,风\\雅\\颂之一',
	`section` varchar(100) NOT NULL COMMENT '篇章,例如周南\\召南\\卫风...',
	content TEXT NOT NULL COMMENT '诗歌正文',
	CONSTRAINT the_book_of_songs_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='诗经,The Book of Songs.';

-- 花间集
CREATE TABLE chinese_poetry.hua_jian_ji (
	uid INT auto_increment NOT NULL,
	rhythmic varchar(100) NOT NULL COMMENT '词牌名',
	title varchar(100) NOT NULL COMMENT '题目',
	author varchar(100) NOT NULL COMMENT '作者',
	paragraphs varchar(1000) NOT NULL COMMENT '词正文',
	notes varchar(1000) NOT NULL COMMENT '评注',
	CONSTRAINT hua_jian_ji_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='花间集';


-- 南唐二主词
CREATE TABLE chinese_poetry.nan_tang_er_zhu_ci (
	uid INT auto_increment NOT NULL,
	rhythmic varchar(100) NOT NULL COMMENT '词牌名',
	title varchar(100) NOT NULL COMMENT '题目',
	author varchar(100) NOT NULL COMMENT '作者',
	paragraphs varchar(1000) NOT NULL COMMENT '词正文',
	notes varchar(2000) NOT NULL COMMENT '评注',
	CONSTRAINT nan_tang_er_zhu_ci_PK PRIMARY KEY (uid)
)
ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_general_ci
COMMENT='南唐二主词';

-- 还没处理的 蒙学 四书五经