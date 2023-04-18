import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import confusion_matrix
import sys




data = [
    [[0.50765968, 0.41256025], [0.]],
    [[0.36375546, 0.59075795], [0.]],
    [[0.21520413, 0.55271445], [0.]],
    [[0.4693966,  0.39995106], [0.]],
    [[0.53644675, 0.4053528 ], [0.]],
    [[0.58549226, 0.42186708], [0.]],
    [[0.70621604, 0.39305597], [0.]],
    [[0.46593932, 0.39251781], [0.]],
    [[0.40697289, 0.49520788], [0.]],
    [[0.33684143, 0.60731641], [0.]],
    [[0.26116088, 0.49483643], [0.]],
    [[0.30926478, 0.60663474], [0.]],
    [[0.49190035, 0.30409472], [0.]],
    [[0.33072347, 0.43041537], [0.]],
    [[0.60703132, 0.31033602], [0.]],
    [[0.53952089, 0.49197597], [0.]],
    [[0.31103954, 0.45624713], [0.]],
    [[0.5530532,  0.47187137], [0.]],
    [[0.824336,   0.22178645], [0.]],
    [[0.34675448, 0.49929277], [0.]],
    [[0.52077469, 0.43354088], [0.]],
    [[0.420083,   0.44804957], [0.]],
    [[0.55463451, 0.34522629], [0.]],
    [[0.32846912, 0.58563206], [0.]],
    [[0.53067486, 0.33602644], [0.]],
    [[0.42083814, 0.46965952], [0.]],
    [[0.37624684, 0.57896866], [0.]],
    [[0.42179587, 0.43327408], [0.]],
    [[0.34028113, 0.46543392], [0.]],
    [[0.7877178,  0.35661709], [0.]],
    [[0.32697271, 0.44686558], [0.]],
    [[0.39931499, 0.45255867], [0.]],
    [[0.23809435, 0.53973605], [0.]],
    [[0.47146416, 0.4715756 ], [0.]],
    [[0.50417605, 0.42980532], [0.]],
    [[0.38516377, 0.44347771], [0.]],
    [[0.63881354, 0.51678664], [0.]],
    [[0.31557198, 0.45751296], [0.]],
    [[0.63773579, 0.41766269], [0.]],
    [[0.52642272, 0.37317223], [0.]],
    [[0.30634994, 0.41963213], [0.]],
    [[0.6302983,  0.41560854], [0.]],
    [[0.44845321, 0.37844926], [0.]],
    [[0.62114803, 0.42631305], [0.]],
    [[0.27632469, 0.45605115], [0.]],
    [[0.64899726, 0.33772008], [0.]],
    [[0.30615506, 0.45764814], [0.]],
    [[0.37944832, 0.5615219 ], [0.]],
    [[0.55602121, 0.47644886], [0.]],
    [[0.212076,   0.49695581], [0.]],
    [[0.54928622, 0.46080959], [0.]],
    [[0.26260244, 0.51900922], [0.]],
    [[0.24536143, 0.4869894 ], [0.]],
    [[0.37892687, 0.42320459], [0.]],
    [[0.67338697, 0.37510524], [0.]],
    [[0.67274514, 0.31839372], [0.]],
    [[0.33052054, 0.48112603], [0.]],
    [[0.44529304, 0.42233988], [0.]],
    [[0.20659204, 0.44316643], [0.]],
    [[0.29060741, 0.46162937], [0.]],
    [[0.56383891, 0.4788597 ], [0.]],
    [[0.68371645, 0.40353743], [0.]],
    [[0,          0.64490431], [0.]],
    [[0.24669091, 0.5141285 ], [0.]],
    [[0.37453437, 0.40408379], [0.]],
    [[0.4094534,  0.43976277], [0.]],
    [[0.34658657, 0.45314729], [0.]],
    [[0.38394428, 0.48081346], [0.]],
    [[0.5049281,  0.36505911], [0.]],
    [[0.62179641, 0.42066977], [0.]],
    [[0.27119702, 0.48431573], [0.]],
    [[0.36526382, 0.52209811], [0.]],
    [[0.54707382, 0.31884913], [0.]],
    [[0.61628466, 0.39640811], [0.]],
    [[0.33340914, 0.56882409], [0.]],
    [[0.17667977, 0.49814433], [0.]],
    [[0.25255277, 0.39313591], [0.]],
    [[0.79309019, 0.45036727], [0.]],
    [[0.25250461, 0.46883517], [0.]],
    [[0.46879243, 0.56362016], [0.]],
    [[0.59881855, 0.53679019], [0.]],
    [[0.51306,    0.38640905], [0.]],
    [[0.29639393, 0.43330327], [0.]],
    [[0.56751208, 0.46124039], [0.]],
    [[0.37507951, 0.432635  ], [0.]],
    [[0.36104407, 0.50602277], [0.]],
    [[0.29573198, 0.50818521], [0.]],
    [[0.5621431,  0.34782447], [0.]],
    [[0.66903397, 0.40608025], [0.]],
    [[0.35076055, 0.58344335], [0.]],
    [[0.42856278, 0.38319442], [0.]],
    [[0.35843008, 0.40811588], [0.]],
    [[0.23749956, 0.50880674], [0.]],
    [[0.48572991, 0.48958941], [0.]],
    [[0.47103262, 0.457648  ], [0.]],
    [[0.59025927, 0.39511265], [0.]],
    [[0.3194833,  0.43510073], [0.]],
    [[0.26769525, 0.4674167 ], [0.]],
    [[0.64295711, 0.4743121 ], [0.]],
    [[0.52946405, 0.48411934], [0.]],
    [[0.44026767, 0.41407646], [0.]],
    [[0.64432756, 0.42874231], [0.]],
    [[0.26199564, 0.46903704], [0.]],
    [[0.52757846, 0.39909742], [0.]],
    [[0.51370067, 0.26614758], [0.]],
    [[0.46270052, 0.4660647 ], [0.]],
    [[0.35055516, 0.48054142], [0.]],
    [[0.48564157, 0.47773439], [0.]],
    [[0.4294376,  0.43989991], [0.]],
    [[0.59526043, 0.44815405], [0.]],
    [[0.50844266, 0.46259249], [0.]],
    [[0.44108946, 0.5718446 ], [0.]],
    [[0.56847539, 0.5058525 ], [0.]],
    [[0.33721422, 0.43390995], [0.]],
    [[0.51824962, 0.45948402], [0.]],
    [[0.46408873, 0.50254772], [0.]],
    [[0.33236222, 0.60006268], [0.]],
    [[0.6698176,  0.40763973], [0.]],
    [[0.06210441, 0.51639151], [0.]],
    [[0.59525508, 0.54015772], [0.]],
    [[0.51954267, 0.4200454 ], [0.]],
    [[0.43851182, 0.39113407], [0.]],
    [[0.37089429, 0.54438756], [0.]],
    [[0.5899722,  0.43868971], [0.]],
    [[0.45786882, 0.50762679], [0.]],
    [[0.72526096, 0.75202033], [1.]],
    [[0.86153642, 0.64543551], [1.]],
    [[0.69945961, 0.70895352], [1.]],
    [[0.80773609, 0.72158701], [1.]],
    [[0.79722189, 0.65085752], [1.]],
    [[0.81823806, 0.59934756], [1.]],
    [[0.63648961, 0.73540245], [1.]],
    [[0.72345195, 0.60562642], [1.]],
    [[0.47857766, 0.75538137], [1.]],
    [[0.79619406, 0.64036888], [1.]],
    [[0.68928397, 0.61787978], [1.]],
    [[0.66652985, 0.72634377], [1.]],
    [[0.75306318, 0.82210712], [1.]],
    [[0.53553372, 0.79080239], [1.]],
    [[0.9307942,  0.72358323], [1.]],
    [[0.50428512, 0.78522802], [1.]],
    [[0.41282428, 0.84478177], [1.]],
    [[0.75715567, 0.65171754], [1.]],
    [[0.46921128, 0.72742715], [1.]],
    [[0.93857263, 0.61755338], [1.]],
    [[0.7707671,  0.74415496], [1.]],
    [[0.67901967, 0.70195299], [1.]],
    [[0.71139605, 0.75609353], [1.]],
    [[0.68492229, 0.70653998], [1.]],
    [[0.6359432,  0.64231111], [1.]],
    [[0.58153772, 0.73813017], [1.]],
    [[0.68425848, 0.76041083], [1.]],
    [[0.90177901, 0.7023698 ], [1.]],
    [[0.64203025, 0.70012986], [1.]],
    [[0.55226397, 0.72575841], [1.]],
    [[0.47963781, 0.70916422], [1.]],
    [[0.72184769, 0.60446886], [1.]],
    [[0.72044041, 0.71169147], [1.]],
    [[0.64951348, 0.70856335], [1.]],
    [[0.61719811, 0.72597407], [1.]],
    [[0.64683639, 0.62530915], [1.]],
    [[0.94293974, 0.5906124 ], [1.]],
    [[0.68153813, 0.76051395], [1.]],
    [[0.8374477,  0.73912208], [1.]],
    [[0.82666545, 0.62298958], [1.]],
    [[0.75554011, 0.66740162], [1.]],
    [[0.87512843, 0.65583797], [1.]],
    [[0.71489348, 0.64842836], [1.]],
    [[0.77569807, 0.67975479], [1.]],
    [[0.87503903, 0.69701005], [1.]],
    [[0.80348788, 0.61606482], [1.]],
    [[0.72740304, 0.67302894], [1.]],
    [[0.69724406, 0.69944352], [1.]],
    [[0.66222057, 0.70301633], [1.]],
    [[0.3054429,  0.9702251], [1.]],
    [[0.53676808, 0.70127586], [1.]],
    [[0.75489096, 0.63696924], [1.]],
    [[1,          0.65472637], [1.]],
    [[0.77005642, 0.63816088], [1.]],
    [[0.62751782, 0.65539494], [1.]],
    [[0.77383147, 0.72899653], [1.]],
    [[0.843549,   0.65154021], [1.]],
    [[0.89918729, 0.7051291 ], [1.]],
    [[0.72636426, 0.75176854], [1.]],
    [[0.58915974, 0.59484563], [1.]],
    [[0.39282309, 0.78045978], [1.]],
    [[0.57557703, 0.7690277 ], [1.]],
    [[0.78959158, 0.71239694], [1.]],
    [[0.65706108, 0.63756143], [1.]],
    [[0.45043117, 0.82746497], [1.]],
    [[0.42521327, 0.76889252], [1.]],
    [[0.68366481, 0.61736565], [1.]],
    [[0.51046611, 0.75023636], [1.]],
    [[0.74489894, 0.72832649], [1.]],
    [[0.80734601, 0.63114541], [1.]],
    [[0.91317697, 0.68363176], [1.]],
    [[0.54327388, 0.71253728], [1.]],
    [[0.93251512, 0.65662798], [1.]],
    [[0.57174527, 0.65369352], [1.]],
    [[0.9050506,  0.48396416], [1.]],
    [[0.62682819, 0.651523  ], [1.]],
    [[0.8093991,  0.58698693], [1.]],
    [[0.5858697,  0.70647158], [1.]],
    [[0.37595145, 0.83780532], [1.]],
    [[0.62987146, 0.81927089], [1.]],
    [[0.88809018, 0.5882132 ], [1.]],
    [[0.70942471, 0.6102147 ], [1.]],
    [[0.79413104, 0.74298821], [1.]],
    [[0.84229784, 0.66520366], [1.]],
    [[0.98267323, 0.63453664], [1.]],
    [[0.67651726, 0.68265742], [1.]],
    [[0.59715236, 0.6400919 ], [1.]],
    [[0.90388839, 0.64256551], [1.]],
    [[0.77186265, 0.66680328], [1.]],
    [[0.50123111, 0.79775796], [1.]],
    [[0.73411229, 0.63419779], [1.]],
    [[0.59075786, 0.77656299], [1.]],
    [[0.44974559, 0.6918711 ], [1.]],
    [[0.58905804, 0.71282453], [1.]],
    [[0.4304515,  0.76108603], [1.]],
    [[0.85472277, 0.79301677], [1.]],
    [[0.59195124, 0.67341784], [1.]],
    [[0.62904076, 0.68478371], [1.]],
    [[0.53193647, 0.73798695], [1.]],
    [[0.68753542, 0.68901558], [1.]],
    [[0.74664327, 0.63948915], [1.]],
    [[0.77525053, 0.58937394], [1.]],
    [[0.69760742, 0.75866349], [1.]],
    [[0.61066072, 0.80402349], [1.]],
    [[0.56622403, 0.67278337], [1.]],
    [[0.70982151, 0.62828401], [1.]],
    [[0.55433252, 0.82533814], [1.]],
    [[0.66467684, 0.63178029], [1.]],
    [[0.69236653, 0.68681372], [1.]],
    [[0.83832025, 0.68997203], [1.]],
    [[0.8140882,  0.64369366], [1.]],
    [[0.7661511,  0.55197863], [1.]],
    [[0.65655533, 0.69687283], [1.]],
    [[0.77351182, 0.8076138 ], [1.]],
    [[0.79165321, 0.7740026 ], [1.]],
    [[0.72423192, 0.73188617], [1.]],
    [[0.69946432, 0.68619542], [1.]],
    [[0.6837825,  0.71006189], [1.]],
    [[0.740834,   0.71978202], [1.]],
    [[0.64640868, 0.62856419], [1.]],
    [[0.3084785,  0.85582567], [1.]],
    [[0.63162842, 0.77940365], [1.]],
    [[0.73331996, 0.66901869], [1.]],
    [[0.72440169, 0.69695627], [1.]],
    [[0.36738028, 0.84244844], [1.]]
]

data_perceptron = [
    [[0.42114591, 0.34839609], [0.]],
    [[0.40240308, 0.32516662], [0.]],
    [[0.37179838, 0.40781923], [0.]],
    [[0.54029354, 0.45283229], [0.]],
    [[0.47091538, 0.33238456], [0.]],
    [[0.41980934, 0.412548  ], [0.]],
    [[0.04960726, 0.6229629 ], [0.]],
    [[0.39662563, 0.36501285], [0.]],
    [[0.64110739, 0.39674834], [0.]],
    [[0.54374056, 0.45044508], [0.]],
    [[0.67170922, 0.33434098], [0.]],
    [[0.6053772 , 0.37024758], [0.]],
    [[0.6243064 , 0.26259128], [0.]],
    [[0.2268799 , 0.44419058], [0.]],
    [[0.1562884 , 0.49233052], [0.]],
    [[0.51253808, 0.30214431], [0.]],
    [[0.54739366, 0.34000405], [0.]],
    [[0.38136863, 0.35853565], [0.]],
    [[0.41889569, 0.43769952], [0.]],
    [[0.48893833, 0.31788877], [0.]],
    [[0.42773656, 0.37592381], [0.]],
    [[0.47678977, 0.3828072 ], [0.]],
    [[0.18881071, 0.52715693], [0.]],
    [[0.49427288, 0.44719391], [0.]],
    [[0.40582003, 0.48850924], [0.]],
    [[0.43065162, 0.4190034 ], [0.]],
    [[0.43642363, 0.39388075], [0.]],
    [[0.35368791, 0.35676283], [0.]],
    [[0.63072129, 0.33050497], [0.]],
    [[0.42029593, 0.36787282], [0.]],
    [[0.37428875, 0.46931825], [0.]],
    [[0.46999931, 0.2897575 ], [0.]],
    [[0.        , 0.56674317], [0.]],
    [[0.40485823, 0.36486554], [0.]],
    [[0.83737082, 0.31176377], [0.]],
    [[0.18867756, 0.56433394], [0.]],
    [[0.24272035, 0.60892338], [0.]],
    [[0.5312476 , 0.42409123], [0.]],
    [[0.37078544, 0.47117329], [0.]],
    [[0.69489228, 0.23816855], [0.]],
    [[0.49120849, 0.42580412], [0.]],
    [[0.56897979, 0.37421481], [0.]],
    [[0.29420087, 0.36338539], [0.]],
    [[0.2252581 , 0.41240369], [0.]],
    [[0.53291002, 0.34042899], [0.]],
    [[0.40513367, 0.40495471], [0.]],
    [[0.4441499 , 0.40698584], [0.]],
    [[0.10917123, 0.47006187], [0.]],
    [[0.35183858, 0.42139893], [0.]],
    [[0.66433681, 0.39222179], [0.]],
    [[0.6904177 , 0.20279612], [0.]],
    [[0.35341358, 0.42685694], [0.]],
    [[0.38327492, 0.48973498], [0.]],
    [[0.55637378, 0.31075528], [0.]],
    [[0.32975384, 0.41717225], [0.]],
    [[0.58990883, 0.25355827], [0.]],
    [[0.21065013, 0.43858628], [0.]],
    [[0.44051576, 0.28891622], [0.]],
    [[0.14878882, 0.57588995], [0.]],
    [[0.62175437, 0.3938375 ], [0.]],
    [[0.55240772, 0.37086821], [0.]],
    [[0.30945867, 0.47167967], [0.]],
    [[0.19886999, 0.44912045], [0.]],
    [[0.47883137, 0.33087972], [0.]],
    [[0.30211955, 0.40863502], [0.]],
    [[0.22684201, 0.43966232], [0.]],
    [[0.53137101, 0.3748333 ], [0.]],
    [[0.26164172, 0.48878538], [0.]],
    [[0.25020081, 0.42240589], [0.]],
    [[0.58291083, 0.3669959 ], [0.]],
    [[0.48468791, 0.41535781], [0.]],
    [[0.41256377, 0.42263761], [0.]],
    [[0.45467756, 0.42950702], [0.]],
    [[0.40602838, 0.39571616], [0.]],
    [[0.79984632, 0.18998917], [0.]],
    [[0.25459446, 0.3910183 ], [0.]],
    [[0.43090328, 0.36639797], [0.]],
    [[0.57806891, 0.36294057], [0.]],
    [[0.36558891, 0.43068512], [0.]],
    [[0.69551623, 0.37913769], [0.]],
    [[0.3903422 , 0.42626884], [0.]],
    [[0.37196064, 0.35950026], [0.]],
    [[0.3168526 , 0.46003235], [0.]],
    [[0.59581487, 0.42211841], [0.]],
    [[0.30780603, 0.45848567], [0.]],
    [[0.41129924, 0.38042143], [0.]],
    [[0.17960989, 0.46748709], [0.]],
    [[0.51216073, 0.32101687], [0.]],
    [[0.63663498, 0.29122778], [0.]],
    [[0.60189471, 0.32893791], [0.]],
    [[0.4028842 , 0.36044893], [0.]],
    [[0.41341324, 0.39703748], [0.]],
    [[0.37631856, 0.35338244], [0.]],
    [[0.31737089, 0.43944154], [0.]],
    [[0.36428418, 0.41563461], [0.]],
    [[0.55633775, 0.40052277], [0.]],
    [[0.49207367, 0.35242097], [0.]],
    [[0.5284604 , 0.49815484], [0.]],
    [[0.23201713, 0.46489385], [0.]],
    [[0.35175227, 0.39739285], [0.]],
    [[0.22432915, 0.42811462], [0.]],
    [[0.62006698, 0.39940616], [0.]],
    [[0.26374315, 0.3509385 ], [0.]],
    [[0.70740757, 0.28014362], [0.]],
    [[0.4345068 , 0.38831873], [0.]],
    [[0.14943998, 0.52605444], [0.]],
    [[0.39870818, 0.39043709], [0.]],
    [[0.35454198, 0.44316015], [0.]],
    [[0.33715763, 0.40499064], [0.]],
    [[0.36795982, 0.48771956], [0.]],
    [[0.61464664, 0.29173799], [0.]],
    [[0.38820648, 0.50582977], [0.]],
    [[0.49161039, 0.32997848], [0.]],
    [[0.34103454, 0.53166366], [0.]],
    [[0.344514  , 0.4455905 ], [0.]],
    [[0.52780315, 0.31947899], [0.]],
    [[0.55874549, 0.29348661], [0.]],
    [[0.29743708, 0.50016142], [0.]],
    [[0.31660207, 0.48473905], [0.]],
    [[0.31850479, 0.50094621], [0.]],
    [[0.28994571, 0.42245883], [0.]],
    [[0.38122882, 0.44265961], [0.]],
    [[0.09225069, 0.47580646], [0.]],
    [[0.53061455, 0.3292256 ], [0.]],
    [[0.44191684, 0.50561943], [0.]],
    [[0.66886355, 0.58570871], [1.]],
    [[0.61153308, 0.60403384], [1.]],
    [[0.48224027, 0.62321528], [1.]],
    [[0.74221793, 0.52287281], [1.]],
    [[0.71450961, 0.60544011], [1.]],
    [[0.64562234, 0.65087218], [1.]],
    [[0.5698541 , 0.62410334], [1.]],
    [[0.71647564, 0.75738144], [1.]],
    [[0.56560869, 0.61517734], [1.]],
    [[0.77477066, 0.68398982], [1.]],
    [[0.83700722, 0.70121348], [1.]],
    [[0.56709864, 0.6101443 ], [1.]],
    [[0.8297882 , 0.57880385], [1.]],
    [[0.83631143, 0.55713324], [1.]],
    [[0.24328139, 0.80386991], [1.]],
    [[0.84773932, 0.57117017], [1.]],
    [[0.79246783, 0.59210206], [1.]],
    [[0.41140216, 0.80702784], [1.]],
    [[0.82616657, 0.60759285], [1.]],
    [[0.70749835, 0.63976782], [1.]],
    [[0.66611772, 0.61426874], [1.]],
    [[0.8427202 , 0.65145912], [1.]],
    [[0.85397247, 0.57335142], [1.]],
    [[0.57551143, 0.62123232], [1.]],
    [[0.7254559 , 0.59731254], [1.]],
    [[0.70082475, 0.57692784], [1.]],
    [[0.57921274, 0.64221125], [1.]],
    [[0.88534328, 0.59453504], [1.]],
    [[0.70794243, 0.59354679], [1.]],
    [[0.61601104, 0.66909287], [1.]],
    [[0.35372336, 0.68184929], [1.]],
    [[0.78248847, 0.69973916], [1.]],
    [[0.86875895, 0.57753321], [1.]],
    [[0.66822878, 0.64307294], [1.]],
    [[0.9958348 , 0.50440524], [1.]],
    [[0.59161569, 0.61951738], [1.]],
    [[0.59909796, 0.59820474], [1.]],
    [[0.6002823 , 0.70870429], [1.]],
    [[0.67615701, 0.65957895], [1.]],
    [[0.2085308 , 0.75427036], [1.]],
    [[0.3793426 , 0.78989894], [1.]],
    [[0.46284443, 0.71146846], [1.]],
    [[0.67322594, 0.57584667], [1.]],
    [[0.42150788, 0.66145572], [1.]],
    [[0.58540959, 0.69365744], [1.]],
    [[0.60288289, 0.61338261], [1.]],
    [[0.68985431, 0.58562598], [1.]],
    [[0.70100824, 0.4672945 ], [1.]],
    [[0.78072546, 0.59938111], [1.]],
    [[0.90625089, 0.46624215], [1.]],
    [[0.70091067, 0.63907674], [1.]],
    [[0.68754323, 0.72534763], [1.]],
    [[0.35534638, 0.76932132], [1.]],
    [[0.87946933, 0.57367478], [1.]],
    [[0.88297349, 0.54668708], [1.]],
    [[0.76824956, 0.65310667], [1.]],
    [[0.71265936, 0.61241696], [1.]],
    [[0.63700479, 0.65232738], [1.]],
    [[0.54854759, 0.76428889], [1.]],
    [[0.84492001, 0.57702409], [1.]],
    [[0.575665  , 0.50285782], [1.]],
    [[0.52707696, 0.64211723], [1.]],
    [[0.72092471, 0.55526476], [1.]],
    [[0.79951523, 0.52739806], [1.]],
    [[0.7486811 , 0.66527467], [1.]],
    [[0.72833457, 0.57768088], [1.]],
    [[0.6791476 , 0.61700601], [1.]],
    [[0.48120166, 0.74025623], [1.]],
    [[0.54671454, 0.62460249], [1.]],
    [[0.62292362, 0.58377883], [1.]],
    [[0.47116541, 0.66087077], [1.]],
    [[0.55419527, 0.66224326], [1.]],
    [[0.69468985, 0.55244614], [1.]],
    [[0.59506373, 0.60730286], [1.]],
    [[0.62780929, 0.61148593], [1.]],
    [[0.54030548, 0.63123722], [1.]],
    [[0.67920142, 0.66216899], [1.]],
    [[0.69642213, 0.66926963], [1.]],
    [[0.81917517, 0.64593317], [1.]],
    [[0.62013823, 0.70787468], [1.]],
    [[0.72547101, 0.64044269], [1.]],
    [[0.4374424 , 0.68588757], [1.]],
    [[0.47041749, 0.73665679], [1.]],
    [[0.92439975, 0.59243934], [1.]],
    [[0.74624091, 0.59399627], [1.]],
    [[0.56332369, 0.68684868], [1.]],
    [[0.31358882, 0.74177214], [1.]],
    [[0.37658552, 0.68894184], [1.]],
    [[0.72620423, 0.55404552], [1.]],
    [[0.62601421, 0.5492714 ], [1.]],
    [[0.56078967, 0.55144342], [1.]],
    [[0.59860667, 0.65946379], [1.]],
    [[0.63044192, 0.56270131], [1.]],
    [[0.39136523, 0.71566165], [1.]],
    [[0.59978781, 0.77376091], [1.]],
    [[0.69969747, 0.63398134], [1.]],
    [[0.6985274 , 0.66327686], [1.]],
    [[0.55170118, 0.64305183], [1.]],
    [[0.74589619, 0.65207088], [1.]],
    [[0.66286845, 0.62698423], [1.]],
    [[0.77958573, 0.54168537], [1.]],
    [[0.40250691, 0.70879744], [1.]],
    [[0.70472659, 0.58645289], [1.]],
    [[0.39024204, 0.6569999 ], [1.]],
    [[0.73643079, 0.63990442], [1.]],
    [[0.68925692, 0.68702472], [1.]],
    [[0.75102079, 0.71453632], [1.]],
    [[0.70505733, 0.5941027 ], [1.]],
    [[0.53634633, 0.69994717], [1.]],
    [[0.70337788, 0.55616859], [1.]],
    [[0.67547643, 0.7136325 ], [1.]],
    [[0.50511632, 0.75741767], [1.]],
    [[1.        , 0.47855975], [1.]],
    [[0.66554691, 0.5756619 ], [1.]],
    [[0.54798199, 0.57493049], [1.]],
    [[0.75550592, 0.65721136], [1.]],
    [[0.54785932, 0.66877708], [1.]],
    [[0.58582741, 0.72411187], [1.]],
    [[0.60182951, 0.68049872], [1.]],
    [[0.37800747, 0.79362788], [1.]],
    [[0.37770088, 0.71094293], [1.]],
    [[0.59957316, 0.74803265], [1.]],
    [[0.72939455, 0.53760825], [1.]],
    [[0.51736617, 0.79171702], [1.]],
    [[0.51592072, 0.66728492], [1.]]
]


def load_file(filename):
    data = []

    with open(filename, "r") as f:
        for x in f:
            data.append(float(x.strip()))

    return data


def plot_confusion_matrix(y1Data, y2Data):
    fig = plt.figure()
    ax = fig.add_subplot(111)

    confMat = confusion_matrix(y1Data, y2Data)

    ax.matshow(confMat, cmap=plt.cm.Greens, alpha=0.3)
    for i in range(confMat.shape[0]):
        for j in range(confMat.shape[1]):
            plt.text(x=j, y=i, s=confMat[i, j], va='center', ha='center')

    plt.xlabel("True Prediction")
    plt.ylabel("Model Prediction")

    plt.savefig("images/simple_separation_confused.png")
    plt.close()

def data_spitout():
    for rxy in range(len(data_perceptron)):
        print("{}, {}".format(int(data_perceptron[rxy][0][0] * 256), int(data_perceptron[rxy][0][1] * 256)))

def compare(filename):
    data_hat = load_file(filename)
    data_hat = np.array(data_hat)

    y = []
    
    correct = 0
    for rxy in range(len(data_hat)):
        print("Result: {}, Estimate: {}".format(data_perceptron[rxy][1][0], (data_hat[rxy] > 0.5) * 1))

        y.append(data_perceptron[rxy][1][0])

        if((data_hat[rxy] > 0.5) == (data_perceptron[rxy][1][0] == 1)):
            correct += 1

    print("Correct: {}/{}".format(correct, len(data_hat)))
    print("Accuracy: {}".format((correct / len(data_hat)) * 100))
    
    plot_confusion_matrix((data_hat > 0.5), y)



if __name__ == "__main__":

    if len(sys.argv) < 2:
        print("please specify file")
        data_spitout()
    else:
        compare(sys.argv[1])