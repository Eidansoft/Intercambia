Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(1,	'Comunidades Aut&oacute;nomas',	'',	'Comunidades Aut&oacute;nomas'),

(2,	'Andaluc&iacute;a',			'', 'Comunidades Aut&oacute;nomas'),
(3, 'Murcia',					'', 'Comunidades Aut&oacute;nomas'),
(4, 'Extremadura',				'', 'Comunidades Aut&oacute;nomas'),
(5, 'Castilla la Mancha',		'', 'Comunidades Aut&oacute;nomas'),
(6, 'Comunidad Valenciana',		'', 'Comunidades Aut&oacute;nomas'),
(7, 'Madrid',					'', 'Comunidades Aut&oacute;nomas'),
(8, 'Castilla y Le&oacute;n',	'', 'Comunidades Aut&oacute;nomas'),
(9, 'Arag&oacute;n',			'', 'Comunidades Aut&oacute;nomas'),
(10, 'Catalu&ntilde;a',			'', 'Comunidades Aut&oacute;nomas'),
(11, 'La Rioja',				'', 'Comunidades Aut&oacute;nomas'),
(12, 'Navarra',					'', 'Comunidades Aut&oacute;nomas'),
(13, 'Pa&iacute;s Vasco',		'', 'Comunidades Aut&oacute;nomas'),
(14, 'Cantabria',				'', 'Comunidades Aut&oacute;nomas'),
(15, 'Asturias',				'', 'Comunidades Aut&oacute;nomas'),
(16, 'Galicia',					'', 'Comunidades Aut&oacute;nomas'),
(17, 'Ceuta y Melilla',			'', 'Comunidades Aut&oacute;nomas'),
(18, 'Islas Baleares',			'', 'Comunidades Aut&oacute;nomas'),
(19, 'Canarias',				'', 'Comunidades Aut&oacute;nomas');

-- Enlaza la pagina de las comunidades con cada comunidad
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA, TIPO) values
(20,	'Intercambia',	'
<h1>Objetivos</h1>
<ul>
	<li>Recabar, organizar y generar conocimiento e informaci&oacute;n sobre la igualdad de g&eacute;nero en el &aacute;mbito educativo.</li>
	<li>Aportar y facilitar  recursos coeducativos que respondan a las demandas de las y los profesionales del &aacute;mbito educativo y social.</li>
	<li>Promover y difundir actividades formativas relacionadas con la igualdad de oportunidades entre hombres y mujeres y la coeducaci&oacute;n.</li>
	<li>Proporcionar a la Administraciones Educativas y a los Organismos de Igualdad de las C.C.A.A. una herramienta de intercambio de conocimiento y de las experiencias en coeducaci&oacute;n.</li>
</ul>
	',	'Intercambia', 'page');

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(21,	'Encuentros Intercambia',	'
Los Encuentros Intercambia tienen por objetivo el intercambio de experiencias, proyectos y materiales did&aacute;cticos innovadores al respecto de la igualdad de oportunidades en la educaci&oacute;n desarrollados por los Organismos de Igualdad y las Consejer&iacute;as de Educaci&oacute;n de las diferentes Comunidades Aut&oacute;nomas. Para ello, el CNIIE y el Instituto de la Mujer convocan con car&aacute;cter anual una reuni&oacute;n en torno a un tema de inter&eacute;s alrededor del cual se debate, se trazan acciones espec&iacute;ficas y se comparten las diversas actuaciones emprendidas.
<br/>
El primer Encuentro Intercambia tuvo lugar en el a&ntilde;o 2005. Desde entonces, se han llevado a cabo importantes iniciativas, tales como el compromiso s&oacute;lido de las diferentes autonom&iacute;as en la creaci&oacute;n de una red de colaboraci&oacute;n interauton&oacute;mica a trav&eacute;s de la cual coordinar esfuerzos, compartir informaci&oacute;n y difundir buenas pr&aacute;cticas en torno a la coeducaci&oacute;n (la denominada Red Intercambia), as&iacute; como la puesta en marcha del portal web "Intercambia: educar en femenino y en masculino", fruto de un trabajo continuo de comunicaci&oacute;n y difusi&oacute;n conjunta.
<br/>
Algunos de los temas sobre los que han versado los diferentes Encuentros Intercambia han sido el lenguaje y el cambio cultural, la educaci&oacute;n en el cuidado del cuerpo, el amor y la sexualidad, la formaci&oacute;n del profesorado en coeducaci&oacute;n o la orientaci&oacute;n acad&eacute;mico y profesional para la igualdad de oportunidades entre ambos sexos. Fruto de cada uno de ellos se han editado los Cat&aacute;logos Intercambia, en los cuales se recogen las diferentes publicaciones y proyectos empredidos tanto por el CNIIE, el Instituto de la Mujer y las distintas Comunidades y Ciudades Aut&oacute;nomas al respecto de los temas tratados.
<br/>
El 21 de noviembre de 2013 se celebr&oacute; el IX Encuentro Intercambia, dedicado a las Tecnolog&iacute;as de la Informaci&oacute;n y las Comunicaciones (TIC) aplicadas al &aacute;mbito coeducativo. La Jornada, que tuvo lugar en el C&iacute;rculo de Bellas Artes de Madrid, fue inaugurada por Monstserrat Boix, periodista, investigadora, consultora y formadora en comunicaci&oacute;n y g&eacute;nero. Asimismo, se desarrollaron diferentes mesas, en las que se compartieron experiencias coeducativas relacionadas con:
<ul>
<li>El Acceso de las mujeres y la creaci&oacute;n de contenidos did&aacute;cticos a trav&eacute;s de las TIC.</li>
<li>Las TIC en la Educaci&oacute;n como elemento de Igualdad y prevenci&oacute;n de la exclusi&oacute;n.</li>
<li>Educaci&oacute;n digital de las mujeres.</li>
</ul>
El pr&oacute;ximo 20 de noviembre, se va a celebrar el X Encuentro Intercambia, que va a reunir de nuevo a responsables de organismos de igualdad e instituciones  educativas estatales y regionales. Esta vez, se va a dedicar a La teorizaci&oacute;n de los sentimientos y su conexi&oacute;n con los procesos de socializaci&oacute;n en la juventud y la adolescencia. Al igual que en a&ntilde;os anteriores, se presentar&aacute; el Cat&aacute;logo Intercambia,  que recoger&aacute; las publicaciones, proyectos y materiales relacionados con el tema de este a&ntilde;o. En esta secci&oacute;n del Portal, podremos ver las conclusiones, una vez finalizado el Encuentro.
<br/>
Actualmente, es posible acceder a los siguientes documentos correspondientes a Intercambia 2013:
<ul>
	<li><a href="https://www.youtube.com/playlist&#63;feature=edit_ok&list=PL7O-wFTtwWAYmc3JKEYIC__9y0Ppshe_W" target="_blank">Ponencias y mesas de trabajo, en v&iacute;deo</a>.</li>
	<li><a href="http://www.flickr.com/photos/cniie/sets/72157638041122096/" target="_blank">Galer&iacute;a de fotos de la Jornada</a>.</li>
	<li><a href="http://blog.educalab.es/cniie/wp-content/uploads/sites/3/2014/01/ACTA_JORNADAS_intercambia.pdf" target="_blank">Actas</a>.</li>
</ul>
	',	'Intercambia');

Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(20,21);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(22,	'Encuentro Intercambia 2014',	'
El pasado 20 de noviembre, el X Encuentro Intercambia reuni&oacute; de nuevo a responsables de organismos de igualdad e instituciones&nbsp; educativas estatales y regionales. En 2014, ha estado dedicado a La teorizaci&oacute;n de los sentimientos y su conexi&oacute;n con los procesos de socializaci&oacute;n en la juventud y la adolescencia.La inauguraci&oacute;n de la Jornada cont&oacute; con Javier Arroyo P&eacute;rez, Director del Centro Nacional de Innovaci&oacute;n e Investigaci&oacute;n Educativa (CNIIE) y Jes&uacute;s Casas Grande, Subdirector General de Programas del Instituto de la Mujer y para la Igualdad de Oportunidades. F&eacute;lix Labrador Arroyo, Consejero T&eacute;cnico del CNIIE y Bego&ntilde;a Palacios Burgos, Jefa de &Aacute;rea de Programas del Instituto de la Mujer y para la Igualdad de Oportunidades, dieron la bienvenida&nbsp; las Comunidades Aut&oacute;nomas.En la ponencia inicial, Elena Duque S&aacute;nchez, profesora de la Universidad de Gerona e investigadora en violencia de g&eacute;nero y coeducaci&oacute;n, present&oacute; varios estudios acerca de la socializaci&oacute;n en la atracci&oacute;n hacia un modelo de masculinidad dominante. La investigadora puso de manifiesto c&oacute;mo el amor y la atracci&oacute;n son aprendidos, as&iacute; como los mitos que presuponen que &eacute;stos son irracionales, inexplicables o causas de las hormonas o el destino. Mostr&oacute; c&oacute;mo, pese a que a nadie le gusta que le maltraten, existe una socializaci&oacute;n mayoritaria en la que se transmite que aquello bueno y conveniente no es atractivo ni divertido, mientras que lo conflictivo, problem&aacute;tico e incluso violento aparece vinculado al atractivo y al deseo: &quot;los chicos malos&quot;. Este tipo de mensajes est&aacute;n presentes tanto en diversas series de &eacute;xito, pel&iacute;culas, medios de comunicaci&oacute;n como en comentarios que se hacen de manera cotidiana en diversos &aacute;mbitos. &iquest;Qui&eacute;nes son los personajes masculinos que se presentan como deseables&#63; &iquest;Los protagonistas y h&eacute;roes de series, pel&iacute;culas y novelas destinadas al p&uacute;blico juvenil son pac&iacute;ficos e igualitarios&#63; &iquest;Qu&eacute; escenas y qu&eacuteacute; tipo de relaciones se presentan como m&aacute;s excitantes&#63; En demasiadas ocasiones, lo que se presenta como atractivo son hombres violentos y relaciones tormentosas, con juegos de dominaci&oacute;n y rasgos abusivos. Durante el encuentro, se debati&oacute; acerca de la necesidad de reforzar desde las aulas aquellas actitudes que tienen que ver con la igualdad y el respeto, as&iacute; como la importancia de presentar referentes positivos de relaciones y personas como atractivos y deseables (no s&oacute;lo como &eacute;ticos).
<br/>
En esta l&iacute;nea, Carmen Cord&oacute;n Ca&ntilde;ero, asesora t&eacute;cnica de Programas de coeducaci&oacute;n del Instituto Andaluz de la Mujer, present&oacute; la aplicaci&oacute;n de m&oacute;vil <a href="http://www.juntadeandalucia.es/iam/index.php/coeducacion/app-detectamor">APP DetectAmor</a>, una herramienta que pone especial &eacute;nfasis en la educaci&oacute;n afectivo&shy;-amorosa de la juventud andaluza a trav&eacute;s del uso educativo de la telefon&iacute;a m&oacute;vil (APP). Esta herramienta est&aacute; dirigida a J&oacute;venes, para que de una forma l&uacute;dica, puedan reflexionar acerca de sus ideas sobre el amor, sobre c&oacute;mo son las relaciones de pareja que establecen, si &eacute;stas son en igualdad o son relaciones de abuso. Esta iniciativa aprovecha las ventajas que ofrecen las TIC y el car&aacute;cter viral de este tipo de aplicaciones, para sensibilizar, informar y prevenir la violencia de g&eacute;nero. Su desarrollo se ha basado en los resultados de la Investigaci&oacute;n <a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/coeducacion/programa-para-prevenir-la-violencia-de-genero">Andaluc&iacute;a Detecta</a>. Asimismo, present&oacute; otros proyectos del IAM, como la campa&ntilde;a <a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/campanas/si-es-amor">S&iacute; es amor</a>, que ofrece la posibilidad de difundir modelos positivos de relaci&oacute;n y detectar e ir m&aacute;s all&aacute; de los mitos y estereotipos en los que se asienta la violencia machista.
<br/>
El <a href="http://www.madrid.org/cs/Satellite&#63;alias=1354330395607&amp;c=Page&amp;cid=1203409218998&amp;language=es&amp;op2=1203409068655&amp;pagename=ComunidadMadrid%#37;2FEstructura&amp;pid=1109265463020&amp;pv=Asuntos+Sociales&amp;sc=6">Programa No te cortes</a>,  de la Comunidad de Madrid, se orienta a prevenir la violencia contra  las j&oacute;venes a trav&eacute;s de las TIC. Paloma V&aacute;zquez Arriaga y M&ordf; Jos&eacute;  Fern&aacute;ndez Tejada presentaron esta iniciativa. Para llevarla a cabo, se  han repartido 3000 carteles y 10.000 folletos, ubicados en toda la red  de Metro, en bibliotecas, asociaciones de j&oacute;venes, centros de menores,  Puntos municipales de Violencia de G&eacute;nero y colegios. Adem&aacute;s, se han  realizado tr&iacute;pticos donde se han recogido las principales se&ntilde;ales a  tener en cuenta en una relaci&oacute;n, qu&eacute; hace una relaci&oacute;n sana y qu&eacute; no  entre dos personas y qu&eacute; s&iacute;ntomas han de detectar las familias para  saber que su hija est&aacute; viviendo una situaci&oacute;n de violencia machista. Por  otro lado, se va a difundir a trav&eacute;s de las redes sociales Twitter y  Facebook de la Comunidad con el hashtag #notecortesllama un video de  concienciaci&oacute;n. Tal y como indica en su web, esta iniciativa pionera contempla dos  niveles distintos de prevenci&oacute;n y atenci&oacute;n. Por un lado, un primer nivel  de orientaci&oacute;n a trav&eacute;s de una l&iacute;nea de ayuda on line que est&aacute;  disponible en la web de la Direcci&oacute;n General de la Mujer de la  Consejer&iacute;a de Asuntos Sociales, que cuenta con una gu&iacute;a con informaci&oacute;n  pr&aacute;ctica para las adolescentes y los familiares que se puede ver  recogida en los tr&iacute;pticos. Tambi&eacute;n se cuenta con una l&iacute;nea de ayuda  telef&oacute;nica de car&aacute;cter gratuito y confidencial atendida 24 horas por  psic&oacute;logas/os del equipo de la Fundaci&oacute;n ANAR. Por otro lado, se trabaja  en un segundo nivel de atenci&oacute;n psicol&oacute;gica especializada a mujeres  adolescentes v&iacute;ctimas de violencia de g&eacute;nero que se proporciona de  manera presencial a chicas menores de edad que est&eacute;n viviendo  situaciones de violencia de g&eacute;nero. Esta unidad tambi&eacute;n da cobertura a  las familias que identifiquen o sospechen que sus hijas puedan estar en  una relaci&oacute;n de pareja abusiva y necesiten apoyo para ayudarlas.
<br/>
Otra experiencia que se comparti&oacute; relacionada con las TIC es el programa <a href="http://institutoasturianodelamujer.com/iam/wp-content/uploads/2014/04/IDENTIDADES-DIGITALES.pdf">Identidades Digitales</a>. Victoria Garc&iacute;a Corte, del Instituto Asturiano de la Mujer, present&oacute; este programa, que ayuda a prevenir situaciones de violencia por v&iacute;as telem&aacute;ticas, as&iacute; como a navegar de manera segura. Tal y como indica el material did&aacute;ctico del Programa, esta propuesta de intervenci&oacute;n en el aula en el marco del programa &ldquo;Ni Ogros Ni Princesas&rdquo; busca profundizar en la forma en que las redes y los medios de comunicaci&oacute;n influyen a chicos y chicas para, despu&eacute;s, analizar la manera en que esas influencias redibujan sus interacciones emocionales y cotidianas. Para ello, conjugan varios contextos clave que combinamos en pro de un tratamiento hol&iacute;stico de la situaci&oacute;n: la sexolog&iacute;a, la educomunicaci&oacute;n y el conocimiento de la Sociedad de la Informaci&oacute;n.Victoria Garc&iacute;a Corte tambi&eacute;n present&oacute; el <a href="http://web.educastur.princast.es/proyectos/coeduca/">Proyecto de Coeducaci&oacute;n piloto para centros de Educaci&oacute;n Infantil y Primaria</a>, mostrando los resultados de estudios que manifiestan que el alumnado de las escuelas coeducativas presenta una autoestima alta, as&iacute; como mejor salud emocional y relacional que quienes asisten a otro tipo de centros. Para el grupo que inicia la formacio&#769;n este curso, el proyecto se centra en los espacios de relacio&#769;n, es decir, aquellos espacios donde nin&#771;as y nin&#771;as se relacionan &lsquo;libremente&rsquo;, siendo principalmente el patio. Se propone observar que&#769; relaciones se dan entre nin&#771;as y nin&#771;os, adem&aacute;s de analizar las intervenciones de las educadoras en estos espacios. El profesorado participante no se situ&#769;a como receptor pasivo de la  formacio&#769;n sino que adopta un papel activo en la construccio&#769;n de  conocimiento, donde las formadoras de <a href="http://www.coeducaccio.com/">CoeducAccio&#769;</a> se situ&#769;an como&nbsp; acompan&#771;antes en el proceso.
<br/>
Desde Asturias, se present&oacute; tambi&eacute;n la <a href="https://www.educacion.gob.es/intercambia/IrASubSeccionFront.do&#63;id=1222">Iniciativa Educaci&oacute;n y Promoci&oacute;n de la Salud en la Escuela (EPS)</a>, vinculada a la coeducaci&oacute;n, en la que se pueden encontrar materiales y proyectos que son actualmente un referente para otras regiones, como <a href="http://www.educastur.es/index.php&#63;option=com_content&amp;task=view&amp;id=6027&amp;Itemid=238">Ni ogros ni princesas</a> o <a href="http://www.educastur.es/index.php&#63;option=com_content&amp;task=view&amp;id=5145&amp;Itemid=238">Yo cuento, t&uacute; pintas, ella suma</a>.&nbsp;
<br/>
Purificaci&oacute;n Est&eacute;vez Gonz&aacute;lez, coordinadora del &Aacute;rea de Igualdad de la Consejer&iacute;a de Educaci&oacute;n, Universidades y Sostenibilidad del Gobierno de Canarias, present&oacute; la <a href="http://www3.gobiernodecanarias.org/medusa/ecoescuela/emocionycreatividad/">Propuesta curricular de Educaci&oacute;n emocional y para creatividad</a>. Desde esta iniciativa, se promueve que el alumnado aprenda a reconocer, expresar y nombrar emociones, favoreciendo la consciencia emocional y la creatividad, as&iacute; como la gesti&oacute;n de las emociones y la regulaci&oacute;n de la conducta. La metodolog&iacute;a de la que se parte es vivencial e incluye juegos simb&oacute;licos, dramatizaciones, rol-playing y met&aacute;foras vivenciales. Entre otros materiales, el programa ha desarrollado una <a href="http://www3.gobiernodecanarias.org/medusa/ecoescuela/emocionycreatividad/2014/10/09/recursos-para-la-educacion-emocional-y-para-la-creatividad/">Gu&iacute;a de Recursos para la Educaci&oacute;n Emocional y para la Creatividad</a>, que incluye actividades para que el profesorado realice con el alumnado de primaria en la asignatura de Educaci&oacute;n Emocional y para la Creatividad.
<br/>
Otras experiencias que se compartieron en el Encuentro fue la del v&iacute;deo Fairy Tale, desarrollado por el profesorado y el alumnado del IES Clara Campoamor, en Ceuta. Se trata de un cortometraje de prevenci&oacute;n de la violencia sexista que lanza el mensaje a las mujeres de que no est&aacute;n solas y que pueden pedir ayuda y salir de una relaci&oacute;n de malos tratos.Desde la Junta de Castilla y Le&oacute;n, Enrique Trejo L&oacute;pez present&oacute; el material <a href="http://www.educa.jcyl.es/es/informacion/concursos-premios/curso-2013-2014/microrrelatos-igualdad">Microrrelatos por la igualdad</a>, una actividad de sensibilizaci&oacute;n dirigida a la comunidad educativa a trav&eacute;s de los medios que ofrecen las TIC. La actividad consiste en la presentaci&oacute;n de microrrelatos con la finalidad de fomentar entre la poblaci&oacute;n adolescente unos valores basados en la igualdad de oportunidades entre mujeres y hombres y eliminar comportamientos y actitudes que mantienen los estereotipos de g&eacute;nero. Asimismo, Esperanza Sanz Casas present&oacute; los Proyectos de innovaci&oacute;n educativa con orientaci&oacute;n coeducativa.
<br/>
Nuria Solsona i Pair&oacute;, Doctora en Ciencias de la Educaci&oacute;n, investigadora en coeducaci&oacute;n e integrante de la <a href="http://www.coeducaccio.com/">Asociaci&oacute;n CoeducAcci&oacute;</a>, present&oacute; diversas Propuestas para la construcci&oacute;n de formas de relaci&oacute;n sin violencia en las aulas. Desde la Asociaci&oacute;n CoeducAcci&oacute;, desarrollan tanto investigaciones y materiales coeducativos como formaci&oacute;n, sensibilizaci&oacute;n y asesor&iacute;a. A trav&eacute;s de su p&aacute;gina web, es posible acceder a <a href="http://www.coeducaccio.com/index.php/recursos/videos">v&iacute;deos</a>, <a href="http://www.coeducaccio.com/index.php/recursos/contes-infantils">cuentos infantiles</a>, art&iacute;culos libros y enlaces, adem&aacute;s de ofrecer informaci&oacute;n sobre sus proyectos.&nbsp;
	',	'Intercambia');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(20,22);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(23,	'Materiales del Encuentro Intercambia 2014',	'
<h1>Materiales del Encuentro Intercambia 2014</h1>
El pasado 20 de noviembre, el X Encuentro Intercambia reuni&oacute; de nuevo a responsables de organismos de igualdad e instituciones&nbsp; educativas estatales y regionales. En 2014, ha estado dedicado a La teorizaci&oacute;n de los sentimientos y su conexi&oacute;n con los procesos de socializaci&oacute;n en la juventud y la adolescencia. Al igual que en a&ntilde;os anteriores, se presentar&aacute; el Cat&aacute;logo Intercambia,&nbsp; que recoge las publicaciones, proyectos y materiales relacionados con el tema de este a&ntilde;o. M&aacute;s adelante, podremos ver las conclusiones en el Portal Intercambia, una vez finalizado el Encuentro.Los Encuentros Intercambia tienen por objetivo el intercambio de experiencias, proyectos y materiales did&aacute;cticos innovadores al respecto de la igualdad de oportunidades en la educaci&oacute;n desarrollados por los Organismos de Igualdad y las Consejer&iacute;as de Educaci&oacute;n de las diferentes Comunidades Aut&oacute;nomas. Para ello, el CNIIE y el Instituto de la Mujer convocan con car&aacute;cter anual una reuni&oacute;n en torno a un tema de inter&eacute;s alrededor del cual se debate, se trazan acciones espec&iacute;ficas y se comparten las diversas actuaciones emprendidas.
<ol>
	<li><a href="http://blog.educalab.es/cniie/wp-content/uploads/sites/3/2014/11/Final_Diptico_Intercambia2014.pdf">Programa del Encuentro Intercambia 2014</a></li>
	<li><a href="http://blog.educalab.es/cniie/wp-content/uploads/sites/3/2014/11/Final_Diptico_Intercambia2014.pdf">Tr&iacute;ptico del Encuentro Intercambia 2014</a></li>
</ol>
	',	'Intercambia');

Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(20,23);


Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA, TIPO) values
(24,	'Igualdad en el Mundo',	'',	'Intercambia', 'page');

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(25,	'Grupos de investigaci&oacute;n',	'
<h2>Universitarios</h2>
<ol>
	<li><a href="http://www.aeihm.org/">AEIHM: Asociaci&oacute;n Espa&ntilde;ola de Investigaci&ooacute;n Historica de las Mujeres (Universidad de Barcelona)</a></li>
	<li><a href="http://www.audem.com/">AUDEM: Asociaci&oacute;n Universitaria de Estudios de las Mujeres (Universidad de Sevilla)</a></li>
	<li><a href="http://www.aehm.uma.es/">Asociaci&oacute;n de Estudios Hist&oacute;ricos sobre la Mujer (Universidad de M&aacute;laga)</a></li>
	<li><a href="http://www.unican.es/campus-cultural/Pensamiento-Y-Letras/Aula-Interdisciplinar-Isabel-Torres/">Aula Interdisciplinar Isabel Torres de Estudios de las Mujeres y del G&eacute;nero (Universidad de Cantabria)</a></li>
	<li><a href="http://gramola.fyl.uva.es/~wceg/">C&aacute;tedra de Estudios de G&eacute;nero (Universidad de Valladolid)</a></li>
	<li><a href="http://www.uco.es/catedrasyaulas/catedramujeres/">C&aacute;tedra de Estudios de Mujeres "Leonor de Guzm&aacute;n" (Universidad de C&oacute;rdoba)</a></li>
	<li><a href="http://catedraviolencia.uib.es/">C&aacute;tedra de Estudios de Violencia de G&eacute;nero (Universidad de las Islas Baleares)</a></li>
	<li><a href="http://webs.uvigo.es/pmayobre/catedra_feminista.htm">C&aacute;tedra Feminismos, G&eacute;neros e Identidades (Universidad de Vigo)</a></li>
	<li><a href="http://mujeres.usal.es/">Centro de Estudios de la Mujer (Universidad de Salamanca)</a></li>
	<li><a href="http://portal.uned.es/portal/page&#63;_pageid=93,742155,93_20552344&_dad=portal&_schema=PORTAL">Centro de Estudios de G&eacute;nero (Universidad Nacional de Educaci&oacute;n a Distancia)</a></li>
	<li><a href="http://www.uvic.es/node/561">Centro de Estudios Interdisciplinares de la Mujer (Universidad de Vic)</a></li>
	<li><a href="http://web.ua.es/cem">Centro de Estudios sobre la Mujer (Universidad de Alicante)</a></li>
	<li><a href="http://www.unioviedo.es/CIFEM/">Centro de Investigaciones Feministas (Universidad de Oviedo)</a></li>
	<li><a href="http://www.ub.edu/cdona/es">Centre Dona i Literatura (Universidad de Barcelona)</a></li>
	<li><a href="http://www.usc.es/es/institutos/cifex/">CIFEX. Centro Interdisciplinario de Investigaciones Feministas y de Estudios de G&eacute;nero  (Universidad de Santiago de Compostela)</a></li>
	<li><a href="http://www.ub.edu/web/ub/es/recerca_innovacio/recerca_a_la_UB/instituts/institutspropis/crea.html">CREA: Centro especial en investigaci&oacute;n en teor&iacute;as y pr&aacute;cticas superadoras de desigualdades (Universidad de Barcelona)</a></li>
	<li><a href="http://www.ub.es/duoda/">DUODA (Universidad de Barcelona) </a></li>
	<li><a href="http://userpages.umbc.edu/~korenman/wmst/programs.html">Estudios de las Mujeres a lo largo del mundo: Programas, Departamentos y Centros de Investigaci&oacute;n</a></li>
	<li><a href="http://webs.uvigo.es/tdiferencia/">Feminario de Investigaci&oacute;n. Feminismos y Resistencias (Universidad de Vigo)</a></li>
	<li><a href="http://isonomia.uji.es/">Fundaci&oacute; Isonom&iacute;a (Universidad Jaume I de Castell&oacute;n)</a></li>
	<li><a href="http://gentyll.uah.es/gentyllp/gtspindex.html">Gentyll - G&Eacute;Nero en la Traducci&oacute;n Y el Lenguaje y la Legislaci&oacute;n (Universidad de Alcal&aacute; de Henares, Madrid)</a></li>
	<li><a href="http://www.ub.edu/cdona/GRC.htm">Grupo de Investigaci&oacute;n Creaci&oacute;n y Pensamiento de las Mujeres (Universidad de Barcelona)</a></li>
	<li><a href="http://www.ub.es/tig/">Grupo de Investigaci&oacute;n Interdisciplinar, Trabajo, Instituciones y G&eacute;nero (Universidad de Barcelona)</a></li>
	<li><a href="http://www.uc3m.es/portal/page/portal/investigacion/nuestros_investigadores/grupos_investigacion/trabajo_familia_genero">Grupo de Investigaci&oacute;n Trabajo, Familia y G&eacute;nero (Universidad Carlos III)</a></li>
	<li><a href="http://www.if.uji.es/category/enlaces/institutos-y-seminarios-universitarios">Institutos y Seminarios universitarios</a></li>
	<li><a href="http://iuem.jimdo.com/">Instituto Universitario de Estudios de la Mujer (Universidad Aut&oacute;noma de Madrid)</a></li>
	<li><a href="http://www.ugr.es/~insmujer/">Instituto Universitario de Estudios de la Mujer (Universidad de Granada)</a></li>
	<li><a href="http://www.uv.es/~iued/">Instituto Universitario de Estudios de la Mujer (Universidad de Valencia)</a></li>
	<li><a href="http://www.if.uji.es/">Instituto Universitario de Investigaci&oacute;n Feminista y de G&eacute;nero (Universidad Jaume I)</a></li>
	<li><a href="http://www.iuem-ull.org/index.php">Instituto Universitario de Estudios de las Mujeres (Universidad de La Laguna)</a></li>
	<li><a href="http://www.ucm.es/info/instifem/">Instituto Universitario de Investigaciones Feministas (Universidad Complutense de Madrid)</a></li>
	<li><a href="http://www.uclm.es/organos/vic_investigacion/GruposUCLM/grupos.aspx&#63;gr=166&inf=per">Investigaci&oacute;n y Estudios de G&eacute;nero (Universidad de Castilla-La Mancha)</a></li>
	<li><a href="http://www.urjc.es/GICOMSOC/seminarioig/congresocig/">Seminario de Estudios Identidad y G&eacute;nero (Universidad Rey Juan Carlos)</a></li>
	<li><a href="http://www.um.es/siegum/presentacion.php">Seminario Interdisciplinar de Estudios de G&eacute;nero (Universidad de Murcia)</a></li>
	<li><a href="http://www.ujaen.es/investiga/siemujer/">Seminario Interdisciplinar de Estudios sobre la Mujer (Universidad de Ja&eacute;n)</a></li>
	<li><a href="http://web.udl.es/arees/sied/">Seminario Interdisciplinar de Estudios de la Mujer (Universidad de Lleida)</a></li>
	<li><a href="http://www.ub.edu/SIMS/index.html">Seminario Interdisciplinar Mujeres y Sociedad (Universidad de Barcelona)</a></li>
	<li><a href="http://www.usc.es/smucea/">Seminario Mujeres y Universidad (Universidad de Santiago de Compostela)</a></li>
	<li><a href="https://blogs.ujaen.es/semmujer/">Seminario Multidisciplinar Mujer, Ciencia y Sociedad (Universidad de Ja&eacute;n)</a></li>
	<li><a href="http://ve.umh.es/sieg.1/">SIEG: Seminario Interdisciplinar de Estudios de G&eacute;nero (Universidad Miguel Hern&aacute;ndez de Elche, Alicante)</a></li>
	<li><a href="http://wzar.unizar.es/siem/present.html">SIEM: Seminario Interdisciplinar de Estudios de la Mujer (Universidad de Zaragoza)</a></li>
	<li><a href="http://www.fyl.uva.es/suens/">SUENS - Seminario Universitario de Educaci&oacute;n no Sexista (Universidad de Valladolid)</a></li>
	<li><a href="http://www.ww05.org/wows/start.html">WOWS: Woldwide Women&apos;s Studies Organization - Organizaci&oacute;n de Estudios de las Mujeres a lo largo del mundo</a></li>
</ol>
<h2>No Universitarios</h2>
<ol>
	<li><a href="http://www.amit-es.org/">AMIT - Asociaci&oacute;n de Mujeres Investigadoras y Tecn&oacute;logas </a></li>
	<li><a href="http://mensstudies.org/">American Men''''s Studies Association</a></li>
	<li><a href="http://genet.csic.es/">Asociaci&oacute;n GENET - Red Transversal de Estudios de G&eacute;nero en Ciencias Humanas, Sociales y Jur&iacute;dicas</a></li>
	<li><a href="http://www.caps.cat/redcaps.html">CAPS, Centro de An&aacute;lisis y Programas Sanitarios</a></li>
	<li><a href="http://webserver.rcp.net.pe/cemhal/">CEHMAL Centro de Estudios: la mujer en la historia de Latinoam&eacute;rica</a></li>
	<li><a href="http://www.cecomas.com/">CECOMAS (Centro de Estudios de la Condici&oacute;n Masculina)</a></li>
	<li><a href="http://www.csic.es/web/guest/mujeres-y-ciencia">Comisi&oacute;n Mujeres y Ciencia del CSIC</a></li>
	<li><a href="http://www.malostratos.org/">Comisi&oacute;n para la investigaci&oacute;n de malos tratos a mujeres</a></li>
	<li><a href="http://www.estudiosmujeres.blogspot.com.es/">Estudios sobre las mujeres. Recursos sobre investigaci&oacute;n en g&eacute;nero. E-leusis</a></li>
	<li><a href="http://www.eme.cl/">EME - Masculinidades y Equidad de G&eacute;nero</a></li>
	<li><a href="http://www.caps.cat/redcaps.html">CAPS, Centro de An&aacute;lisis y Programas Sanitarios</a></li>
	<li><a href="http://www.estudiosmasculinidades.buap.mx/">Red Internacional de Estudios sobre Masculinidades</a></li>
</ol>
	',	'Intercambia'),
(26,	'Asociaciones, Fundaciones, Organizaciones y Librer&iacute;as',	'
<h2>Asociaciones de mujeres por la Igualdad y la valoraci&oacute;n de la diferencia sexual sin jerarqu&iacute;as</h2>
<ol>
	<li><a href="http://www.clasicasymodernas.org/">Asociaci&oacute;n Cl&aacute;sicas y Modernas para la igualdad de g&eacute;nero en la cultura</a></li>
	<li><a href="http://www.alu.ua.es/r/rlp12/">AFESIP: Asociaci&oacute;n para Mujeres en Situaci&oacute;n Precaria</a></li>
	<li><a href="http://www.mujeresjuristasthemis.org/">Asociaci&oacute;n de Mujeres Juristas Themis</a></li>
	<li><a href="http://www.mujeresparalasalud.org/">Asociaci&oacute;n de Mujeres para la Salud</a></li>
	<li><a href="http://www.afammer.es/">Asociaci&oacute;n de mujeres y familias del medio rural</a></li>
	<li><a href="http://www.unizar.es/centros/eueeh/mestipen/doc/bd.pdf">Asociaciones de mujeres gitanas o con presencia de mujeres gitanas</a></li>
	<li><a href="https://www.facebook.com/pages/Asociaci%#37;C3%#37;B3n-Gitanas-Feministas-por-la-Diversidad/293492244137017&#63;ref=stream">Asociaci&oacute;n Gitanas Feministas por la Diversidad</a></li>
	<li><a href="http://www.celem.org/">CELEM: Coordinadora espa&ntilde;ola para el lobby europeo de mujeres</a></li>
	<li><a href="http://www.violacion.org/">Centro de asistencia a v&iacute;ctimas de agresiones sexuales</a></li>
	<li><a href="http://www.cermi.es/es-ES/MujeresDiscapacidad/Paginas/Inicio.aspx">CERMI (Comit&eacute; Espa&ntilde;ol de Representantes de Personas con Discapacidad): Mujeres con Discapacidad</a></li>
	<li><a href="http://malostratos.org/">Comisi&oacute;n para la investigaci&oacute;n de malos tratos a mujeres</a></li>
	<li><a href="http://dromkotar.org/es/">Drom Kotar Mestipen. Asociaci&oacute;n Gitana de Mujeres</a></li>
	<li><a href="http://www.separadasydivorciadas.org/">Federaci&oacute;n de asociaci&oacute;n de mujeres separadas y divorciadas</a></li>
	<li><a href="http://federacionkamira.org.es/Quienes_somos_-Asociaciones_federadas.html">Federaci&oacute;n de Asociaciones de Mujeres Gitanas KAMIRA</a></li>
	<li><a href="http://www.femur.es/">FEMUR: Federaci&oacutoacute;n de la mujer rural</a></li>
	<li><a href="http://www.fraigal.com/comunidad-sorda/mujeres-sordas/">FRAIGAL - Mujeres sordas</a></li>
	<li><a href="http://www.fundacionmujeres.es/">Fundaci&oacute;n Mujeres</a></li>
	<li><a href="http://www.mujeresjovenes.org/">Federaci&oacute;n de Mujeres J&oacute;venes</a></li>
	<li><a href="http://www.fmujeresprogresistas.org/">Federaci&oacute;n de Mujeres Progresistas</a></li>
	<li><a href="http://www.fundacionentredos.org/">Fundaci&oacute;n Entred&oacute;s</a></li>
	<li><a href="http://www.fbernadet.org/">Fundaci&oacute;n Vicki Bernadet</a></li>
	<li><a href="http://www.miriadas.es/">MIRIADAS, Asociaci&oacute;n de Mujeres V&iacute;ctimas de Violencia de G&eacute;nero</a></li>
	<li><a href="http://www.mujeresenred.net/">Mujeres en red</a></li>
	<li><a href="http://www.rednosotrasenelmundo.org/spip.php&#63;page=quienes-somos">Red Nosotras en el Mundo</a></li>
	<li><a href="redaminvi.blogspot.com.es ">Red AMINVI: Red de Apoyo a la Mujer Inmigrante V&iacute;ctima de Violencia de G&eacute;nero</a></li>
	<li><a href="http://www.cermi.es/es-ES/MujeresDiscapacidad/Paginas/RedNacional.aspx">Red Estatal de Mujeres con Discapacidad</a></li>
	<li><a href="http://www.redfeminista.org/index.asp">Red Estatal de Organizaciones Feministas contra la violencia de g&eacute;nero</a></li>
	<li><a href="http://redormiga.org/taxonomy/term/26">Red Ormiga: Red de Organizaciones de Mujeres Inmigrantes</a></li>
	<li><a href="http://www.comadresfeministas.com/">Tertulia Feminista Les Comadres</a></li>
</ol>
<h2>Asociaciones de mujeres profesionales, en las ciencias, las artes, letras, deporte, tecnolog&iacute;as</h2>
<ol>
	<li><a href="http://www.nodo50.org/ameco/">AMECO: Asociaci&oacute;n Espa&ntilde;ola de Mujeres de Medios de Comunicaci&oacute;n</a></li>
	<li><a href="http://www.amit-es.org/">AMIT: Asociaci&oacute;n de mujeres investigadoras y tecn&oacute;logas del CSIC</a></li>
	<li><a href="http://www.geocities.com/Athens/Parthenon/8947/">Asociaci&oacute;n Espa&ntilde;ola de Filosof&iacute;a "Mar&iacute;a Zambrano"</a></li>
	<li><a href="http://www.donesjuristes.cat/">Asociaci&oacute; Dones Juristes</a></li>
	<li><a href="http://www.mujeresjuristasthemis.org/">Asociaci&oacute;n de Mujeres Juristas Themis</a></li>
	<li><a href="http://mujeresenlamusica.blogspot.com.es/">Asociaci&oacute;n de Mujeres en la M&uacute;sica</a></li>
	<li><a href="http://www.cimamujerescineastas.es/">CIMA - Asociaci&oacute;n de Mujeres Cineastas y de Medios Audiovisuales</a></li>
	<li><a href="http://www.mujerydeporte.org/">Comisi&oacutoacute;n Mujer y Deporte, Comit&eacute; Ol&iacute;mpico Espa&ntilde;ol</a></li>
	<li><a href="http://www.fifcj-ifwlc.net/es/&#63;page_id=23">FIFCJ: Federaci&oacute;n Internacional de Mujeres de Carreras Jur&iacute;dicas</a></li>
	<li><a href="http://www.lamujerconstruye.org/">La Mujer construye</a></li>
	<li><a href="http://www.unizar.es/mutem/">MUCIT: Asociaci&oacute;n de Mujeres Cient&iacute;ficas y T&eacute;cnicas </a></li>
	<li><a href="http://www.mav.org.es/">MAV - Mujeres en las Artes Visuales</a></li>
	<li><a href="http://www.mujeresparalasalud.org/">Mujeres Para La Salud</a></li>
	<li><a href="http://www.rsme.es/comis/mujmat/">Mujeres y Matem&aacute;ticas</a></li>
	<li><a href="http://www.mujeresempresarias.org/">OMEGA: Organizaci&oacute;n de Mujeres Empresarias y Gerencia Activa</a></li>
	<li><a href="https://www.facebook.com/pages/Periodistas-por-la-Igualdad/115726411807890">Periodistas por la igualdad</a></li>
	<li><a href="http://www.caps.cat/redcaps.html">Red de Mujeres Profesionales para la Salud</a></li>
</ol>
<h2>Instituciones Estatales</h2>
<ol>
	<li><a href="http://www.mecd.gob.es/cniie">CNIIE - Centro Nacional de Innovaci&oacute;n e Investigaci&oacute;n Educativa (MECD)</a></li>
	<li><a href="http://www.msssi.gob.es/ssi/violenciaGenero/home.htm">Delegaci&oacute;n del Gobierno para la Violencia de G&eacute;nero</a></li>
	<li><a href="http://www.inmujer.es/">Instituto de la Mujer (Ministerio de Sanidad, Servicios Sociales e Igualdad)</a></li>
	<li><a href="http://www.mecd.gob.es/portada-mecd/">Ministerio de Educaci&oacute;n, Cultura y Deporte</a></li>
	<li><a href="http://www.msssi.gob.es/ssi/portada/home.htm">Servicios Sociales e Igualdad (Ministerio de Sanidad, Servicios Sociales e Igualdad)</a></li>
</ol>
<h2>Hombres por la Igualdad</h2>
<ol>
	<li><a href="http://www.ahige.org/">AHIGE: Asociaci&oacute;n de Hombres por la Igualdad de G&eacute;nero</a></li>
	<li><a href="http://hombresporlaigualdadpalencia.blogspot.com.es/">Codo a codo. Hombres por la Igualdad Palencia</a></li>
	<li><a href="http://www.eurowrc.org/01.eurowrc/05.eurowrc_es/sevilla/sevilla3.htm">Grupo de Hombres de Sevilla- Hombres contra la violencia</a></li>
	<li><a href="http://heterodoxia.wordpress.com/">Heterodoxia, comunidad de hombres por la igualdad</a></li>
	<li><a href="http://www.jerez.es/index.php&#63;id=7113">Hombres por la Igualdad, Jerez</a></li>
	<li><a href="http://vocesdehombres.wordpress.com/">Voces de hombres por la igualdad de g&eacute;nero</a></li>
</ol>
<h2>Secciones de mujeres, educaci&oacute;n e igualdad en sindicatos</h2>
<ol>
	<li><a href="http://www.ccoo.es/csccoo/menu.do&#63;Areas:Mujeres">Comisiones Obreras (CC.OO): Secretar&iacute;a Confederal de la Mujer </a></li>
	<li><a href="http://www.educacionenvalores.org/">FETE-UGT: Educaci&oacute;n en valores</a></li>
	<li><a href="http://www.stei-i.org/cat/index.php&#63;option=com_content&task=blogsection&id=7&Itemid=35">Sindicat de Treballadores de l''Ensenyament de les Illes Ballears (STE-i): Secretariat de la dona</a></li>
	<li><a href="http://www.suatea.org/"> Sindicatu Unitariu y aut&oacute;nomu de trabayadores de la ense&ntilde;anza d&iquest;Asturies (SUATEA): Secretar&iacute;a de la Mujer</a></li>
	<li><a href="http://www.stes.es/mujer.html">STEs Intersindical: Organizaci&oacute;n de mujeres</a></li>
	<li><a href="http://www.ugt.es/Mujer/mujer.html">UGT: Secratar&iacute;a para la igualdad </a></li>
	<li><a href="http://www.ustea.org/educacion/index.html"> Uni&oacute;n de sindicatos de trabajadores y trabajadoras de la ense&ntilde;anza de Andalucia (USTEA): Secretar&iacute;a de la mujer</a></li>
</ol>
<h2>Otras organizaciones e iniciativas a favor de la igualdad, la educaci&oacute;n, la paz y la ayuda a v&iacute;ctimas de violencia</h2>
<ol>
	<li><a href="http://epd.quepo.org/ca/aixoesepd.html">Aix&oacute; es EpD - Educaci&oacute;n para el Desarrollo</a></li>
	<li><a href="http://degenacoe.blogspot.com.es/">Asociaci&oacute;n DEGENA -Docentes por la Equidad de G&eacute;nero y la Educaci&oacute;n No Androc&eacute;ntrica-</a></li>
	<li><a href="http://aspasi.org/">ASPASI, Asociaci&oacute;n para la Sanaci&oacute;n y Prevenci&oacute;n de Abusos Sexuales en la Infancia</a></li>
	<li><a href="http://booooo.org/">Booooo, Creatividad Social</a></li>
	<li><a href="http://www.violacion.org/">CAVAS, Centro de Asistencia a V&iacute;ctimas de Agresiones Sexuales</a></li>
	<li><a href="http://www.fundacionreencuentro.com/cms/">Fundaci&oacute;n Terapia del Reencuentro</a></li>
	<li><a href="http://www.mcep.es/">Movimiento Cooperativo de Escuela Popular</a></li>
	<li><a href="http://www.mujeresenred.net/">Mujeres en Red</a></li>
	<li><a href="http://www.redfeminista.org/">Red Feminista contra la violencia hacia las mujeres</a></li>
	<li><a href="http://www.guiaviolenciadegenero.com/">Vida sin violencia</a></li>
</ol>
<h2>Librer&iacute;as de mujeres, igualdad y diferencia sexual sin jerarqu&iacute;as</h2>
<ol>
	<li><a href="http://mujeresycialibreria.blogspot.com.es/">Librer&iacute;a Mujeres &amp; Compa&ntilde;&iacute;a Madrid</a></li>
	<li><a href="http://www.libreriademujeres.com/">Librer&iacute;a de Mujeres de Canarias</a></li>
	<li><a href="http://www.llibreriaproleg.com/">Librer&iacute;a Proleg</a></li>
</ol>
	',	'Intercambia'),
(29,	'Observatorios',	'
<ol>
	<li><a href="http://www.inmujer.gob.es/observatorios/observIgualdad/home.htm">Instituto de la Mujer: Observatorio de la Igualdad</a></li>
	<li><a href="http://www.inmujer.gob.es/observatorios/observImg/home.htm">Instituto de la Mujer: Observatorio de la Imagen de las Mujeres</a></li>
	<li><a href="http://www.msssi.gob.es/ssi/violenciaGenero/ObservatorioEstatal/home.htm">Ministerio de Sanidad, Servicios Sociales e Igualdad: Observatorio Estatal de Violencia sobre la Mujer</a></li>
	<li><a href="http://www.proyectoeloisa.org/index.php/component/content/article/1/3-observatorio-extremeno-de-igualdad-de-oportunidades-y-empleabilidad.html">Asociaci&oacute;n Elo&iacute;sa: Observatorio Extrema&ntilde;o de Igualdad de Oportunidades y Empleabilidad</a></li>
	<li><a href="http://www.emakunde.euskadi.net/u72-observa/es/contenidos/informacion/observatorio_igualdad/es_observa/observatorio.html">Instituto Vasco de la Mujer (Emakunde): Defentsoria. Observatorio de Igualdad de Trato</a></li>
	<li><a href="http://institutoasturianodelamujer.com/iam/observatorio-de-igualdad-de-oportunidades/">Instituto Astruriano de la Mujer: Observatorio de Igualdad de oportunidades</a></li>
	<li><a href="http://www.juntadeandalucia.es/institutodelamujer/observatorio/web/observatorio;jsessionid=4D72EA6C03F791CC9F9B8BA68D266049">Instituto Andaluz de la Mujer: Observatorio Andaluz de la Publicidad No Sexista</a></li>
	<li><a href="http://igualdade.xunta.es/observatorio-da-publicidade">Secretaria Xeral de Igualdade: Observatorio da publicidade (Observatorio de la Publicidad)</a></li>
	<li><a href="http://www.uab.es/observatori-igualtat/">Universidad Aut&oacute;noma de Barcelona: Observatori per la la Igualtat (Observatorio para la Igualdad)</a></li>
	<li><a href="http://www.unizar.es/gobierno/vr_institucionales/observatorio.html">Universidad de Zaragoza: Observatorio de Igualdad de G&eacute;nero</a></li>
	<li><a href="http://www.msssi.gob.es/ssi/violenciaGenero/ObservatorioEstatal/home.htm">Observatorio Estatal de Violencia sobre la Mujer</a></li>
	<li><a href="http://www.e-igualdad.net/observatorio-igualdad">Observatorio e-igualdad</a></li>
	<li><a href="http://www.mav.org.es/index.php/observatorio">Observatorio de Mujeres en las Artes Visuales</a></li>
	<li><a href="http://www.observatoripalma.org/">Ayuntamiento de Palma: Observatori Municipal de la Igualtat (Observatorio Municipal de la Igualdad)</a></li>
	<li><a href="http://www.cepal.org/oig/">CEPAL: Observatorio de Igualdad de G&eacute;nero de Am&eacute;rica Latina y El Caribe</a></li>
	<li><a href="http://www.once.es/new/plan-de-igualdad">ONCE: Observatorio de Igualdad de Oportunidades</a></li>
	<li><a href="http://www.observatoriodeladiscapacidad.es/&#63;q=es/taxonomy/term/191">Observatorio Estatal de la Discapacidad en relaci&oacute;n a las Mujeres, Ministerio de Educaci&oacute;n, Cultura y Deportes</a></li>
</ol>
	',	'Intercambia'),
(30,	'Entidades Internacionales',	'
<ol>
	<li><a href="http://www.es.amnesty.org/temas/mujeres/violencia-contra-las-mujeres/">Amnist&iacute;a Internacional: derechos humanos de las mujeres</a></li>
	<li><a href="http://www.bancomujer.org/">Banco Mundial de la Mujer</a></li>
	<li><a href="http://www.un.org/womenwatch/daw/beijing/platform/">Beijing platform for action (incluye, entre sus objetivos estrat&eacute;gicos y medidas, la educaci&oacute;n y capacitaci&oacute;n de las mujeres)</a></li>
	<li><a href="http://www.eclac.cl/mujer/">CEPAL: Divisi&oacute;n de Asuntos de G&eacute;nero. Comisi&oacute;n Econ&oacute;mica para Am&eacute;rica Latina y el Caribe</a></li>
	<li><a href="http://www.oitcinterfor.org/genero/inicio">CINTERFOR - OIT: Centro Interamericano de Investigaci&oacute;n y Documentaci&oacute;n sobre la Formaci&oacute;n Profesional. G&eacute;nero, formaci&oacute;n y trabajo</a></li>
	<li><a href="http://www.minedu.gob.pe/educacionparatodos/InfoGen.php">Foro Nacional educaci&oacute;n para todos (Per&uacute;)</a></li>
	<li><a href="http://www.un-instraw.org/es/">INSTRAW: Instituto Internacional de Investigaciones y Capacitaci&oacute;n para la Promoci&oacute;n de la Mujer de las Naciones Unidas</a></li>
	<li><a href="http://www.mujeresenred.net/spip.php&#63;article666">Marcha mundial de las mujeres</a></li>
	<li><a href="http://www.un.org/womenwatch/directory/education_and_training_of_women_3002.htm">ONU - Women Watch: Directorio de Recursos G&eacute;nero y Mujer</a></li>
	<li><a href="http://www.unwomen.org/es/">ONU-Mujeres (UN Women): Entidad de las Naciones Unidas para la igualdad de g&eacute;nero y el empoderamiento las mujeres</a></li>
	<li><a href="http://www.undp.org/content/undp/es/home/ourwork/womenempowerment/overview/">PNUD: Campa&ntilde;a de las agencias de las naciones unidas en Latinoamerica y El Caribe por los derechos humanos de la mujer</a></li>
	<li><a href="http://www.ilo.org/public/spanish/gender.htm">Organizaci&oacute;n Internacional del Trabajo. La igualdad de g&eacute;nero</a></li>
	<li><a href="http://www.un.org/spanish/Depts/dpi/boletin/mujer/index.htm">Organizaci&oacute;n de Naciones Unidas y Mujer</a></li>
	<li><a href="http://www.iadb.org/topics/education/EducationInitiative/index.cfm">IDB (Inter-American Development Bank). Iniciativas en educaci&oacute;n</a></li>
	<li><a href="http://www.repem.org.uy/&#63;q=taxonomy/term/19/9">REPEM: Red de educaci&oacute;n popular entre mujeres de Am&eacute;rica Latina y El Caribe</a></li>
	<li><a href="http://www.unicef.org/spanish/girlseducation/">UNICEF. Educaci&oacute;n b&aacute;sica e igualdad entre los g&eacute;neros</a></li>
	<li><a href="http://portal.unesco.org/en/ev.php-URL_ID=10996&URL_DO=DO_TOPIC&URL_SECTION=201.html">UNESCO: Mujer e igualdad de g&eacute;nero. Secci&oacute;n Educaci&oacute;n</a></li>
	<li><a href="http://www.unifem.org/">UNIFEM: Fondo de desarrollo de las mujeres de Naciones Unidas</a></li>
</ol>
	',	'Intercambia'),
(31,	'Bibliotecas, Centros de documentaci&oacute;n y buscadores',	'
<ol>
	<li><a href="http://www.unizar.es/gobierno/vr_institucionales/catedras/genero/AEQUALITAS/aequalitas.htm">Aequalitas. Revista Jur&iacute;dica de Igualdad de Oportunidad entre Mujeres y Hombres</a></li>
	<li><a href="http://www.mujeresenlamusica.es/">Asociaci&oacute;n Mujeres en la M&uacute;sica. Archivo de obras</a></li>
	<li><a href="http://www.rosachacel.org/centro-de-documentacion-y-biblioteca-de-la-mujer-de-valladolid_29595.html">Asociaci&oacute;n Rosa Chacel para la Mujer. Centro de documentaci&oacute;n y biblioteca de la mujer de Valladolid</a></li>
	<li><a href="http://dromkotar.org/es/&#63;page_id=68">Asociaci&oacute;n Gitana de Mujeres Drom Kotar Mestipen. Fondo Documental</a></li>
	<li><a href="http://www.mecd.gob.es/biblioteca-central/">Biblioteca de Educaci&oacute;n, Ministerio de Educaci&oacute;n, Cultura y Deportes (MECD)</a></li>
	<li><a href="http://www.mujerpalabra.net/bibliotecademujeres/">Biblioteca de Mujeres</a></li>
	<li><a href="http://www.ipesnavarra.org/biblioteca-de-mujeres">Biblioteca/Centro de Documentaci&oacute;n de la Mujeres. Instituto Promoci&oacute;n Estudios Sociales Elkartea (Navarra)</a></li>
	<li><a href="http://www.begv.gva.es/dgm/tlpdgm.html">Biblioteca de la Direcci&oacute;n General de la Mujer. Conseller&iacute;a de Bienestar Social (Generalitat Valenciana)</a></li>
	<li><a href="http://www.diba.es/francescabonnemaison/es/biblioteca.asp">Biblioteca Francesca Bonnemaison. Diputaci&oacute;n de Barcelona</a></li>
	<li><a href="http://www.caladona.org/ca-la-dona/centre-dinformacio-i-recursos/">Ca la Dona. Centre d''''Informaci&oacute; y Recursos / Centro de Informaci&oacute;n y Recursos. </a></li>
	<li><a href="http://mujeres.usal.es/index.php&#63;option=com_content&task=view&id=65&Itemid=42">CEMUSA, Centro de Estudios de la Mujer de la Unversidad de Salamanca: BIBLIOTECA, FILMOTECA, FONOTECA</a></li>
	<li><a href="http://www.nodo50.org/ameco/enlaces.html#5">Centros de Documentaci&oacute;n sobre las Mujeres en Espa&ntilde;a y Directorio Internacional de redes de informaci&oacute;n: Internet, revistas, programas de radio sobre mujer y g&eacute;nero (AMECO)</a></li>
	<li><a href="http://www.emakunde.euskadi.net/u72-subhome5/es/">Centro de Documentaci&oacute;n de Emakunde</a></li>
	<li><a href="http://institutoasturianodelamujer.com/iam/documentacion-y-materiales/centro-de-documentacion-del-instituto-asturiano-de-la-mujer/">Centro de Documentaci&oacute;n del Instituto Asturiano de la Mujer</a></li>
	<li><a href="http://www.telde.es/content/view/131/120/">Centro de Documentaci&oacute;n de la Mujer. Ayuntamiento de Telde (Canarias)</a></li>
	<li><a href="http://www.igualdadevigo.org/&#63;sec=2#centro_documentacion">Centro de Documentaci&oacute;n e Recursos Feministas. Conceller&iacute;a de Igualdade de Vigo / Centro de Documentaci&oacute;n y Recursos Feministas. Consejer&iacute;a de Igualdad de Vigo</a></li>
	<li><a href="http://www.juntadeandalucia.es/iam/-CentrodeDocumentacion-.html">Centro de Documentaci&oacute;n Mar&iacute;a Zambrano. Instituto Andaluz de la Mujer</a></li>
	<li><a href="http://www.navarra.es/home_es/Temas/Igualdad+de+genero/Centro+de+documentacion/centrodocumentacion.htm">Centro de Documentaci&oacute;n del Instituto Navarro para la Igualdad</a></li>
	<li><a href="http://www.mav.org.es/index.php/the-news">Centro de Documentaci&oacute;n de Mujeres en las Artes Visuales (MAV)</a></li>
	<li><a href="http://www.gitanos.org/servicios/documentacion/">Centro de documentaci&oacute;n de la Fundaci&oacute;n Secretariado Gitano (tienen materiales interesantes sobre mujeres gitanas)</a></li>
	<li><a href="http://w3.bcn.es/dones/0,4022,170957416_170996545_1,00.html">CIRD. Centre d''Informaci&oacute; i Recursos per a les dones / Centro de Informaci&oacute;n y Recursos para las mujeres (Ayuntamiento de Barcelona). Centro de Documentaci&oacute;n</a></li>
	<li><a href="http://www.marianapineda.com/">Centro europeo de las mujeres Mariana Pineda</a></li>
	<li><a href="https://www.educacion.gob.es/creade/index.do">CREADE. Centro de Recursos para la Atenci&oacute;n a la Diversidad Cultural en Educaci&oacute;n.</a></li>
	<li><a href="http://www.emakumeak.org/es">Emakumeen dokumentazio zentroa. Centro de documentaci&oacute;n de mujeres Maite Albiz</a></li>
	<li><a href="http://mujeres.usal.es/index.php&#63;option=com_content&task=view&id=200&Itemid=106">FONOTECA de obras impresas compuestas por mujeres, CEMUSA - Universidad de Salamanca -</a></li>
	<li><a href="http://www.fmac.org/fd-cdoc&lng=cat">Fundaci&oacute;n Mar&iacute;a Aurelia Capmany. Fondo documental</a></li>
	<li><a href="http://www20.gencat.cat/portal/site/icdones/menuitem.c531d9eb4c45208539a72641b0c0e1a0/&#63;vgnextoid=0c7754f598c9b110VgnVCM1000000b0c1e0aRCRD&vgnextchannel=0c7754f598c9b110VgnVCM1000000b0c1e0aRCRD&vgnextfmt=default">Institut Catal&agrave; de les Dones. Centre de Documentaci&oacute; / Instituto Catal&aacute;n de las Mujeres. Centro de Documentaci&oacute;n</a></li>
	<li><a href="http://www.ugr.es/~iem/biblioteca.php">Instituto de Estudios de la Mujer (Universidad de Granada). Bliblioteca</a></li>
	<li><a href="http://www.inmujer.migualdad.es/mujer/publicaciones/catalogo/index.htm">Instituto de la Mujer. Cat&aacute;logo de publicaciones</a></li>
	<li><a href="http://www.inmujer.migualdad.es/mujer/servicios/centro_documentacion/cendoc.htm">Instituto de la Mujer. Centro de documentaci&oacute;n</a></li>
	<li><a href="http://www.institutomujer-clm.com/">Instituto de la Mujer de Castilla-La Mancha. Centro de Documentaci&oacute;oacute;n</a></li>
	<li><a href="http://www.iuem2010.com/biblioteca-iuem-coleccion/">Instituto Universitario de Estudios de la Mujer (Universidad Aut&oacute;noma de Madrid). Biblioteca/Colecci&oacute;n</a></li>
	<li><a href="http://wzar.unizar.es/siem/biblio.html">Seminario Interdisciplinar de Estudios de la Mujer (Universidad de Zaragoza). Biblioteca</a></li>
	<li><a href="http://www.mujeresenred.net/">Mujeres en Red</a></li>
	<li><a href="http://wikimujeres.net/">WIKIMUJERES</a></li>
</ol>
	',	'Intercambia'),
(33,	'Portales Tem&aacute;ticos e iniciativas coeducativas en l&iacute;nea',	'
<ol>
	<li><a href="http://www.ciudaddemujeres.com/articulos/-Coeducacion-">CIUDAD DE MUJERES, art&iacute;culos sobre Coeducaci&oacute;n</a></li>
	<li><a href="http://educalab.es/blogs/cniie/">CNIIE (Centro Nacional de Innovaci&oacute;n e Investigaci&oacute;n Educativa), blog</a></li>
	<li><a href="https://www.educacion.gob.es/creade/index.do">CREADE. Centro de Recursos para la Atenci&oacute;n a la Diversidad Cultural en Educaci&oacute;n.</a></li>
	<li><a href="http://comunicarteenigualdad.blogspot.com.es/">COMUNICARTE EN IGUALDAD</a></li>
	<li><a href="http://www.pacodamas.com/asp/espectaculos_igualdad.asp">CONCIERTOS COEDUCATIVOS. PACO DAMAS</a></li>
	<li><a href="http://www.culturagalega.org/album/index.php">CONSELLO DA CULTURA GALEGA. COMISI&Oacute;N DE IGUALDADE. &Aacute;lbum de mulleres</a></li>
	<li><a href="http://web.educastur.princast.es/proyectos/coeduca/&#63;page_id=2">CONSEJER&Iacute;A DE EDUCACI&Oacute;N Y CIENCIA DEL PRINCIPADO DE ASTURIAS. Blog Espacio para educar en igualdad (Coeducaci&oacute;n)</a></li>
	<li><a href="http://www.e-conciliate.com/">E-CONC&Iacute;LIATE</a></li>
	<li><a href="http://www.educandoenigualdad.com/spip.php&#63;rubrique3">EDUCANDO EN IGUALDAD</a></li>
	<li><a href="http://www.educarenigualdad.org/">EDUCAR EN IGUALDAD</a></li>
	<li><a href="http://www.educacionenvalores.org/">EDUCACI&Oacute;N EN VALORES</a></li>
	<li><a href="http://www.educarueca.org/spip.php&#63;rubrique15">EDUCARUECA. Recursos sobre G&eacute;nero</a></li>
	<li><a href="http://www.escuelavirtualigualdad.es/index.php">ESCUELA VIRTUAL IGUALDAD. Instituto de la Mujer.</a></li>
	<li><a href="http://heterodoxia.wordpress.com/">HETERODOXIA. Comunidad de hombres por la igualdad</a></li>
	<li><a href="http://noviolenciamasculina.blogspot.com.es/">HOMBRES CONTRA LA VIOLENCIA MACHISTA</a></li>
	<li><a href="http://www.mua.ua.es/exposiciones.php&#63;lang=1&opc=3&id=252">MUA, Museo de la Universidad de Alicante: Mulier, Mulieris</a></li>
	<li><a href="http://www.muestracinemujereszgz.org/html/presentacion.html">MUESTRA INTERNACIONAL DE CINE REALIZADO POR MUJERES</a></li>
	<li><a href="http://www.mujerpalabra.net/clasesytalleres/clasesytalleres.htm">MUJER PALABRA. Recursos educativos</a></li>
	<li><a href="http://www.matriz.net/presentacion.htm">MUJER Y SALUD. Revista de comunicaci&oacute;n interactiva</a></li>
	<li><a href="http://www.mujeresenred.net/">MUJERES EN RED</a></li>
	<li><a href="http://www.pangea.org/dona/index.htm">PORTAL PANGEA. Secci&oacute;n G&eacute;nero</a></li>
	<li><a href="http://agendadelasmujeres.com.ar/index2.php&#63;id=7&canal=educacion">EL PORTAL DE LAS MUJERES ARGENTINAS, IBEROAMERICANAS Y DEL MERCOSUR. Recursos sobre G&eacute;nero y Educaci&oacute;n</a></li>
	<li><a href="http://www.redjovenes.es/index.php&#63;option=com_content&view=article&id=74&Itemid=11">REDJOVENES.ES. J&oacute;venes creando espacios por la igualdad de g&eacute;nero y la no violencia.</a></li>
	<li><a href="http://www.redunidadesdeigualdad.udl.cat/la-red/">RUIGEU. Red de Unidades de Igualdad G&eacute;nero para la Excelencia Universitaria</a></li>
	<li><a href="http://www.relaciona.org/">RELACIONA. Programas educativos.</a></li>
	<li><a href="http://www.educagenero.org/index.html">EDUCAG&Eacute;NERO.ORG</a></li>
	<li><a href="http://wrap.seigualdad.gob.es/recursos/search/SearchForm.action">Web de Recursos de Apoyo y Prevenci&oacute;n ante casos de violencia contra las mujeres y las ni&ntilde;as (WRAP)</a></li>
	<li><a href="http://wikimujeres.net/">WIKIMUJERES</a></li>
</ol>
	',	'Intercambia'),
(34,	'Servicios de informaci&oacute;n y asesoramiento',	'
<ol>
	<li><a href="http://www.msssi.gob.es/organizacion/ministerio/organizacion/SEssi/dgvgF.htm">Delegaci&oacute;n del Gonierno para la Violencia de G&eacute;nero</a></li>
	<li><a href="http://www.inmujer.es/servRecursos/servInformacion/home.htm">Servicio de Informaci&oacute;n y Asesoramiento del Instituto de la Mujer</a></li>
	<li><a href="http://www.cecomas.com/">Unidad Psicoasistencial para hombres en crisis y Plan NO+Maltrato para aquellos que ejercen violencia en la pareja</a></li>
	<li><a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/informacion-y-atencion-128">Instituto Andaluz de la Mujer. Informaci&oacute;n y Atenci&oacute;n</a></li>
	<li><a href="http://www.aragon.es/DepartamentosOrganismosPublicos/Organismos/InstitutoAragonesMujer/AreasTematicas/ch.ServiciosAsesorias.detalleDepartamento&#63;channelSelected=008089dc3e83b210VgnVCM100000450a15acRCRD">Instituto Aragon&eacute;s de la Mujer. Servicios y Asesor&iacute;as</a></li>
	<li><a href="http://institutoasturianodelamujer.com/iam/servicios-2/">Instituto Asturiano de la Mujer. Servicios especializados en igualdad de oportunidades</a></li>
	<li><a href="http://wrap.seigualdad.gob.es/recursos/search/SearchForm.action">Web de Recursos de Apoyo y Prevenci&oacute;n ante casos de violencia contra las mujeres y las ni&ntilde;as (WRAP)</a></li>
</ol>
	',	'Intercambia');

Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(24,25),(24,26),(24,29),(24,30),(24,31),(24,33),(24,34);

-- Añado las subpaginas a cada comunidad
Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(35, 'Portales',					'',	'Andaluc&iacute;a'),
(36, 'Planes y Proyectos',			'', 'Andaluc&iacute;a'),
(37, 'Legislaci&oacute;n',			'', 'Andaluc&iacute;a'),
(38, 'Estad&iacute;sticas',			'', 'Andaluc&iacute;a'),
(39, 'Experiencias',				'', 'Andaluc&iacute;a'),
(40, 'Premios y Convocatorias',		'', 'Andaluc&iacute;a');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(2,35),(2,36),(2,37),(2,38),(2,39),(2,40);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(41, 'Portales',					'',	'Murcia'),
(42, 'Planes y Proyectos',			'', 'Murcia'),
(43, 'Legislaci&oacute;n',			'', 'Murcia'),
(44, 'Estad&iacute;sticas',			'', 'Murcia'),
(45, 'Experiencias',				'', 'Murcia'),
(46, 'Premios y Convocatorias',		'', 'Murcia');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(3,41),(3,42),(3,43),(3,44),(3,45),(3,46);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(47, 'Portales',					'',	'Extremadura'),
(48, 'Planes y Proyectos',			'', 'Extremadura'),
(49, 'Legislaci&oacute;n',			'', 'Extremadura'),
(50, 'Estad&iacute;sticas',			'', 'Extremadura'),
(51, 'Experiencias',				'', 'Extremadura'),
(52, 'Premios y Convocatorias',		'', 'Extremadura');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(4,47),(4,48),(4,49),(4,50),(4,51),(4,52);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(53, 'Portales',					'',	'Castilla la Mancha'),
(54, 'Planes y Proyectos',			'', 'Castilla la Mancha'),
(55, 'Legislaci&oacute;n',			'', 'Castilla la Mancha'),
(56, 'Estad&iacute;sticas',			'', 'Castilla la Mancha'),
(57, 'Experiencias',				'', 'Castilla la Mancha'),
(58, 'Premios y Convocatorias',		'', 'Castilla la Mancha');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(5,53),(5,54),(5,55),(5,56),(5,57),(5,58);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(59, 'Portales',					'',	'Comunidad Valenciana'),
(60, 'Planes y Proyectos',			'', 'Comunidad Valenciana'),
(61, 'Legislaci&oacute;n',			'', 'Comunidad Valenciana'),
(62, 'Estad&iacute;sticas',			'', 'Comunidad Valenciana'),
(63, 'Experiencias',				'', 'Comunidad Valenciana'),
(64, 'Premios y Convocatorias',		'', 'Comunidad Valenciana');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(6,59),(6,60),(6,61),(6,62),(6,63),(6,64);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(65, 'Portales',					'',	'Madrid'),
(66, 'Planes y Proyectos',			'', 'Madrid'),
(67, 'Legislaci&oacute;n',			'', 'Madrid'),
(68, 'Estad&iacute;sticas',			'', 'Madrid'),
(69, 'Experiencias',				'', 'Madrid'),
(70, 'Premios y Convocatorias',		'', 'Madrid');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(7,65),(7,66),(7,67),(7,68),(7,69),(7,70);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(71, 'Portales',					'',	'Castilla y Le&oacute;n'),
(72, 'Planes y Proyectos',			'', 'Castilla y Le&oacute;n'),
(73, 'Legislaci&oacute;n',			'', 'Castilla y Le&oacute;n'),
(74, 'Estad&iacute;sticas',			'', 'Castilla y Le&oacute;n'),
(75, 'Experiencias',				'', 'Castilla y Le&oacute;n'),
(76, 'Premios y Convocatorias',		'', 'Castilla y Le&oacute;n');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(8,71),(8,72),(8,73),(8,74),(8,75),(8,76);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(77, 'Portales',					'',	'Arag&oacute;n'),
(78, 'Planes y Proyectos',			'', 'Arag&oacute;n'),
(79, 'Legislaci&oacute;n',			'', 'Arag&oacute;n'),
(80, 'Estad&iacute;sticas',			'', 'Arag&oacute;n'),
(81, 'Experiencias',				'', 'Arag&oacute;n'),
(82, 'Premios y Convocatorias',		'', 'Arag&oacute;n');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(9,77),(9,78),(9,79),(9,80),(9,81),(9,82);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(83, 'Portales',					'',	'Catalu&ntilde;a'),
(84, 'Planes y Proyectos',			'', 'Catalu&ntilde;a'),
(85, 'Legislaci&oacute;n',			'', 'Catalu&ntilde;a'),
(86, 'Estad&iacute;sticas',			'', 'Catalu&ntilde;a'),
(87, 'Experiencias',				'', 'Catalu&ntilde;a'),
(88, 'Premios y Convocatorias',		'', 'Catalu&ntilde;a');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(10,83),(10,84),(10,85),(10,86),(10,87),(10,88);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(89, 'Portales',					'',	'La Rioja'),
(90, 'Planes y Proyectos',			'', 'La Rioja'),
(91, 'Legislaci&oacute;n',			'', 'La Rioja'),
(92, 'Estad&iacute;sticas',			'', 'La Rioja'),
(93, 'Experiencias',				'', 'La Rioja'),
(94, 'Premios y Convocatorias',		'', 'La Rioja');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(11,89),(11,90),(11,91),(11,92),(11,93),(11,94);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(95, 'Portales',					'',	'Navarra'),
(96, 'Planes y Proyectos',			'', 'Navarra'),
(97, 'Legislaci&oacute;n',			'', 'Navarra'),
(98, 'Estad&iacute;sticas',			'', 'Navarra'),
(99, 'Experiencias',				'', 'Navarra'),
(100, 'Premios y Convocatorias',		'', 'Navarra');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(12,95),(12,96),(12,97),(12,98),(12,99),(12,100);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(101, 'Portales',					'',	'Pa&iacute;s Vasco'),
(102, 'Planes y Proyectos',			'', 'Pa&iacute;s Vasco'),
(103, 'Legislaci&oacute;n',			'', 'Pa&iacute;s Vasco'),
(104, 'Estad&iacute;sticas',			'', 'Pa&iacute;s Vasco'),
(105, 'Experiencias',				'', 'Pa&iacute;s Vasco'),
(106, 'Premios y Convocatorias',		'', 'Pa&iacute;s Vasco');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(13,101),(13,102),(13,103),(13,104),(13,105),(13,106);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(107, 'Portales',					'',	'Cantabria'),
(108, 'Planes y Proyectos',			'', 'Cantabria'),
(109, 'Legislaci&oacute;n',			'', 'Cantabria'),
(110, 'Estad&iacute;sticas',			'', 'Cantabria'),
(111, 'Experiencias',				'', 'Cantabria'),
(112, 'Premios y Convocatorias',		'', 'Cantabria');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(14,107),(14,108),(14,109),(14,110),(14,111),(14,112);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(113, 'Portales',					'',	'Asturias'),
(114, 'Planes y Proyectos',			'', 'Asturias'),
(115, 'Legislaci&oacute;n',			'', 'Asturias'),
(116, 'Estad&iacute;sticas',			'', 'Asturias'),
(117, 'Experiencias',				'', 'Asturias'),
(118, 'Premios y Convocatorias',		'', 'Asturias');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(15,113),(15,114),(15,115),(15,116),(15,117),(15,118);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(119, 'Portales',					'',	'Galicia'),
(120, 'Planes y Proyectos',			'', 'Galicia'),
(121, 'Legislaci&oacute;n',			'', 'Galicia'),
(122, 'Estad&iacute;sticas',			'', 'Galicia'),
(123, 'Experiencias',				'', 'Galicia'),
(124, 'Premios y Convocatorias',		'', 'Galicia');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(16,119),(16,120),(16,121),(16,122),(16,123),(16,124);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(125, 'Portales',					'',	'Ceuta y Melilla'),
(126, 'Planes y Proyectos',			'', 'Ceuta y Melilla'),
(127, 'Legislaci&oacute;n',			'', 'Ceuta y Melilla'),
(128, 'Estad&iacute;sticas',			'', 'Ceuta y Melilla'),
(129, 'Experiencias',				'', 'Ceuta y Melilla'),
(130, 'Premios y Convocatorias',		'', 'Ceuta y Melilla');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(17,125),(17,126),(17,127),(17,128),(17,129),(17,130);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(131, 'Portales',					'',	'Islas Baleares'),
(132, 'Planes y Proyectos',			'', 'Islas Baleares'),
(133, 'Legislaci&oacute;n',			'', 'Islas Baleares'),
(134, 'Estad&iacute;sticas',			'', 'Islas Baleares'),
(135, 'Experiencias',				'', 'Islas Baleares'),
(136, 'Premios y Convocatorias',		'', 'Islas Baleares');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(18,131),(18,132),(18,133),(18,134),(18,135),(18,136);

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(137, 'Portales',					'',	'Canarias'),
(138, 'Planes y Proyectos',			'', 'Canarias'),
(139, 'Legislaci&oacute;n',			'', 'Canarias'),
(140, 'Estad&iacute;sticas',			'', 'Canarias'),
(141, 'Experiencias',				'', 'Canarias'),
(142, 'Premios y Convocatorias',		'', 'Canarias');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(19,137),(19,138),(19,139),(19,140),(19,141),(19,142);


-- La pagina de presentacion
Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA, TIPO) values
(143,	'Presentaci&oacute;n',	'
<a href="wp-content/uploads/oldIntercambia/portada.png"><img class=" size-medium wp-image-10 alignright" src="wp-content/uploads/oldIntercambia/portada.png" alt="portada" width="300" height="273" /></a>
INTERCAMBIA. Educar en femenino y en masculino, es un espacio virtual para compartir experiencias que reconocen los intereses, conocimientos y motivaciones de ni&ntilde;as, ni&ntilde;os, hombres y mujeres en la educaci&oacute;n. Est&aacute; creado para facilitar el acceso y el intercambio de informaci&oacute;n y conocimiento sobre pr&aacute;cticas educativas que incluyen los saberes femeninos y masculinos.
<br/>
Surge de una iniciativa del Ministerio de Educaci&oacute;n, Cultura y Deporte a trav&eacute;s del CNiiE (Centro Nacional de Innovaci&oacute;n e Investigaci&oacute;n Educativa) y del Ministerio de Sanidad, Servicios Sociales e Igualdad a trav&eacute;s del Instituto de la Mujer, en colaboraci&oacute;n con los Organismos de Igualdad y las Administraciones Educativas de las Comunidades Aut&oacute;nomas. Cuenta con el apoyo del Fondo Social Europeo.
<br/>
El portal Intercambia est&aacute; concebido como un centro virtual de recursos tem&aacute;ticos que permite difundir y acceder a aportaciones valiosas en el &aacute;mbito coeducativo.
	',	'Intercambia', 'page');



