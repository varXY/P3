//
//  Chinese.swift
//  P3
//
//  Created by 文川术 on 2/8/16.
//  Copyright © 2016 myname. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Chinese {

	init() {
		let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
		dispatch_async(queue) {
			self.getSixForSelectTheSame_1()
		}
	}

	var forSameOrNot = [[String]]()
	var forSelectTheSame = [[String]]()
	var forSpell = [String]()

	let allPossiblePinyin = ["a", "ai", "an", "ang", "ao", "ba", "bai", "ban", "bang", "bao", "bei", "ben", "beng", "bi", "bian", "biao", "bie", "bin", "bing", "bo", "bu", "ca", "cai", "can", "cang", "cao", "ce", "cen", "ceng", "cha", "chai", "chan", "chang", "chao", "che", "chen", "cheng", "chi", "chong", "chou", "chu", "chuai", "chuan", "chuang", "chui", "chun", "chuo", "ci", "cong", "cou", "cu", "cuan", "cui", "cun", "cuo", "da", "dai", "dan", "dang", "dao", "de", "dei", "deng", "di", "dian", "diao", "die", "ding", "diu", "dong", "dou", "du", "duan", "dui", "dun", "duo", "e", "en", "er", "fa", "fan", "fang", "fei", "fen", "feng", "fo", "fou", "fu", "ga", "gai", "gan", "gang", "gao", "ge", "gei", "gen", "geng", "gong", "gou", "gu", "gua", "guai", "guan", "guang", "gui", "gun", "guo", "ha", "hai", "han", "hang", "hao", "he", "hei", "hen", "heng", "hong", "hou", "hu", "hua", "huai", "huan", "huang", "hui", "hun", "huo", "ji", "jia", "jian", "jiang", "jiao", "jie", "jin", "jing", "jiong", "jiu", "ju", "juan", "jue", "jun", "ka", "kai", "kan", "kang", "kao", "ke", "ken", "keng", "kong", "kou", "ku", "kua", "kuai", "kuan", "kuang", "kui", "kun", "kuo", "la", "lai", "lan", "lang", "lao", "le", "lei", "leng", "li", "lia", "lian", "liang", "liao", "lie", "lin", "ling", "liu", "long", "lou", "lu", "lv", "luan", "lun", "luo", "ma", "mai", "man", "mang", "mao", "me", "mei", "men", "meng", "mi", "mian", "miao", "mie", "min", "ming", "miu", "mo", "mou", "mu", "na", "nai", "nan", "nang", "nao", "ne", "nei", "nen", "neng", "ni", "nian", "niang", "niao", "nie", "nin", "ning", "niu", "nong", "nu", "nv", "nuan", "nuo", "o", "ou", "pa", "pai", "pan", "pang", "pao", "pei", "pen", "peng", "pi", "pian", "piao", "pie", "pin", "ping", "po", "pou", "pu", "qi", "qia", "qian", "qiang", "qiao", "qie", "qin", "qing", "qiong", "qiu", "qu", "quan", "que", "qun", "ran", "rang", "rao", "re", "ren", "reng", "ri", "rong", "rou", "ru", "ruan", "rui", "run", "ruo", "sa", "sai", "san", "sang", "sao", "se", "sen", "seng", "sha", "shai", "shan", "shang", "shao", "she", "shei", "shen", "sheng", "shi", "shou", "shu", "shua", "shuai", "shuan", "shuang", "shui", "shun", "shuo", "si", "song", "sou", "su", "suan", "sui", "sun", "suo", "ta", "tai", "tan", "tang", "tao", "te", "teng", "ti", "tian", "tiao", "tie", "ting", "tong", "tou", "tu", "tuan", "tui", "tun", "tuo", "wa", "wai", "wan", "wang", "wei", "wen", "weng", "wo", "wu", "xi", "xia", "xian", "xiang", "xiao", "xie", "xin", "xing", "xiong", "xiu", "xu", "xuan", "xue", "xun", "ya", "yan", "yang", "yao", "ye", "yi", "yin", "ying", "yo", "yong", "you", "yu", "yuan", "yue", "yun", "za", "zai", "zan", "zang", "zao", "ze", "zei", "zen", "zeng", "zha", "zhai", "zhan", "zhang", "zhao", "zhe", "zhei", "zhen", "zheng", "zhi", "zhong", "zhou", "zhu", "zhua", "zhuai", "zhuan", "zhuang", "zhui", "zhun", "zhuo", "zi", "zong", "zou", "zu", "zuan", "zui", "zun", "zuo"]

	let oftenUsedCharacters = "啊阿埃挨哎唉哀皑癌蔼矮艾碍爱隘鞍氨安俺按暗岸胺案肮昂盎凹敖熬翱袄傲奥懊澳芭捌扒叭吧笆八疤巴拔跋靶把耙坝霸罢爸白柏百摆佰败拜稗斑班搬扳般颁板版扮拌伴瓣半办绊邦帮梆榜膀绑棒磅蚌镑傍谤苞胞包褒剥薄雹保堡饱宝抱报暴豹鲍爆杯碑悲卑北辈背贝钡倍狈备惫焙被奔苯本笨崩绷甭泵蹦迸逼鼻比鄙笔彼碧蓖蔽毕毙毖币庇痹闭敝弊必辟壁臂避陛鞭边编贬扁便变卞辨辩辫遍标彪膘表鳖憋别瘪彬斌濒滨宾摈兵冰柄丙秉饼炳病并玻菠播拨钵波博勃搏铂箔伯帛舶脖膊渤泊驳捕卜哺补埠不布步簿部怖擦猜裁材才财睬踩采彩菜蔡餐参蚕残惭惨灿苍舱仓沧藏操糙槽曹草厕策侧册测层蹭插叉茬茶查碴搽察岔差诧拆柴豺搀掺蝉馋谗缠铲产阐颤昌猖场尝常长偿肠厂敞畅唱倡超抄钞朝嘲潮巢吵炒车扯撤掣彻澈郴臣辰尘晨忱沉陈趁衬撑称城橙成呈乘程惩澄诚承逞骋秤吃痴持匙池迟弛驰耻齿侈尺赤翅斥炽充冲虫崇宠抽酬畴踌稠愁筹仇绸瞅丑臭初出橱厨躇锄雏滁除楚础储矗搐触处揣川穿椽传船喘串疮窗幢床闯创吹炊捶锤垂春椿醇唇淳纯蠢戳绰疵茨磁雌辞慈瓷词此刺赐次聪葱囱匆从丛凑粗醋簇促蹿篡窜摧崔催脆瘁粹淬翠村存寸磋撮搓措挫错搭达答瘩打大呆歹傣戴带殆代贷袋待逮怠耽担丹单郸掸胆旦氮但惮淡诞弹蛋当挡党荡档刀捣蹈倒岛祷导到稻悼道盗德得的蹬灯登等瞪凳邓堤低滴迪敌笛狄涤翟嫡抵底地蒂第帝弟递缔颠掂滇碘点典靛垫电佃甸店惦奠淀殿碉叼雕凋刁掉吊钓调跌爹碟蝶迭谍叠丁盯叮钉顶鼎锭定订丢东冬董懂动栋侗恫冻洞兜抖斗陡豆逗痘都督毒犊独读堵睹赌杜镀肚度渡妒端短锻段断缎堆兑队对墩吨蹲敦顿囤钝盾遁掇哆多夺垛躲朵跺舵剁惰堕蛾峨鹅俄额讹娥恶厄扼遏鄂饿恩而儿耳尔饵洱二贰发罚筏伐乏阀法珐藩帆番翻樊矾钒繁凡烦反返范贩犯饭泛坊芳方肪房防妨仿访纺放菲非啡飞肥匪诽吠肺废沸费芬酚吩氛分纷坟焚汾粉奋份忿愤粪丰封枫蜂峰锋风疯烽逢冯缝讽奉凤佛否夫敷肤孵扶拂辐幅氟符伏俘服浮涪福袱弗甫抚辅俯釜斧脯腑府腐赴副覆赋复傅付阜父腹负富讣附妇缚咐噶嘎该改概钙盖溉干甘杆柑竿肝赶感秆敢赣冈刚钢缸肛纲岗港杠篙皋高膏羔糕搞镐稿告哥歌搁戈鸽胳疙割革葛格蛤阁隔铬个各给根跟耕更庚羹埂耿梗工攻功恭龚供躬公宫弓巩汞拱贡共钩勾沟苟狗垢构购够辜菇咕箍估沽孤姑鼓古蛊骨谷股故顾固雇刮瓜剐寡挂褂乖拐怪棺关官冠观管馆罐惯灌贯光广逛瑰规圭硅归龟闺轨鬼诡癸桂柜跪贵刽辊滚棍锅郭国果裹过哈骸孩海氦亥害骇酣憨邯韩含涵寒函喊罕翰撼捍旱憾悍焊汗汉夯杭航壕嚎豪毫郝好耗号浩呵喝荷菏核禾和何合盒貉阂河涸赫褐鹤贺嘿黑痕很狠恨哼亨横衡恒轰哄烘虹鸿洪宏弘红喉侯猴吼厚候后呼乎忽瑚壶葫胡蝴狐糊湖弧虎唬护互沪户花哗华猾滑画划化话槐徊怀淮坏欢环桓还缓换患唤痪豢焕涣宦幻荒慌黄磺蝗簧皇凰惶煌晃幌恍谎灰挥辉徽恢蛔回毁悔慧卉惠晦贿秽会烩汇讳诲绘荤昏婚魂浑混豁活伙火获或惑霍货祸击圾基机畸稽积箕肌饥迹激讥鸡姬绩缉吉极棘辑籍集及急疾汲即嫉级挤几脊己蓟技冀季伎祭剂悸济寄寂计记既忌际妓继纪嘉枷夹佳家加荚颊贾甲钾假稼价架驾嫁歼监坚尖笺间煎兼肩艰奸缄茧检柬碱碱拣捡简俭剪减荐槛鉴践贱见键箭件健舰剑饯渐溅涧建僵姜将浆江疆蒋桨奖讲匠酱降蕉椒礁焦胶交郊浇骄娇嚼搅铰矫侥脚狡角饺缴绞剿教酵轿较叫窖揭接皆秸街阶截劫节桔杰捷睫竭洁结解姐戒藉芥界借介疥诫届巾筋斤金今津襟紧锦仅谨进靳晋禁近烬浸尽劲荆兢茎睛晶鲸京惊精粳经井警景颈静境敬镜径痉靖竟竞净炯窘揪究纠玖韭久灸九酒厩救旧臼舅咎就疚鞠拘狙疽居驹菊局咀矩举沮聚拒据巨具距踞锯俱句惧炬剧捐鹃娟倦眷卷绢撅攫抉掘倔爵觉决诀绝均菌钧军君峻俊竣浚郡骏喀咖卡咯开揩楷凯慨刊堪勘坎砍看康慷糠扛抗亢炕考拷烤靠坷苛柯棵磕颗科壳咳可渴克刻客课肯啃垦恳坑吭空恐孔控抠口扣寇枯哭窟苦酷库裤夸垮挎跨胯块筷侩快宽款匡筐狂框矿眶旷况亏盔岿窥葵奎魁傀馈愧溃坤昆捆困括扩廓阔垃拉喇蜡腊辣啦莱来赖蓝婪栏拦篮阑兰澜谰揽览懒缆烂滥琅榔狼廊郎朗浪捞劳牢老佬姥酪烙涝勒乐雷镭蕾磊累儡垒擂肋类泪棱楞冷厘梨犁黎篱狸离漓理李里鲤礼莉荔吏栗丽厉励砾历利僳例俐痢立粒沥隶力璃哩俩联莲连镰廉怜涟帘敛脸链恋炼练粮凉梁粱良两辆量晾亮谅撩聊僚疗燎寥辽潦了撂镣廖料列裂烈劣猎琳林磷霖临邻鳞淋凛赁吝拎玲菱零龄铃伶羚凌灵陵岭领另令溜琉榴硫馏留刘瘤流柳六龙聋咙笼窿隆垄拢陇楼娄搂篓漏陋芦卢颅庐炉掳卤虏鲁麓碌露路赂鹿潞禄录陆戮驴吕铝侣旅履屡缕虑氯律率滤绿峦挛孪滦卵乱掠略抡轮伦仑沦纶论萝螺罗逻锣箩骡裸落洛骆络妈麻玛码蚂马骂嘛吗埋买麦卖迈脉瞒馒蛮满蔓曼慢漫谩芒茫盲氓忙莽猫茅锚毛矛铆卯茂冒帽貌贸么玫枚梅酶霉煤没眉媒镁每美昧寐妹媚门闷们萌蒙檬盟锰猛梦孟眯醚靡糜迷谜弥米秘觅泌蜜密幂棉眠绵冕免勉娩缅面苗描瞄藐秒渺庙妙蔑灭民抿皿敏悯闽明螟鸣铭名命谬摸摹蘑模膜磨摩魔抹末莫墨默沫漠寞陌谋牟某拇牡亩姆母墓暮幕募慕木目睦牧穆拿哪呐钠那娜纳氖乃奶耐奈南男难囊挠脑恼闹淖呢馁内嫩能妮霓倪泥尼拟你匿腻逆溺蔫拈年碾撵捻念娘酿鸟尿捏聂孽啮镊镍涅您柠狞凝宁拧泞牛扭钮纽脓浓农弄奴努怒女暖虐疟挪懦糯诺哦欧鸥殴藕呕偶沤啪趴爬帕怕琶拍排牌徘湃派攀潘盘磐盼畔判叛乓庞旁耪胖抛咆刨炮袍跑泡呸胚培裴赔陪配佩沛喷盆砰抨烹澎彭蓬棚硼篷膨朋鹏捧碰坯砒霹批披劈琵毗啤脾疲皮匹痞僻屁譬篇偏片骗飘漂瓢票撇瞥拼频贫品聘乒坪苹萍平凭瓶评屏坡泼颇婆破魄迫粕剖扑铺仆莆葡菩蒲埔朴圃普浦谱曝瀑期欺栖戚妻七凄漆柒沏其棋奇歧畦崎脐齐旗祈祁骑起岂乞企启契砌器气迄弃汽泣讫掐洽牵扦钎铅千迁签仟谦乾黔钱钳前潜遣浅谴堑嵌欠歉枪呛腔羌墙蔷强抢橇锹敲悄桥瞧乔侨巧鞘撬翘峭俏窍切茄且怯窃钦侵亲秦琴勤芹擒禽寝沁青轻氢倾卿清擎晴氰情顷请庆琼穷秋丘邱球求囚酋泅趋区蛆曲躯屈驱渠取娶龋趣去圈颧权醛泉全痊拳犬券劝缺炔瘸却鹊榷确雀裙群然燃冉染瓤壤攘嚷让饶扰绕惹热壬仁人忍韧任认刃妊纫扔仍日戎茸蓉荣融熔溶容绒冗揉柔肉茹蠕儒孺如辱乳汝入褥软阮蕊瑞锐闰润若弱撒洒萨腮鳃塞赛三叁伞散桑嗓丧搔骚扫嫂瑟色涩森僧莎砂杀刹沙纱傻啥煞筛晒珊苫杉山删煽衫闪陕擅赡膳善汕扇缮墒伤商赏晌上尚裳梢捎稍烧芍勺韶少哨邵绍奢赊蛇舌舍赦摄射慑涉社设砷申呻伸身深娠绅神沈审婶甚肾慎渗声生甥牲升绳省盛剩胜圣师失狮施湿诗尸虱十石拾时什食蚀实识史矢使屎驶始式示士世柿事拭誓逝势是嗜噬适仕侍释饰氏市恃室视试收手首守寿授售受瘦兽蔬枢梳殊抒输叔舒淑疏书赎孰熟薯暑曙署蜀黍鼠属术述树束戍竖墅庶数漱恕刷耍摔衰甩帅栓拴霜双爽谁水睡税吮瞬顺舜说硕朔烁斯撕嘶思私司丝死肆寺嗣四伺似饲巳松耸怂颂送宋讼诵搜艘擞嗽苏酥俗素速粟僳塑溯宿诉肃酸蒜算虽隋随绥髓碎岁穗遂隧祟孙损笋蓑梭唆缩琐索锁所塌他它她塔獭挞蹋踏胎苔抬台泰酞太态汰坍摊贪瘫滩坛檀痰潭谭谈坦毯袒碳探叹炭汤塘搪堂棠膛唐糖倘躺淌趟烫掏涛滔绦萄桃逃淘陶讨套特藤腾疼誊梯剔踢锑提题蹄啼体替嚏惕涕剃屉天添填田甜恬舔腆挑条迢眺跳贴铁帖厅听烃汀廷停亭庭挺艇通桐酮瞳同铜彤童桶捅筒统痛偷投头透凸秃突图徒途涂屠土吐兔湍团推颓腿蜕褪退吞屯臀拖托脱鸵陀驮驼椭妥拓唾挖哇蛙洼娃瓦袜歪外豌弯湾玩顽丸烷完碗挽晚皖惋宛婉万腕汪王亡枉网往旺望忘妄威巍微危韦违桅围唯惟为潍维苇萎委伟伪尾纬未蔚味畏胃喂魏位渭谓尉慰卫瘟温蚊文闻纹吻稳紊问嗡翁瓮挝蜗涡窝我斡卧握沃巫呜钨乌污诬屋无芜梧吾吴毋武五捂午舞伍侮坞戊雾晤物勿务悟误昔熙析西硒矽晰嘻吸锡牺稀息希悉膝夕惜熄烯溪汐犀檄袭席习媳喜铣洗系隙戏细瞎虾匣霞辖暇峡侠狭下厦夏吓掀锨先仙鲜纤咸贤衔舷闲涎弦嫌显险现献县腺馅羡宪陷限线相厢镶香箱襄湘乡翔祥详想响享项巷橡像向象萧硝霄削哮嚣销消宵淆晓小孝校肖啸笑效楔些歇蝎鞋协挟携邪斜胁谐写械卸蟹懈泄泻谢屑薪芯锌欣辛新忻心信衅星腥猩惺兴刑型形邢行醒幸杏性姓兄凶胸匈汹雄熊休修羞朽嗅锈秀袖绣墟戌需虚嘘须徐许蓄酗叙旭序畜恤絮婿绪续轩喧宣悬旋玄选癣眩绚靴薛学穴雪血勋熏循旬询寻驯巡殉汛训讯逊迅压押鸦鸭呀丫芽牙蚜崖衙涯雅哑亚讶焉咽阉烟淹盐严研蜒岩延言颜阎炎沿奄掩眼衍演艳堰燕厌砚雁唁彦焰宴谚验殃央鸯秧杨扬佯疡羊洋阳氧仰痒养样漾邀腰妖瑶摇尧遥窑谣姚咬舀药要耀椰噎耶爷野冶也页掖业叶曳腋夜液一壹医揖铱依伊衣颐夷遗移仪胰疑沂宜姨彝椅蚁倚已乙矣以艺抑易邑屹亿役臆逸肄疫亦裔意毅忆义益溢诣议谊译异翼翌绎茵荫因殷音阴姻吟银淫寅饮尹引隐印英樱婴鹰应缨莹萤营荧蝇迎赢盈影颖硬映哟拥佣臃痈庸雍踊蛹咏泳涌永恿勇用幽优悠忧尤由邮铀犹油游酉有友右佑釉诱又幼迂淤于盂榆虞愚舆余俞逾鱼愉渝渔隅予娱雨与屿禹宇语羽玉域芋郁吁遇喻峪御愈欲狱育誉浴寓裕预豫驭鸳渊冤元垣袁原援辕园员圆猿源缘远苑愿怨院曰约越跃钥岳粤月悦阅耘云郧匀陨允运蕴酝晕韵孕匝砸杂栽哉灾宰载再在咱攒暂赞赃脏葬遭糟凿藻枣早澡蚤躁噪造皂灶燥责择则泽贼怎增憎曾赠扎喳渣札轧铡闸眨栅榨咋乍炸诈摘斋宅窄债寨瞻毡詹粘沾盏斩辗崭展蘸栈占战站湛绽樟章彰漳张掌涨杖丈帐账仗胀瘴障招昭找沼赵照罩兆肇召遮折哲蛰辙者锗蔗这浙珍斟真甄砧臻贞针侦枕疹诊震振镇阵蒸挣睁征狰争怔整拯正政帧症郑证芝枝支吱蜘知肢脂汁之织职直植殖执值侄址指止趾只旨纸志挚掷至致置帜峙制智秩稚质炙痔滞治窒中盅忠钟衷终种肿重仲众舟周州洲诌粥轴肘帚咒皱宙昼骤珠株蛛朱猪诸诛逐竹烛煮拄瞩嘱主著柱助蛀贮铸筑住注祝驻抓爪拽专砖转撰赚篆桩庄装妆撞壮状椎锥追赘坠缀谆准捉拙卓桌琢茁酌啄着灼浊兹咨资姿滋淄孜紫仔籽滓子自渍字鬃棕踪宗综总纵邹走奏揍租足卒族祖诅阻组钻纂嘴醉最罪尊遵昨左佐柞做作坐座"

	let confusablePinyin_Different = [

		//--------------------------- a

		"a ai",
		"ai ao",

		// - g
		"an ang",

		// join e
		"a e",
		"a er",

		//--------------------------- b

		"bai bei",
		"bo bu",

		// - g
		"ban bang",
		"ben beng",
		"bin bing",

		//--------------------------- c

		"deng dei",
		"dou diu",

		// - h
		"ca cha",
		"cu chu",
		"ci chi",
		"cen chen",
		"ceng cheng",
		"chan chang",

		// - g
		"cen ceng",
		"chen cheng",
		"chou cou",
		"chuan chuang",
		"dan dang",

		//--------------------------- e

		"er e",

		// join o
		"er o",
		"er ou",
		"e o",
		"e ou",

		//--------------------------- f

		"fo fou",
		"fo fu",

		// - g
		"fan fang",
		"fen feng",

		//--------------------------- g

		"gong gun",

		// - g
		"gan gang",
		"gen geng",
		"guan guang",

		//--------------------------- h

		"hai hei",
		"hui hun",
		"hun huo",
		"hua huai",

		// - g
		"han hang",
		"hen heng",
		"huan huang",

		// join k
		"huai kuai",

		//--------------------------- j

		"jia jie",
		"jiong jiu",
		"juan jue",
		"jiu ju",

		// - g
		"jin jing",
		"jian jiang",


		//--------------------------- k

		"ka kai",
		"kui kuo",
		"ka ke",
		"kong kou",
		"kui kuo",

		// - g
		"kan kang",
		"ken keng",
		"kuan kuang",

		//--------------------------- l

		"le lei",
		"lian liao",
		"le lie",
		"la lai",
		"lu lv",
		"lie lv",

		// - g
		"lan lang",
		"lian liang",
		"lin ling",

		// join n
		"liu niu",
		"ling ning",
		"lin ning",
		"lin nin",
		"lao nao",
		"li ni",
		"lei nei",
		"lian nian",
		"liao niao",
		"luan nuan",
		"le ne",

		//--------------------------- m

		"ma mai",
		"mei mie",
		"mao miao",
		"miu mou",
		"mo me",
		"mo mou",

		// - g
		"man mang",
		"men meng",
		"min ming",

		//--------------------------- n

		"nai nei",
		"nao niao",
		"ne nei",
		"nu nv",
		"nu nuo",

		// - g
		"nan nang",
		"nen neng",
		"nian niang",
		"nin ning",

		// join m
		"nuo mou",

		//--------------------------- o

		"o ou",

		//--------------------------- p

		"pai pang",
		"pa pai",
		"pei pie",
		"pou pu",
		"po pou",

		// - g
		"pan pang",
		"pen peng",
		"pin ping",

		// join b
		"pao bao",

		//--------------------------- q

		"qia qiang",
		"qiu que",

		// - g
		"qian qiang",
		"qin qing",

		//--------------------------- r

		"re ri",

		// - g
		"ran rang",
		"ren reng",

		// join y
		"ruan yuan",

		//--------------------------- s

		// - h
		"sa sha",
		"sai shai",
		"san shan",
		"sang shang",
		"sao shao",
		"se she",
		"sen shen",
		"seng sheng",
		"si shi",
		"sou shou",
		"su shu",
		"suan shuan",
		"sun shun",
		"suo shuo",
		"sui shui",

		// - g
		"san sang",
		"sen seng",
		"shan shang",
		"shen sheng",
		"shuan shuang",

		//--------------------------- t

		"tou tuo",
		"tie tian",

		// - g
		"tan tang",

		//--------------------------- w

		"wa wei",
		"wai wei",

		// - g
		"wan wang",
		"wen weng",

		//--------------------------- x

		"xie xue",
		"xiu xu",

		// - g
		"xian xiang",
		"xin xing",

		//--------------------------- y

		"yan yao",
		"yan ye",
		"yue yun",
		"yo you",

		// - g
		"yan yang",
		"yin ying",

		//--------------------------- z

		// - h
		"za zha",
		"zai zhai",
		"zan zhan",
		"zang zhang",
		"zao zhao",
		"ze zhe",
		"zei zhei",
		"zen zhen",
		"zeng zheng",
		"zi zhi",
		"zong zhong",
		"zou zhou",
		"zu zhu",
		"zuan zhuan",
		"zui zhui",
		"zun zhun",
		"zuo zhuo",

		// - g
		"zan zang",
		"zen zeng",
		"zhan zhang",
		"zhen zheng",
		"zhuan zhuang",

	]

	

	let confusablePinyinOfWord_Different = [

		//--------------------------- a

		"ai mei-an wei",
		"an shui-an shu",
		"an li-an qi",

		//--------------------------- b

		"ba zi-bai zhi",
		"bang zi-ban zi",
		"ben shen-bie shuo",
		"bao chang-bao cang",
		"bian chi-bian ci",
		"biao zhi-biao zi",
		"biao shi-biao shu",
		"ben zi-ben zhi",
		"bi xi-bi xing",
		"bian min-bian men",
		"biao shi-bian zhi",
		"bu chi-bu ci",
		"bu chang-bu cheng",
		"bo mu-bo wu",
		"bo di-biao di",
		"bu man-bu mian",
		"bu xiang-bu xiao",
		"bu xie-bu xiu",

		//--------------------------- c

		"can yu-cang yu",
		"chan xiao-chang xiao",
		"chan yuan-chang yuan",
		"chan shi-chang shi",
		"chan fu-chang fu",
		"chan fang-chang fang",
		"chan jia-chang jia",

		"chen yu-cheng yu",
		"chen bao-cheng bao",
		"chen ji-cheng ji",
		"chen qing-cheng qing",
		"chen shi-cheng shi",
		"chen yi-cheng yi",
		"chen fu-cheng fu",
		"chen yuan-cheng yuan",
		"chen zhi-cheng zhi",

		"chuan wei-chuang wei",
		"chuan yan-chuang yan",
		"chuan zi-chuang zi",
		"chuan yi-chuang yi",

		"cai zhi-cai shi",
		"ce shi-ce zi",
		"cha shi-chai shi",
		"chan shi-chang shi",
		"cheng xian-cheng xiang",
		"cheng shi-chen shi",
		"cheng fu-chen fu",
		"chu shen-chu sheng",
		"chu si-chu zhi",
		"ci zi-chi zi",
		"ci yu-chi yu",
		"cun shi-cu shi",

		//--------------------------- d

		"da jian-da jie",
		"da hua-da huo",
		"da ba-da bai",
		"da fu-dai fu",
		"da shi-da si",
		"da xiao-da xiang",
		"da yi-da yin",
		"da zhong-da zong",
		"di zi-di zhi",
		"dao zi-dao zhi",
		"diao zi-diao zhi",
		"ding xin-ding xing",
		"dou zi-dou zhi",
		"dun shi-duo shi",

		"dan shi-dang shi",
		"dan jia-dang jia",
		"dan gui-dang gui",
		"dan ji-dang ji",
		"dan xin-dang xin",

		//--------------------------- e

		"e zhi-er zi",

		//--------------------------- f

		"fan shi-fang shi",
		"fan xiang-fang xiang",
		"fan xin-fang xin",
		"fan shen-fang shen",
		"fan wei-fang wei",
		"fan zhi-fang zhi",
		"fan dong-fang dong",
		"fan ji-fang ji",
		"fan jian-fang jian",
		"fan fu-fang fu",
		"fan xing-fang xing",
		"fan gu-fang gu",
		"fan du-fang du",
		"fan qing-fang qing",
		"fan si-fang si",

		"fan jian-fang jia",
		"fa yan-fa yang",
		"fa zi-fa zhi",

		"fen hua-feng hua",
		"fen shi-feng shi",
		"fen xiang-feng xiang",
		"fen zi-feng zi",
		"fen bi-feng bi",
		"fen zhi-feng zhi",
		"fen li-feng li",
		"fen mi-feng mi",
		"fen qi-feng qi",
		"fen ji-feng ji",

		"feng fan-fen fang",

		"fu shen-fu sheng",
		"fu hua-fu han",
		"fu qian-fu qiang",
		"fu se-fu she",
		"fu shen-fu sheng",
		"fu ti-fu tie",
		"fu xian-fu xiang",
		"fu xin-fu xing",
		"fu zi-fu zhi",
		"fu ze-fu zheng",
		"fo dian-fu dian",

		//--------------------------- g

		"gao jie-gao ji",
		"gao yang-gao yao",
		"gao zi-gao zhi",

		"gan ji-gan jin",
		"gan jing-gang jing",
		"gan zi-gang zi",
		"gan cai-gang cai",
//		"gan dang-gang dang",
		"gan huo-gang huo",
		"gan hua-gang hua",
//		"gan yan-gang yan",
		"gan jing-gang jing",
		"gan zi-gang zi",
		"gan jing-gan jin",
		"gan lian-gan lie",
		"gan zi-gan zhi",

		"ge xin-ge xing",
		"ge zi-ge zhi",
		"ge jie-ge jue",

		"guan xian-guang xian",
//		"guan zi-guang zi",
		"guan fu-guang fu",
		"guan cai-guang cai",

		"guo zi-guo zhi",
		"guo lu-guo lv",

		"gu zi-gu zhi",
		"gu zhen-gu zheng",
		"gu fen-gu feng",
		"gu mu-gu mo",

		"gui zi-gui zhi",

		"gong che-gong cheng",
		"gong fen-gong feng",
		"gong guo-gong gu",
		"gong jin-gong jing",
		"gong shen-gong sheng",
		"gong si-gong shi",
		"gong xin-gong xing",
		"gong zi-gong zhi",

		//--------------------------- h

		"huan ji-huang ji",
		"huan yang-huang yang",
		"huan you-huang you",
		"huan yu-huang yu",
		"huan cheng-huang cheng",
		"huan yan-huang yan",

		//--------------------------- j

		"jian xi-jiang xi",
		"jian shi-jiang shi",
		"jian zhi-jiang zhi",
		"jian hua-jiang hua",
		"jian jie-jiang jie",
		"jian bei-jiang bei",
		"jian fa-jiang fa",
		"jian jin-jiang jin",
		"jian li-jiang li",
		"jian xin-jiang xin",
		"jian hao-jiang hao",
		"jian jia-jiang jia",
		"jian sheng-jiang sheng",
		"jian yu-jiang yu",
		"jian cai-jiang cai",

		"jian huo-jie huo",
		"jian ji-jie ji",
		"jian shou-jie shou",
		"jian di-jie di",
		"jian duan-jie duan",
		"jian shi-jie shi",
		"jian tou-jie tou",
		"jian li-jie li",
		"jian sheng-jie sheng",
		"jian yu-jie yu",
		"jian zhi-jie zhi",
		"jian ju-jie ju",
		"jian guo-jie guo",
		"jian jia-jie jia",
		"jian jiao-jie jiao",
		"jian jie-jie jie",
		"jian shu-jie shu",
		"jian yi-jie yi",
		"jian mian-jie mian",
		"jian jin-jie jin",
		"jian fu-jie fu",
		"jian du-jie du",
		"jian fa-jie fa",
		"jian gu-jie gu",
		"jian ke-jie ke",
		"jian yue-jie yue",
		"jian xin-jie xin",
		"jian yan-jie yan",
		"jian cai-jie cai",
		"jian bei-jie bei",
		"jian xian-jie xian",
		"jian zhu-jie zhu",

		"jin du-jing du",
		"jin ji-jing ji",
		"jin li-jing li",
		"jin ju-jing ju",
		"jin qi-jing qi",
		"jin xian-jing xian",
		"jin yan-jing yan",
		"jin yi-jing yi",
		"jin shi-jing shi",
		"jin dao-jing dao",
		"jin liang-jing liang",
		"jin shen-jing shen",
		"jin zhi-jing zhi",
		"jin yu-jing yu",
		"jin sheng-jing sheng",
		"jin xiang-jing xiang",
		"jin di-jing di",
		"jin fang-jing fang",
		"jin zhong-jing zhong",
		"jin zi-jing zi",
		"jin xiao-jing xiao",
		"jin ran-jing ran",
		"jin ye-jing ye",
		"jin tou-jing tou",

		"jiu yi-jue yi",
		"jiu di-jue di",
		"jiu ji-jue ji",
		"jiu jing-jue jing",
		"jiu shi-jue shi",

		//--------------------------- k

		"kuan chang-kuang chang",

		//--------------------------- l

		"lian yi-liang yi",
		"lian ji-liang ji",
		"lian mian-liang mian",
		"lian xiang-liang xiang",

		"lian xi-lie xi",

		"lin li-ling li",
		"lin zi-ling zi",
		"lin xing-ling xing",
		"lin yu-ling yu",

		//--------------------------- m

		"mo zi-mu zi",
		"mo ji-mu ji",
		"mo li-mu li",
		"mo yu-mu yu",
		"mo di-mu di",
		"mo shi-mu shi",
		"mo zhi-mu zhi",
		"mo qi-mu qi",

		//--------------------------- p

		"pin fu-ping fu",
		"pin wei-ping wei",

		//--------------------------- q

		"qian bi-qiang bi",
		"qian jian-qiang jian",
		"qian ren-qiang ren",
		"qian shou-qiang shou",
		"qian zhan-qiang zhan",
		"qian zhi-qiang zhi",
		"qian gong-qiang gong",
		"qian xian-qiang xian",
		"qian yan-qiang yan",

		"qin sheng-qing sheng",
		"qin shi-qing shi",
		"qin xian-qing xian",
		"qin zheng-qing zheng",
		"qin jian-qing jian",
		"qin jin-qing jin",

		//--------------------------- r

		"rong he-rou he",

		//--------------------------- s

		"shan ji-shang ji",
		"shan jian-shang jian",
		"shan shi-shang shi",
		"shan feng-shang feng",
		"shan huo-shang huo",
		"shan liang-shang liang",
		"shan lu-shang lu",
		"shan shen-shang shen",
		"shan xian-shang xian",
		"shan xiang-shang xiang",
		"shan xing-shang xing",

		"shen cai-sheng cai",
		"shen li-sheng li",
		"shen qi-sheng qi",
		"shen se-sheng se",
		"shen shi-sheng shi",
		"shen si-sheng si",
		"shen xiao-sheng xiao",
		"shen yi-sheng yi",
		"shen yu-sheng yu",
		"shen zhi-sheng zhi",
		"shen bian-sheng bian",
		"shen ming-sheng ming",
		"shen wei-sheng wei",
		"shen yuan-sheng yuan",
		"shen chu-sheng chu",
		"shen su-sheng su",
		"shen zi-sheng zi",
		"shen ling-sheng ling",
		"shen shou-sheng shou",
		"shen xing-sheng xing",
		"shen yan-sheng yan",

		"si jian-shi jian",
		"si li-shi li",
		"si shi-shi shi",
		"si shou-shi shou",
		"si yi-shi yi",
		"si di-shi di",
		"si zi-shi zi",
		"si hua-shi hua",
		"si ji-shi ji",
		"si jiao-shi jiao",
		"si xing-shi xing",
		"si yu-shi yu",
		"si zhi-shi zhi",
		"si jin-shi jin",
		"si fang-shi fang",
		"si hui-shi hui",
		"si mian-shi mian",
		"si qi-shi qi",
		"si ying-shi ying",
		"si ren-shi ren",
		"si shang-shi shang",
		"si xian-shi xian",
		"si xin-shi xin",
		"si huo-shi huo",
		"si xiang-shi xiang",
		"si ming-shi ming",
		"si shu-shi shu",
		"si liao-shi liao",
		"si fa-shi fa",
		"si gu-shi gu",
		"si qing-shi qing",
		"si wei-shi wei",
		"si dang-shi dang",

		"shu yuan-su yuan",
		"shu cai-su cai",
		"shu jing-su jing",
		"shu zhuang-su zhuang",
		"shu hua-su hua",
		"shu di-su di",
		"shu ji-su ji",
		"shu ming-su ming",

		"shui yuan-sui yuan",
		"shui shou-sui shou",
		"shui yi-sui yi",

		//--------------------------- t

		"tan zhi-tang zhi",
		"tan shang-tang shang",

		"tian qi-tie qi",
		"tian xian-tie xian",

		"tou xian-tu xian",
		"tou ding-tu ding",
		"tou ji-tu ji",
		"tou shi-tu shi",
		"tou jing-tu jing",
		"tou lu-tu lu",
		"tou di-tu di",
		"tou zhi-tu zhi",
		"tou zi-tu zi",

		//--------------------------- w

		"wan shi-wang shi",
		"wan zi-wang zi",
		"wan nian-wang nian",
		"wan yan-wang yan",
		"wan ji-wang ji",
		"wan sheng-wang sheng",

		"wai yi-wei yi",
		"wai li-wei li",
		"wai xing-wei xing",
		"wai shi-wei shi",
		"wai wu-wei wu",
		"wai qi-wei qi",
		"wai xie-wei xie",
		"wai bu-wei bu",
		"wai jing-wei jing",
		"wai yu-wei yu",
		"wai dao-wei dao",

		"wo ju-wu ju",

		//--------------------------- x

		"xian cheng-xiang cheng",
		"xian fan-xiang fan",
		"xian ji-xiang ji",
		"xian jian-xiang jian",
		"xian ju-xiang ju",
		"xian ren-xiang ren",
		"xian shi-xiang shi",
		"xian shu-xiang shu",
		"xian xiang-xiang xiang",
		"xian yi-xiang yi",
		"xian yu-xiang yu",
		"xian zhi-xiang zhi",
		"xian chang-xiang chang",
		"xian gu-xiang gu",
		"xian hui-xiang hui",
		"xian wei-xiang wei",
		"xian yan-xiang yan",
		"xian you-xiang you",
		"xian fang-xiang fang",
		"xian cai-xiang cai",
		"xian di-xiang di",
		"xian li-xiang li",
		"xian jin-xiang jin",
		"xian bei-xiang bei",
		"xian jie-xiang jie",
		"xian ming-xiang ming",
		"xian qing-xiang qing",
		"xian tan-xiang tan",
		"xian he-xiang he",
		"xian qi-xiang qi",
		"xian sheng-xiang sheng",
		"xian tou-xiang tou",
		"xian zi-xiang zi",
		"xian hua-xiang hua",

		"xin shi-xing shi",
		"xin ji-xing ji",
		"xin qi-xing qi",
		"xin xiang-xing xiang",
		"xin xing-xing xing",
		"xin jing-xing jing",
		"xin li-xing li",
		"xin lv-xing lv",
		"xin shu-xing shu",
		"xin zhi-xing zhi",
		"xin sheng-xing sheng",
		"xin mu-xing mu",
		"xin ren-xing ren",
		"xin zi-xing zi",
		"xin xi-xing xi",
		"xin bing-xing bing",
		"xin ling-xing ling",
		"xin zheng-xing zheng",

		"xu shi-xiu shi",
		"xu shu-xiu shu",
		"xu xian-xiu xian",
		"xu yang-xiu yang",
		"xu zhi-xiu zhi",
		"xu yu-xiu yu",

		"xie li-xue li",
		"xie shi-xue shi",
		"xie zhi-xue zhi",
		"xie zi-xue zi",
		"xie xian-xue xian",
		"xie qi-xue qi",
		"xie tong-xue tong",
		"xie yi-xue yi",

		//--------------------------- y

		"yan qi-yang qi",
		"yan gao-yang gao",
		"yan ji-yang ji",
		"yan shou-yang shou",
		"yan yan-yang yan",
		"yan chang-yang chang",
		"yan hua-yang hua",
		"yan huo-yang huo",
		"yan shi-yang shi",
		"yan wen-yang wen",
		"yan zhuang-yang zhuang",
		"yan bo-yang bo",
		"yan guang-yang guang",
		"yan mian-yang mian",
		"yan mu-yang mu",
		"yan fu-yang fu",
		"yan xing-yang xing",
		"yan yu-yang yu",
		"yan zi-yang zi",
		"yan yang-yang yang",
		"yan shu-yang shu",

		"ya zhi-ye zhi",
		"ya yu-ye yu",
		"ya zi-ye zi",
		"ya yan-ye yan",
		"ya jing-ye jing",

		"ye ban-yi ban",
		"ye ji-yi ji",
		"ye jing-yi jing",
		"ye shi-yi shi",
		"ye zhi-yi zhi",
		"ye wu-yi wu",
		"ye yan-yi yan",
		"ye zhu-yi zhu",
		"ye mian-yi mian",
		"ye zi-yi zi",
		"ye xing-yi xing",
		"ye yu-yi yu",
		"ye ma-yi ma",
		"ye qu-yi qu",
		"ye jian-yi jian",

		"yin ji-ying ji",
		"yin jie-ying jie",
		"yin shi-ying shi",
		"yin yun-ying yun",
		"yin li-ying li",
		"yin yong-ying yong",
		"yin zi-ying zi",
		"yin su-ying su",
		"yin yu-ying yu",
		"yin yang-ying yang",
		"yin ping-ying ping",
		"yin xiang-ying xiang",
		"yin bi-ying bi",
		"yin gong-ying gong",
		"yin hua-ying hua",
		"yin jian-ying jian",
		"yin qi-ying qi",
		"yin xing-ying xing",
		"yin zhang-ying zhang",

		"you hui-yu hui",
		"you ji-yu ji",
		"you jin-yu jin",
		"you li-yu li",
		"you sheng-yu sheng",
		"you wei-yu wei",
		"you lun-yu lun",
		"you qu-yu qu",
		"you chang-yu chang",
		"you ren-yu ren",
		"you zhong-yu zhong",
		"you qi-yu qi",
		"you hua-yu hua",
		"you yi-yu yi",
		"you ju-yu ju",
		"you liang-yu liang",
		"you lin-yu lin",
		"you lu-yu lu",
		"you qing-yu qing",
		"you shi-yu shi",
		"you shui-yu shui",
		"you jing-yu jing",
		"you yin-yu yin",
		"you dai-yu dai",
		"you er-yu er",
		"you fen-yu fen",
		"you yu-yu yu",
		"you bu-yu bu",
		"you gou-yu gou",
		"you jian-yu jian",
		"you shou-yu shou",
		"you xi-yu xi",
		"you xing-yu xing",
		"you zhi-yu zhi",
		"you nian-yu nian",
		"you di-yu di",
		"you wu-yu wu",
		"you yuan-yu yuan",
		"you xian-yu xian",


		//--------------------------- z

		"za ji-zha ji",
		"za shi-zha shi",

		"zhan shi-zhang shi",
		"zhan fang-zhang fang",
		"zhan li-zhang li",

		"zao shi-zhao shi",
		"zao qi-zhao qi",
		"zao shu-zhao shu",

		"zhen fa-zheng fa",
		"zhen xiang-zheng xiang",
		"zhen yan-zheng yan",
		"zhen jiao-zheng jiao",
		"zhen di-zheng di",
		"zhen ji-zheng ji",
		"zhen yi-zheng yi",
		"zhen zhi-zheng zhi",
		"zhen ban-zheng ban",
		"zhen dang-zheng dang",
		"zhen jing-zheng jing",
		"zhen pin-zheng pin",
		"zhen shi-zheng shi",
		"zhen zhong-zheng zhong",
		"zhen jie-zheng jie",

		"zhi li-zi li",
		"zhi zhu-zi zhu",
		"zhi sheng-zi sheng",
		"zhi shi-zi shi",
		"zhi di-zi di",
		"zhi fang-zi fang",
		"zhi ji-zi ji",
		"zhi xi-zi xi",
		"zhi zhi-zi zhi",
		"zhi wei-zi wei",
		"zhi mian-zi mian",
		"zhi yin-zi yin",
		"zhi bao-zi bao",
		"zhi bei-zi bei",
		"zhi bian-zi bian",
		"zhi cheng-zi cheng",
		"zhi da-zi da",
		"zhi fu-zi fu",
		"zhi hao-zi hao",
		"zhi hui-zi hui",
		"zhi jian-zi jian",
		"zhi jin-zi jin",
		"zhi jing-zi jing",
		"zhi jue-zi jue",
		"zhi liu-zi liu",
		"zhi shen-zi shen",
		"zhi shu-zi shu",
		"zhi si-zi si",
		"zhi wen-zi wen",
		"zhi xiao-zi xiao",
		"zhi xin-zi xin",
		"zhi xing-zi xing",
		"zhi yi-zi yi",
		"zhi you-zi you",
		"zhi yu-zi yu",
		"zhi yuan-zi yuan",
		"zhi zhong-zi zhong",
		"zhi bi-zhi bu",

		"zhuan jia-zhuang jia",
		"zhuan yuan-zhuang yuan",
		"zhuan zi-zhuang zi",
		"zhuan shi-zhuang shi",
		"zhuan xiang-zhuang xiang",
		"zhuan zhi-zhuang zhi",
		"zhuan che-zhuang che",
		"zhuan ji-zhuang ji",

		"zhong shi-zong shi",
		"zhong shu-zong shu",
		"zhong he-zong he",
		"zhong ji-zong ji",
		"zhong zhi-zong zhi",
		"zhong shen-zong shen",

		"zhu jie-zu jie",
		"zhu zi-zu zi",
		"zhu ji-zu ji",
		"zhu zhi-zu zhi",
		"zhu ge-zu ge",
		"zhu jian-zu jian",
		"zhu shi-zu shi",
		"zhu ye-zu ye",

		"zuo jian-zhuo jian",
		"zuo shi-zhuo shi",
		"zuo yi-zhuo yi",
		"zuo zi-zhuo zi",

	]

	func randomPinyin() -> String {
		let randomNumber = getRandomNumbers(1, lessThan: allPossiblePinyin.count)
		return allPossiblePinyin[randomNumber[0]]
	}

	func randomPinyinOfWord() -> String {
		let AOrB = arc4random_uniform(10)
		let amount = AOrB == 2 ? 3 : 2
		let randomNumubers = getRandomNumbers(amount, lessThan: allPossiblePinyin.count)

		var pinyin = String()
		for i in randomNumubers {
			if pinyin.characters.count == 0 {
				pinyin += allPossiblePinyin[i]
			} else {
				pinyin += " " + allPossiblePinyin[i]
			}

		}

		return pinyin
	}

	func charactersFromPinyin(pinyin: String) -> [String] {
		var results = [String]()

		for i in oftenUsedCharacters.characters {
			let value = String(i) as NSString
			if let all = value.toPinyinArray() as? [String] {
				if let _ = all.indexOf(pinyin) {
					results.append(value as String)
				}
			}
		}

		return results
	}

	func printAllCharctersHaveSamePinyin(wordsCount: Int) {
		var results = [String]()
		for pinyin in allPossiblePinyin {
			let words = charactersFromPinyin(pinyin)
			if words.count >= wordsCount {
				results.append(pinyin)
			}
		}
		print(results)
		print(results.count)
	}

	func wordsFromPinyin(pinyin: String) -> [String] {
		var words = [String]()

		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		let managedContext = appDelegate.managedObjectContext
		
		let fetchRequest = NSFetchRequest(entityName: "Term")
		fetchRequest.predicate = NSPredicate(format:"pinyin == %@", pinyin + " ")
		
		do {
			let fetchedResults = try managedContext.executeFetchRequest(fetchRequest)
		
			if let results = fetchedResults as? [Term] {
				for i in results {
					words.append(i.word!)
 				}
			}
		
		} catch let error as NSError {
			print("Counld not fetch \(error), \(error.userInfo)")
		}

		return words
	}

	func pinyinFromIndex(index: Double) -> String {
		var pinyin = ""

		let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
		let managedContext = appDelegate.managedObjectContext

		let fetchRequest = NSFetchRequest(entityName: "Term")
		fetchRequest.predicate = NSPredicate(format:"index == %f", index)

		do {
			let fetchedResults = try managedContext.executeFetchRequest(fetchRequest)

			if let results = fetchedResults as? [Term] {
				if results[0].pinyin != nil {
					pinyin = String(results[0].pinyin!.characters.dropLast())
				}
			}

		} catch let error as NSError {
			print("Counld not fetch \(error), \(error.userInfo)")
		}

		return pinyin
	}

	
	//MARK: - Test

	func confusablePinyin_Different_Test() {
		for couple in confusablePinyin_Different {
			let pinyins = couple.componentsSeparatedByString(" ")

			let words_0 = charactersFromPinyin(pinyins[0])
			if words_0.count == 0 { print(pinyins[0]) }

			let words_1 = charactersFromPinyin(pinyins[1])
			if words_1.count == 0 { print(pinyins[1]) }

			if pinyins.count != 2 { print(pinyins) }
		}
	}

	func confusablePinyinOfWord_Different_Test() {
		for couple in confusablePinyinOfWord_Different {
			let wordPinyins = couple.componentsSeparatedByString("-")

			let words_0 = wordsFromPinyin(wordPinyins[0])
			if words_0.count == 0 { print(wordPinyins[0]) }

			let words_1 = wordsFromPinyin(wordPinyins[1])
			if words_1.count == 0 { print(wordPinyins[1]) }

			if wordPinyins.count != 2 { print(wordPinyins) }
		}
	}



}











