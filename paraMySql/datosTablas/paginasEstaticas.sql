Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA, TIPO) values
(1,	'Comunidades Aut&oacute;nomas',	'',	'Comunidades Aut&oacute;nomas', 'page');

Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(2,	'Andaluc&iacute;a',			'', 'Comunidades Aut&oacute;nomas,Andaluc&iacute;a'),
(3, 'Murcia',					'', 'Comunidades Aut&oacute;nomas,Murcia'),
(4, 'Extremadura',				'', 'Comunidades Aut&oacute;nomas,Extremadura'),
(5, 'Castilla la Mancha',		'', 'Comunidades Aut&oacute;nomas,Castilla la Mancha'),
(6, 'Comunidad Valenciana',		'', 'Comunidades Aut&oacute;nomas,Comunidad Valenciana'),
(7, 'Madrid',					'', 'Comunidades Aut&oacute;nomas,Madrid'),
(8, 'Castilla y Le&oacute;n',	'', 'Comunidades Aut&oacute;nomas,Castilla y Le&oacute;n'),
(9, 'Arag&oacute;n',			'', 'Comunidades Aut&oacute;nomas,Arag&oacute;n'),
(10, 'Catalu&ntilde;a',			'', 'Comunidades Aut&oacute;nomas,Catalu&ntilde;a'),
(11, 'La Rioja',				'', 'Comunidades Aut&oacute;nomas,La Rioja'),
(12, 'Navarra',					'', 'Comunidades Aut&oacute;nomas,Navarra'),
(13, 'Pa&iacute;s Vasco',		'', 'Comunidades Aut&oacute;nomas,Pa&iacute;s Vasco'),
(14, 'Cantabria',				'', 'Comunidades Aut&oacute;nomas,Cantabria'),
(15, 'Asturias',				'', 'Comunidades Aut&oacute;nomas,Asturias'),
(16, 'Galicia',					'', 'Comunidades Aut&oacute;nomas,Galicia'),
(17, 'Ceuta y Melilla',			'', 'Comunidades Aut&oacute;nomas,Ceuta y Melilla'),
(18, 'Islas Baleares',			'', 'Comunidades Aut&oacute;nomas,Islas Baleares'),
(19, 'Canarias',				'', 'Comunidades Aut&oacute;nomas,Canarias');

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



Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA, TIPO) values
(144, 'Estad&iacute;sticas', '
<h2>&iquest;Qu&eacute; es&#63;</h2>
Esta secci&oacute;n ofrece una selecci&oacute;n de fuentes estad&iacute;sticas en materia coeducativa y de igualdad de oportunidades en cuatro &aacute;mbitos: internacional, europeo, estatal y auton&oacute;mico. Adem&aacute;s aparecen documentos de inter&eacute;s descargables en formato pdf.
	',	'Estad&iacute;sticas', 'page'),

(145, '&Aacute;mbito Internacional', '
<ul>
	<li><a href="http://www.uis.unesco.org/Education/Pages/gender-education.aspx">UNESCO: Publicaciones sobre g&eacute;nero y educaci&oacute;n.</a> Incluye el <a href="http://www.unesco.org/new/en/education/themes/leading-the-international-agenda/gender-and-education/resources/the-world-atlas-of-gender-equality-in-education/">Atlas sobre la Igualdad de G&eacute;nero en la Educaci&oacute;n</a>, informe sobre la situaci&oacute;n educativa de mujeres y hombres a lo largo de todo el mundo, con datos, cifras, gr&aacute;ficos, mapas y an&aacute;lisis en relaci&oacute;n al acceso y permanencia en los diferentes niveles educativos. Asimismo, ofrece <a href="http://www.uis.unesco.org/Education/Pages/unesco-e-atlas-launch.aspx">publicaciones sobre la investigaci&oacute;n y el desarrollo experimental, las ni&ntilde;as y ni&ntilde;os sin escolarizar y el profesorado en el mundo</a> (algunas de ellas en espa&ntilde;ol).</li>
	<li><a href="http://stats.uis.unesco.org/unesco/TableViewer/document.aspx&#63;ReportId=198">UNESCO: Institute for Statistics. Informaci&oacute;n estad&iacute;stica</a> relacionada con la educaci&oacute;n (entre otros aspectos), por pa&iacute;ses.</li>
	<li><a href="http://www.uis.unesco.org/Education/Pages/global-education-digestSP.aspx">UNESCO, Instituto de Estad&iacute;stica: Compendio Mundial de la educaci&oacute;n</a>. Dedica especial atenci&oacute;n al abandono escolar. El informe incluye una <a href="http://www.uis.unesco.org/Education/Pages/ged-2012-visualizationSP.aspx">herramienta interactiva</a> online que permite visualizar las tasas de repetici&oacute;n y abandono, por grado, en la regi&oacute;n y en el pa&iacute;s seleccionado.</li>
	<li><a href="http://www.unesco.org/new/es/education/themes/leading-the-international-agenda/efareport/reports/">UNESCO: Educaci&oacute;n para Todos</a>. Informes de seguimiento sobre la situaci&oacute;n mundial de la infancia en relaci&oacute;n a la educaci&oacute;n.</li>
	<li><a href="http://www.uis.unesco.org/Education/Pages/mind-the-gap.aspx&#63;SPSLanguage=EN">UNESCO: Mind the Gap</a>. Juego interactivo con datos sobre mujeres y hombres, ni&ntilde;os y ni&ntilde;as en relaci&oacute;n a la educaci&oacute;n a lo largo de todo el mundo. En ingl&eacute;s, franc&eacute;s y espa&ntilde;ol.</li>
	<li><a href="http://www.un.org/womenwatch/directory/statistics_and_indicators_60.htm">ONU:&nbsp;Women Watch. Directorio de recursos sobre mujeres y g&eacute;nero. Estad&iacute;sticas e indicadores</a>. Informes, bases de datos y documentos. Dedica especial atenci&oacute;n a informes y enlaces con datos sobre la educaci&oacute;n y las ciencias. Ofrece tambi&eacute;n <a href="http://www.un.org/womenwatch/">Informaci&oacute;n y Recursos</a> relacionados con el empoderamiento de las mujeres y la igualdad relativa al g&eacute;nero.</li>
	<li><a href="http://unstats.un.org/unsd/demographic/products/indwm/default.htm">ONU:&nbsp;Estad&iacute;sticas e indicadores sobre mujeres y hombres </a>(en ingl&eacute;s). Incluye un apartado dedicado a la educaci&oacute;n.</li>
	<li><a href="http://unstats.un.org/unsd/demographic/products/Worldswomen/WWreports.htm">ONU: The World&apos;s Women Reports</a>. Informes sobre la situaci&oacute;n de las mujeres en el mundo desarrollados desde 1990.</li>
	<li><a href="http://unstats.un.org/unsd/demographic/sconcerns/default.htm">ONU, Estad&iacute;sticas: Aspectos demogr&aacute;ficos y sociales</a> (en ingl&eacute;s). Incluye datos desagregados por sexo sobre demograf&iacute;a, educaci&oacute;n, violencia contra las mujeres, usos del tiempo, salud y bienestar, econom&iacute;a, pobreza y seguridad en el mundo. </li>
	<li><a href="http://www.oecd.org/gender/data/">OCDE (Organizaci&oacute;n para la Cooperaci&oacute;n y el Desarrollo Econ&oacute;mico): Igualdad de G&eacute;nero</a> (en ingl&eacute;s). Estad&iacute;sticas sobre educaci&oacute;n, empleo y&nbsp; emprendimiento. Incluye <a href="http://www.oecd.org/gender/data/indicatorsofgenderequalityineducation.htm">Datos sobre Igualdad de g&eacute;nero en la Educaci&oacute;n</a>, as&iacute; como la herramienta <a href="http://www.oecd.org/els/soc/OECD2012%#37;20-%#37;20Gender%#37;20Initiative%#37;20-%#37;20Data%#37;20browser%#37;20-%#37;20v3.3.xls">Gender Data Browser</a>, que permite ver comparativas entre pa&iacute;ses.</li>
	<li><a href="http://www.oecd.org/edu/research/database.htm">OCDE: Base de datos sobre educaci&oacute;n</a>, con algunos datos desagregados por sexo y edad&nbsp; (en ingl&eacute;s).</li>
	<li><a href="http://estadisticas.cepal.org/cepalstat/WEB_CEPALSTAT/estadisticasIndicadores.asp&#63;idioma=e">CEPALSTAT (Comisi&oacute;n Econ&oacute;mica para Am&eacute;rica Latina y El Caribe): Base de Datos y Publicaciones Estad&iacute;sticas</a>. En el apartado sobre G&eacute;nero, figura un subapartado dedicado a la Educaci&oacute;n, con datos desagregados por sexo. Asimismo, podemos acceder a informaci&oacute;n sobre las relaciones entre mujeres y hombres y la situaci&oacute;n de &eacute;stas por pa&iacute;ses en la secci&oacute;n G&eacute;nero de <a href="http://estadisticas.cepal.org/cepalstat/WEB_CEPALSTAT/perfilesNacionales.asp&#63;idioma=e ">Perfiles nacionales</a>.</li>
	<li><a href="http://interwp.cepal.org/sisgen/ConsultaIntegrada.asp&#63;idAplicacion=11&amp;idioma=e">CEPALSTAT: Estad&iacute;sticas de g&eacute;nero</a>. Datos y cifras de Am&eacute;rica Latina y el Caribe. Se incluye un apartado dedicado a la Educaci&oacute;n y capacitaci&oacute;n de las mujeres.</li>
	<li><a href="http://www.cepal.org/oig/">CEPAL:&nbsp;Observatorio de Igualdad de G&eacute;nero</a>. Incluye indicadores de igualdad en los diferentes pa&iacute;ses de Am&eacute;rica Latina, el Caribe y la Pen&iacute;nsula Ib&eacute;rica. Del mismo modo, permite acceder a <a href="http://www.cepal.org/cgi-bin/getProd.asp&#63;xml=/oig/agrupadores_xml/aes854.xml&amp;xsl=/oig/agrupadores_xml/agrupa_listado.xsl&amp;base=/oig/tpl/top-bottom.xsl, informes y esdudios">informes y estudios</a>, informaci&oacute;n sobre <a href="http://www.cepal.org/cgi-bin/getProd.asp&#63;xml=/oig/agrupadores_xml/aes779.xml&amp;xsl=/oig/agrupadores_xml/agrupa_listado.xsl&amp;base=/oig/tpl/top-bottom.xsl">Pol&iacute;ticas justas</a> y <a href="http://www.cepal.org/cgi-bin/getprod.asp&#63;xml=/oig/noticias/paginas/8/34018/P34018.xml&amp;xsl=/oig/tpl/p18f.xsl&amp;base=/oig/tpl/top-bottom.xslt">enlaces</a> a los Observatorios de Igualdad de los pa&iacute;ses que conforman la CEPAL.</li>
	<li><a href="http://www.unicef.org/spanish/sowc/">UNICEF: Estado mundial de la infancia</a>: incluye datos desagregados por sexo y algunas estad&iacute;sticas sobre la situaci&oacute;n de la infancia y la adolescencia en el mundo, incluyendo informaci&oacute;n sobre educaci&oacute;n, salud, violencia, trabajo infantil, matrimonio en la adolescencia, salud sexual y reproductiva, mutilaci&oacute;n genital femenina, pobreza, migraciones, cambio clim&aacute;tico y tecnolog&iacute;a. El <a href="http://www.unicef.org/spanish/sowc2013/">Informe 2013</a> est&aacute; especialmente dedicado a la infancia con discapacidad.    </li>
	<li><a href="http://www.un.org/womenwatch/feature/ruralwomen/documents/Es-Rural-Women-MDGs-web.pdf">Women Watch: La mujer rural y los Objetivos de Desarrollo del Milenio</a>, con datos&nbsp; sobre educaci&oacute;n, pobreza, trabajo y codiciones de vida de hombres y mujeres en entornos rurales y urbanos.</li>
	<li><a href="http://www.oecd.org/pisa/pisaproducts/">OCDE: Informes PISA</a>&nbsp;en varios idiomas del Programme for International Student Assessment&nbsp; (Programa para la Evaluaci&oacute;n Internacional del Alumnado). Dichos estudios indagan en cuestiones relativas a la educaci&oacute;n en los diferentes pa&iacute;ses de la OCDE, especialmente los referidos a la competencia lectora, matem&aacute;tica y cient&iacute;fica de chicas y chicos. Incluye la secci&oacute;n <a href="http://www.oecd.org/pisa/pisaenespaol.htm">Pisa en espa&ntilde;ol</a>.</li>
	<li><a href="http://www.ungei.org/infobycountry/index.html">UNGEI (United Nations Gilrs'''' Education Iniciative)</a>:&nbsp; situaci&oacute;n de chicas y chicos en relaci&oacute;n con la educaci&oacute;n en diferentes pa&iacute;ses, con especial atenci&oacute;n a &eacute;stas. La informaci&oacute;n aparece agrupada por pa&iacute;ses, si bien en la secci&oacute;n <a href="http://www.ungei.org/resources/index_2459.html">Resources</a> permite acceder tambi&eacute;n a informes por fechas.</li>
	<li><a href="http://www.icrw.org/publications&#63;title=&amp;text=education&amp;author=&amp;region=All&amp;subject=All&amp;type=All&amp;year[value][date]=">International Center for Research on Women (ICRW)</a>: incluye informes sobre la educaci&oacute;n de las mujeres y las ni&ntilde;as en diferentes pa&iacute;ses del mundo.</li>
	<li><a href="http://www.popcouncil.org/espanol.asp">Population Council</a>: dedica un apartado a <a href="http://www.popcouncil.org/research/gender-and-education">Educaci&oacute;n y G&eacute;nero</a>, con estudios como <a href="http://www.popcouncil.org/pdfs/TABriefs/24_GirlsSchooling_es.pdf">La educaci&oacute;n de las ni&ntilde;as en pa&iacute;ses en desarrollo</a>, o el informe sobre la educaci&oacute;n de las chicas adolescentes (en ingl&eacute;s) <a href="http://www.popcouncil.org/pdfs/2009PGY_NewLessons.pdf">The Power of Educating Adolescent Girls. A Girls Count Report On Adolescent Girls</a>.</li>
	<li><a href="http://www.genderste.eu/i_research03.html">GenderSTE - Science, Technology, Environment</a>. Red internacional comprometida con una representaci&oacute;n justa de las mujeres y la integraci&oacute;n de la perspectiva de g&eacute;nero en el an&aacute;lisis y la investigaci&oacute;n cient&iacute;fica. </li>
	<li><a href="http://www.unece.org/stats/gender.html">UNECE (United Nations Economic Commission for Europe): Estad&iacute;sticas de g&eacute;nero</a> en Europa y Norteam&eacute;rica.</li>
	<li><a href="http://www.unescap.org/our-work/statistics/gender-statistics/about">UNESCAP (United Nations Economic and Social Commission for Asia and the Pacific): Estad&iacute;sticas de g&eacute;nero</a>. Informaci&oacute;n sobre la situaci&oacute;n de mujeres y hombres en Asia y El Pac&iacute;fico.</li>
	<li><a href="http://www.escwa.un.org/divisions/teams.asp&#63;teams=Social%#37;20Statistics&amp;division=sd">ESCWA (Economic and Social Commission for Western Asia): Estad&iacute;sticas sociales en Asia Oriental</a></li>
	<li><a href="http://www.escwa.un.org/gsp/index.html">ESCWA: Estad&iacute;sticas de g&eacute;nero en pa&iacute;ses &aacute;rabes</a></li>
	<li><a href="http://www.stat.auckland.ac.nz/~iase/publications.php">IASE:&nbsp;Asociaci&oacute;n Internacional de Estad&iacute;sticas de Educaci&oacute;n</a>. Secci&oacute;n del Instituto Internacional de Estad&iacute;stica&nbsp;dedicado a educaci&oacute;n. Publica documentos descargables sobre diferentes tem&aacute;ticas educativas a nivel mundial.</li>
	<li><a href="http://www.unwomen.org/es/digital-library/publications">ONU Mujeres: Equidad de g&eacute;nero y mujeres</a>. Incluye diversas publicaciones, como los &uacute;ltimos <a href="http://www.unwomen.org/es/digital-library/annual-report">informes sobre la situaci&oacute;n de las mujeres en el mundo </a>o el estudio <a href="http://www.unwomen.org/es/digital-library/publications/2007/12/women2000-and-beyond-women-gender-equality-and-sport ">Mujer, igualdad de g&eacute;neros y deporte.    </a></li>
	<li><a href="http://plan-espana.org/que-hacemos/campana-ong/por-ser-ninas/informes">PLAN (Paremos la Pobreza Infantil): Informes sobre la situaci&oacute;n de las ni&ntilde;as en el mundo. </a></li>
	<li><a href="http://www.paremoslapobrezainfantil.org/pdf/aprender_sin_miedo.pdf">PLAN (Paremos la Pobreza Infantil): Aprender sin miedo</a>. Campa&ntilde;a mundial para terminar con la violencia en las escuelas. Informe sobre la situaci&oacute;n de la infancia en diversos pa&iacute;ses del mundo en relaci&oacute;n a la educaci&oacute;n y la violencia en el &aacute;mbito escolar.</li>
	<li><a href="http://www.womenssportsfoundation.org/en/home/research">Women''s Sports Foundation</a>. Informaci&oacute;n sobre la participaci&oacute;n de las mujeres en los deportes, la relaci&oacute;n entre <a href="http://www.womenssportsfoundation.org/home/research/articles-and-reports/mental-and-physical-health">salud y actividad f&iacute;sica</a> y aspectos relacionados con la falta de equidad en este &aacute;mbito, incluyendo el <a href="http://www.womenssportsfoundation.org/home/research/articles-and-reports/equity-issues/pay-inequity">apoyo econ&oacute;mico y los salarios</a> en las carreras deportivas femeninas.     &nbsp;</li>
	<li><a href="http://hdr.undp.org/en/reports">PNUD: Informes de Desarrollo Humano</a>. Buscador que permite localizar informes, clasificados por pa&iacute;ses y a&ntilde;os. Incluye el&nbsp;<a href="http://hdr.undp.org/es/content/informe-sobre-desarrollo-humano-2013">Informe de Desarrollo humano 2013&nbsp;</a>(disponible en castellano).</li>
	<li><a href="http://hdr.undp.org/es/data">PNUD: Indicadores de desarrollo humano</a>. Incluye datos sobre cuestiones relacionadas con la educaci&oacute;n, el g&eacute;nero y la desigualdad en diferentes pa&iacute;ses del mundo.&nbsp;Ofrece asimismo&nbsp;<a href="http://hdr.undp.org/en/countries">gr&aacute;ficos e informaci&oacute;n estad&iacute;stica clasificada por pa&iacute;ses</a>.</li>
	<li><a href="http://genderindex.org/">OECD: SIGI, &Iacute;ndice de G&eacute;nero e Instituciones Sociales</a> (en ingl&eacute;s). Analiza las  instituciones sociales, como el matrimonio precoz, las pr&aacute;cticas discriminatorias de herencia, la violencia contra la mujer, la preferencia por los hijos frente a las hijas (en ingl&eacute;s, son bias), el acceso restringido a los espacios p&uacute;blicos y el acceso restringido a la tierra y al cr&eacute;dito. Ofrece <a href="http://genderindex.org/countries">informaci&oacute;n por pa&iacute;ses</a>, as&iacute; como un <a href="http://genderindex.org/ranking">un ranking e informes</a>&nbsp;.    </li>
	<li><a href="http://www.socialwatch.org/es/indicators">Social Watch: &Iacute;ndice de Equidad de G&eacute;nero</a>. Mide la brecha entre hombres y mujeres en educaci&oacute;n, actividad econ&oacute;mica y empoderamiento pol&iacute;tico. Incluye <a href="http://www.socialwatch.org/es/node/14385">gr&aacute;ficos que permiten comparar estos &iacute;tems por pa&iacute;ses</a>.</li>
	<li><a href="http://progress.unwomen.org/indice-de-estadisticas/&#63;lang=es">ONU Mujeres:&nbsp;El Progreso de las Mujeres en el mundo. Estad&iacute;sticas</a> relacionadas con los derechos de las mujeres.</li>
	<li><a href="http://www.who.int/gender/es/index.html">OMS: Informes y datos sobre la salud de las mujeres</a> en el mundo.</li>
	<li><a href="http://www.who.int/mediacentre/factsheets/fs239/es/index.html">ORGANIZACI&Oacute;N MUNDIAL DE LA SALUD: violencia sexista</a>. Datos y cifras internacionales sobre la violencia contra las mujeres en el seno de la pareja, as&iacute; como sobre violencia sexual.</li>
	<li><a href="http://www.amnesty.org/es/annual-report/2012/country-data">Amnist&iacute;a Internacional: datos de cada pa&iacute;s</a> en relaci&oacute;n con los derechos humanos, entre los que se encuentra el derecho a la educaci&oacute;n.</li>
	<li><a href="http://www.ilo.org/global/topics/equality-and-discrimination/gender-equality/lang--en/index.htm">OIT (Organizaci&oacute;n Mundial del Trabajo): Equidad de g&eacute;nero</a>. Estad&iacute;sticas e informes relacionados con el mundo laboral.</li>
	<li><a href="http://www.who.int/topics/gender/es/">OMS: G&eacute;nero</a>. Informaci&oacute;n sobre salud en relaci&oacute;n a cuestiones que tienen que ver con las desigualdades por motivos de g&eacute;nero, entre ellas, las relacionadas con la inclusi&oacute;n de las mujeres en las estad&iacute;sticas de salud (frente a su invisibilizaci&oacute;n y consiguiente discriminaci&oacute;n). Incluye informes como <a href="http://www.who.int/gender/es/">G&eacute;nero y salud de la mujer</a>.</li>
</ul>
	',	'Estad&iacute;sticas'),

(146, '&Aacute;mbito Europeo', '
<ul>
	<li><a href="http://epp.eurostat.ec.europa.eu/portal/page/portal/education/data/database">EUROSTAT: Estad&iacute;sticas sobre Educaci&oacute;n.</a> La agencia europea de estad&iacute;stica ofrece, entre otras cuestiones, datos sobre los niveles educativos, caracter&iacute;sticas del alumnado, el aprendizaje a lo largo de la vida y otros temas relacionados con la educaci&oacute;n y el empleo.</li>
	<li><a href="http://ec.europa.eu/justice/gender-equality/index_es.htm">EUROSTAT: Igualdad de G&eacute;nero</a>. Incluye estad&iacute;sticas relacionadas con la situaci&oacute;n de las mujeres en Europa y las desigualdades que a&uacute;n persisten en diferentes &aacute;mbitos.</li>
	<li><a href="http://www.mecd.gob.es/redie-eurydice/Investigacion-comparada/Sistemas-Educativos-Europeos.html">EURYDICE: Sistemas educativos europeos</a>. Estudio de los sistemas educativos de los pa&iacute;ses miembros de la red con el objetivo de apoyar la toma de decisiones y ofrecer informaci&oacute;n a toda la comunidad educativa. Incluye <a href="http://www.mecd.gob.es/redie-eurydice/Investigacion-comparada/Sistemas-Educativos-Europeos/Cifras-clave-de-la-educacion-europea.html">Cifras clave de la educaci&oacute;n</a>, con informaci&oacute;n sobre la organizaci&oacute;n, la participaci&oacute;n, el profesorado y personal de gesti&oacute;n, los procesos educativos y los niveles de cualificaci&oacute;n y transici&oacute;n al empleo. Asimismo, ofrece monogr&aacute;ficos como los <a href="http://www.mecd.gob.es/redie-eurydice/Investigacion-comparada/Sistemas-Educativos-Europeos/Estudios-europeos-comparados.html">Estudios Europeos Comparados</a>.</li>
	<li><a href="http://www.ine.es/serv/estadist.htm#europa">INE: Estad&iacute;sticas por pa&iacute;ses. </a>&nbsp;Enlaces a las oficinas de estad&iacute;stica de los pa&iacute;ses europeos.</li>
	<li><a href="http://ec.europa.eu/education/more-information/reports-and-studies_en.htm">COMISI&Oacute;N EUROPEA: Informes y estudios</a> sobre educaci&oacute;n y formaci&oacute;n. Incluye un buscador que permite encontrar documentos por temas y a&ntilde;os en los que se ha publicado.</li>
	<li><a href="http://eacea.ec.europa.eu/education/eurydice/key_data_en.php">EACEA (Education, Audiovisual and Culture Executive Agency Service): Key Data Series</a>. Estad&iacute;sticas, datos e indicadores sobre educaci&oacute;n en 36 pa&iacute;ses europeos, con informaci&oacute;n sobre la situaci&oacute;n de mujeres, hombres, chicos y chicas en el sistema educativo y las pol&iacute;ticas europeas. Incluye informes en distintos idiomas (entre ellos, el espa&ntilde;ol).</li>
	<li><a href="http://w3.unece.org/pxweb/database/STAT/30-GE/04-EducatAndcommunicat/&#63;lang=1">UNECE (United Nations Economic Comission for Europe)</a>: ofrece estad&iacute;sticas europeas sobre alumnado y profesorado desagregadas por sexo.</li>
	<li><a href="http://europa.eu/about-eu/facts-figures/living/index_es.htm">UNI&Oacute;N EUROPEA: Estad&iacute;sticas y encuestas sobre la vida en la Uni&oacute;n Europea</a>. Incluye algunos datos relacionados con la educaci&oacute;n, como el gasto p&uacute;blico que dedican diferentes pa&iacute;ses y el n&uacute;mero de estudiantes que cursan estudios en otro pa&iacute;s de la UE.</li>
	<li><a href="https://crell.jrc.ec.europa.eu/&#63;q=publications/year">CRELL - Centre for Research on Lifelong Training</a>: estad&iacute;sticas y publicaciones relacionadas con la educaci&oacute;n a lo largo de la vida.</li>
	<li><a href="http://epp.eurostat.ec.europa.eu/portal/page/portal/product_details/publication&#63;p_product_code=KS-SF-11-054">EUROSTAT: Tendencias en la educaci&oacute;n europea durante la &uacute;ltima d&eacute;cada</a> (en ingl&eacute;s). Informaci&oacute;n comparativa entre pa&iacute;ses europeos sobre las tendencias que se han dado entre 2005 y 2009 desde las primeras etapas de la educaci&oacute;n reglada hasta la edad adulta.</li>
	<li><a href="http://epp.eurostat.ec.europa.eu/portal/page/portal/culture/introduction">EUROSTAT: Estad&iacute;sticas relacionadas con la cultura en Europa</a>.&nbsp; Ofrece informaci&oacute;n sobre las empresas de los sectores culturales, empleo y ocupaciones en dichos sectores, el comercio exterior de bienes culturales, la participaci&oacute;n cultural y otras estad&iacute;sticas culturales.</li>
	<li><a href="http://www.cros-portal.eu/content/essnet-culture-final-report">ESSNET-Culture. European Statistical System Network on Culture. Informe</a> sobre la cultura en diferentes pa&iacute;ses europeos:&nbsp;gasto p&uacute;blico, actividades culturales, pr&aacute;cticas culturales y aspectos sociales de la cultura, industria de la cultura y desarrollos espec&iacute;ficos.</li>
	<li><a href="http://ec.europa.eu/sport/library/index_en.htm">SPORT, Supporting fair play and cooperation in sport. European Commission</a>. Estudios y propuestas relacionadas con la actividad f&iacute;sica y el deporte, con informaci&oacute;n desagregada por sexo. Incluye el informe <a href="http://bookshop.europa.eu/en/sport-and-physical-activity-pbNC0214406/">Sport and phisical activity</a>, que analiza la relaci&oacute;n de las mujeres y los hombres europeos con la actividad f&iacute;sica y el deporte, por pa&iacute;ses.</li>
	<li><a href="http://bookshop.europa.eu/es/information-education-culture-sport-cbljAKABstfuoAAAEjQZEY4e5L/">COMISI&Oacute;N EUROPEA - EU Bookshop: Informes sobre Educaci&oacute;n, cultura y deportes</a>.&nbsp; Permite buscar informes seleccionando la lengua, el tema y la autor&iacute;a.</li>
	<li><a href="http://ec.europa.eu/research/science-society/index.cfm&#63;fuseaction=public.topic&amp;id=1363">COMISI&Oacute;N EUROPEA: Investigaci&oacute;n e innovaci&oacute;n con perspectiva de g&eacute;nero</a>. Incluye herramientas para que se tenga en cuenta a mujeres y hombres en la investigaci&oacute;n (frente a la perspectiva androc&eacute;ntrica).</li>
</ul>	
	',	'Estad&iacute;sticas'),

(147, '&Aacute;mbito Estatal', '
<ul>
	<li><a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/estadisticas.html">MINISTERIO DE EDUCACI&Oacute;N, CULTURA Y DEPORTE.&nbsp; Estad&iacute;sticas sobre Educaci&oacute;n</a>. Incluye informaci&oacute;n sobre ense&ntilde;anzas no universitarias y universitarias, recursos econ&oacute;micos destinados a la educaci&oacute;n, relaci&oacute;n del sistema educativo con el exterior, formaci&oacute;n y mercado laboral e indicadores y publicaciones de s&iacute;ntesis.</li>
	<li><a href="http://www.inmujer.gob.es/estadisticas/consulta.do&#63;area=3">INSTITUTO DE LA MUJER: Estad&iacute;sticas sobre educaci&oacute;n</a>. Datos desagregados por sexo sobre alumnado universitario y no universitario (nivel de estudios, ramas, &aacute;reas del conocimiento, tipos de estudios, tesis doctorales, Erasmus) y el personal docente e investigador (seg&uacute;n categor&iacute;a, r&eacute;gimen de dedicaci&oacute;n, edad, participaci&oacute;n en el rectorado, nivel educativo).</li>
	<li><a href="http://www.ine.es/inebmenu/mnu_educa.htm">INSTITUTO NACIONAL DE ESTAD&Iacute;STICA (INE): Educaci&oacute;n</a>. Ofrece una amplia variedad de datos estad&iacute;sticos sobre ense&ntilde;anza universitaria y no-universitaria, gasto p&uacute;blico y privado en educaci&oacute;n, nivel educativo y participaci&oacute;n de la poblaci&oacute;n en actividades de aprendizaje, transici&oacute;n de la educaci&oacute;n al mercado laboral, TICs y becas y ayudas al estudio.</li>
	<li><a href="http://www.ine.es/ss/Satellite&#63;L=es_ES&amp;c=INEPublicacion_C&amp;cid=1259924822888&amp;p=1254735110672&amp;pagename=ProductosYServicios%#37;2FPYSLayout&amp;param1=PYSDetalleGratuitas&amp;param2=1259925478504&amp;param4=Mostrar">INE - INSTITUTO DE LA MUJER: Mujeres y Hombres en Espa&ntilde;a.</a> Publicaci&oacute;n con datos desagregados por sexo en relaci&oacute;n a la educaci&oacute;n, el empleo, la salud,&nbsp; ciencia y tecnolog&iacute;a, salarios, poder y toma de decisiones, delito y violencia. Es posible acceder a los informes que vienen realiz&aacute;ndose desde 2006.</li>
	<li><a href="http://www.ine.es/inebmenu/mnu_sintesis.htm">INE (Instituto Nacional de Estad&iacute;stica): Publicaciones de s&iacute;ntesis</a>. Ofrecen informaci&oacute;n sobre mujeres y hombres en relaci&oacute;n a la educaci&oacute;n, cultura, salud, poblaci&oacute;n, condiciones de vida, mercado laboral, tecnolog&iacute;a, medio ambiente. Entre ellas, se encuentran <a href="http://www.ine.es/ss/Satellite&#63;L=0&amp;c=INEPublicacion_C&amp;cid=1259924856416&amp;p=1254735110672&amp;pagename=ProductosYServicios%#37;2FPYSLayout&amp;param1=PYSDetalleGratuitas">Espa&ntilde;a en cifras</a> y el <a href="http://www.ine.es/prodyser/pubweb/anuarios_mnu.htm">Anuario Estad&iacute;stico</a>, con datos actualizados e <a href="http://www.ine.es/jaxi/menu.do&#63;type=pcaxis&amp;path=%#37;2Ft25%#37;2Fp444&amp;file=inebase&amp;L=0">Indicadores sociales</a>.</li>
	<li><a href="http://www.inmujer.es/observatorios/observIgualdad/estudiosInformes/home.htm">INSTITUTO DE LA MUJER: Observatorio de Igualdad</a>. Estudios sobre diversos aspectos relacionados con la igualdad entre mujeres y hombres. Incluye la <a href="http://www.inmujer.es/observatorios/observIgualdad/estudiosInformes/docs/009-guia.pdf">Gu&iacute;a de coeducaci&oacute;n. S&iacute;ntesis sobre la educaci&oacute;n para la igualdad de oportunidades entre mujeres y hombres</a> , as&iacute; como el <a href="http://www.inmujer.gob.es/observatorios/observIgualdad/estudiosInformes/docs/016-analisis.pdf">An&aacute;lisis de la perspectiva de g&eacute;nero en algunas estad&iacute;sticas espa&ntilde;olas y algunas propuestas de mejora. </a></li>
	<li><a href="http://www.inmujer.es/estadisticas/portada/home.htm">INSTITUTO DE LA MUJER: Mujeres en cifras</a>.&nbsp; Datos estad&iacute;sticos procedentes de fuentes secundarias sobre la situaci&oacute;n de mujeres, hombres y ambos sexos en relaci&oacute;n a la demograf&iacute;a; familia y hogares; educaci&oacute;n; ciencia y tecnolog&iacute;a; empleo y prestaciones sociales; conciliaci&oacute;n; salud; poder y toma de decisiones; reconocimiento social; violencia; vulnerabilidad y m&uacute;ltiple discriminaci&oacute;n e indicadores de la UE y Naciones Unidas.</li>
	<li><a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/dms/mecd/servicios-al-ciudadano-mecd/estadisticas/educacion/indicadores-publicaciones-sintesis/datos-cifras/datos-y-cifras-2012-2013-web-pdf.pdf">MECD. Datos y cifras. Curso escolar 2012-2013</a>. Con informaci&oacute;n relativa a la situaci&oacute;n del alumnado, profesorado, resultados y nivel educativo de la poblaci&oacute;n, ense&ntilde;anza, TIC, inversi&oacute;n en educaci&oacute;n y aprendizaje de lenguas extranjeras.&nbsp;    <a href="http://www.mecd.gob.es/dctm/cee/informe2012/i2012cee.pdf&#63;documentId=0901e72b8145b4f2">MECD. Informe 2013 sobre el estado del sistema educativo</a>. Informaci&oacute;n sobre el&nbsp; nivel de estudios de la poblaci&oacute;n adulta, nivel socioecon&oacute;mico y cultural de las familias,&nbsp; inmigraci&oacute;n en los centros educativos, financiaci&oacute;n p&uacute;blica de la educaci&oacute;n, ordenaci&oacute;n de las ense&ntilde;anzas, pol&iacute;ticas para la igualdad de oportunidades, pol&iacute;ticas para la calidad educativa, pol&iacute;ticas en el &aacute;mbito de gesti&oacute;n del MECD, resultados del sistema educativo y propuestas de mejora.</li>
	<li><a href="http://www.mecd.gob.es/educacion-mecd/areas-educacion/universidades/estadisticas-informes/datos-cifras.html">MECD: Datos y cifras del sistema universitario espa&ntilde;ol</a>. Publicaci&oacute;n de s&iacute;ntesis con datos de desagregados por sexo desde 2005 sobre alumnado, becas, personal docente e investigador y gasto.</li>
	<li><a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/estadisticas/educacion/indicadores-publicaciones-sintesis/cifras-educacion-espana.html">MECD: Las cifras de la educaci&oacute;n en Espa&ntilde;a</a>. Anuario estad&iacute;stico sobre aspectos significativos de la educaci&oacute;n en nuestro pa&iacute;s, con informaci&oacute;n proveniente de distintas fuentes y presentada de forma conjunta y sint&eacute;tica. El nivel principal de desagregaci&oacute;n de la informaci&oacute;n es el de comunidades aut&oacute;nomas, lo que permite conocer las caracter&iacute;sticas de la educaci&oacute;n en cada comunidad y comparar e identificar las diversas situaciones que pueden existir. Incluye informes desde el curso 1996-1997.</li>
	<li><a href="http://www.mecd.gob.es/inee/publicaciones.html">INSTITUTO NACIONAL DE EVALUACI&Oacute;N EDUCATIVA (INEE): Publicaciones </a>relacionadas con el sistema educativo espa&ntilde;ol. Incluye informes como <a href="http://www.mecd.gob.es/inee/Ultimos_informes/Panorama.html">Panorama de la Educaci&oacute;n. Indicadores de la OCDE</a>, o diversas publicaciones de<a href="http://www.mecd.gob.es/inee/PISA-in-focus.html"> Pisa in Focus</a>, con algunos datos desagregados por sexo. Asimismo, dispone de diversas <a href="http://www.mecd.gob.es/inee/Bases-de-datos.html">Bases de Datos</a>.</li>
	<li><a href="http://www.mecd.gob.es/redie-eurydice/Investigacion-comparada/Informes-estudios-auton-micos.html">EURYDICE:&nbsp; Informes y estudios auton&oacute;micos descriptivos</a>. Informacio&#324; acerca del sistema educativo en las diferentes comunidades y ciudades aut&oacute;nomas.</li>
	<li><a href="http://www.mecd.gob.es/inee/sistema-indicadores.html">INEE: Sistema estatal de indicadores.</a> Estudios que se vienen realizando desde el a&ntilde;o 2000, donde se analizan datos sobre las siguientes dimensiones: contexto, recursos, escolarizaci&oacute;n, procesos&nbsp;y resultados educativos. Los datos aparecen desagregados seg&uacute;n sexo.</li>
	<li><a href="http://www.mecd.gob.es/inee/publicaciones/evaluacion-sistema.html">INEE: Evaluaci&oacute;n del sistema educativo espa&ntilde;ol</a>. Informes desde 1997 sobre el sistema educativo espa&ntilde;ol, que se van centrando en diferentes aspectos, comunidades y ciudades aut&oacute;nomas o etapas.</li>
	<li><a href="http://www.mecd.gob.es/inee/comunidades.html">INEE: Unidades de Evaluaci&oacute;n de las Comunidades y Ciudades Aut&oacute;nomas</a>: direcci&oacute;n postal y p&aacute;gina web de estos organismos. En muchas de ellas se pueden encontrar datos, informes y publicaciones sobre el sistema educativo regional, la calidad educativa y el rendimiento escolar.</li>
	<li><a href="http://www.csic.es/web/guest/mujeres-y-ciencia">CSIC: Comisi&oacute;n Mujeres y Ciencia</a>: ofrece <a href="http://www.csic.es/web/guest/documentos">informes, estudios y propuestas </a>internacionales y nacionales, como <a href="http://www.unican.es/NR/rdonlyres/81BF0865-C850-42BC-AC43-5FB01D5E30DE/97979/InformeMUJ_2013.pdf">Mujeres investigadoras 2013.</a> Da a conocer algunas de las <a href="http://www.csic.es/web/guest/mujeres-ilustres">aportaciones de las mujeres a las ciencias</a>, as&iacute; como <a href="http://www.csic.es/web/guest/enlaces">enlaces</a> de inter&eacute;s.</li>
	<li><a href="http://www.e-igualdad.net/estadisticas-estudios-igualdad">E-IGUALDAD.NET</a>:&nbsp; ofrece informaci&oacute;n sobre distintos aspectos de la inclusi&oacute;n digital de mujeres y hombres en Espa&ntilde;a.&nbsp; Incluye una secci&oacute;n de <a href="http://www.e-igualdad.net/estadisticas-estudios-igualdad">Estad&iacute;sticas</a>, con indicadores compuestos que, en un &uacute;nico dato se resumen dimensiones distintas de la desigualdad de g&eacute;nero: el <a href="http://e-igualdad.net/estadisticas-estudios-igualdad-ucm">Sistema de Indicadores de G&eacute;nero y TIC (SIGTIC)</a> pudiendo comparar la situaci&oacute;n en Espa&ntilde;a con la existente en la UE.&nbsp; En su secci&oacute;n <a href="http://www.e-igualdad.net/estudios-igualdad">Estudios</a>, aporta informes sobre g&eacute;nero y TIC, como <a href="http://e-igualdad.net/sites/default/files/BRECHA%#37;20DIGITAL%#37;20DE%#37;20GE%#37;CC%#37;81NERO%#37;20EN%#37;20ESPAN%#37;CC%#37;83A%#37;202011%#37;20%#37;20ANALISIS%#37;20MULT_INIVEL%#37;20%#37;20NIPO_0.pdf">La brecha digital de g&eacute;nero en Espa&ntilde;a</a>. Asimismo, da a conocer <a href="http://e-igualdad.net/iniciativas/planes-programas">Planes y Programas</a> relacionados con la igualdad en la Sociedad de la Informaci&oacute;n y <a href="http://e-igualdad.net/iniciativas/banco-experiencias">experiencias</a> que se han desarrollado (en muchos casos, dentro del &aacute;mbito educativo) a lo largo de toda la geograf&iacute;a espa&ntilde;ola.</li>
	<li><a href="http://mym.rsme.es/index.php&#63;option=com_content&amp;view=section&amp;id=10&amp;Itemid=85">COMISI&Oacute;N MUJERES Y MATEM&Aacute;TICAS, Real Sociedad Matem&aacute;tica Espa&ntilde;ola</a>: datos desagregados por sexo sobre el personal de investigaci&oacute;n, as&iacute; como el alumnado y el profesorado de la educaci&oacute;n universitaria en Matem&aacute;ticas.</li>
	<li><a href="http://www.csd.gob.es/csd/documentacion/01GabPr/Novedades/el-mecd-presenta-el-i-anuario-de-estadisticas-deportivas/">MECD: Anuario de estad&iacute;sticas deportivas</a>. Incluye <a href="https://sede.educacion.gob.es/publiventa/descargas.action&#63;f_codigo=15922&amp;codigoOpcion=3">informaci&oacute;n desagregada por sex</a>o sobre la pr&aacute;ctica deportiva de la poblaci&oacute;n, alumnado matriculado en Ense&ntilde;anzas vinculadas al deporte por tipo de ense&ntilde;anza, turismo vinculado al deporte, deporte federado y campeonatos universitarios y en edad escolar.</li>
	<li><a href="http://www.unicef.es/actualidad-documentacion/publicaciones/la-infancia-en-espana-2012-2013">UNICEF: La infancia en Espa&ntilde;a 2012-2013. El impacto de la crisis en los ni&ntilde;os</a> &iquest;C&oacute;mo impacta la crisis en la infancia&#63; &iquest;Cu&aacute;les son los efectos presentes y futuros de la situaci&oacute;n econ&oacute;mica y de las medidas tomadas al respecto sobre su bienestar y sus derechos&#63; &Eacute;stas son algunas de las cuestiones que aborda este informe, que dedica un espacio a la educaci&oacute;n.</li>
	<li><a href="http://www.msssi.gob.es/ssi/violenciaGenero/portalEstadistico/home.htm">MINISTERIO DE SANIDAD, SERVICIOS SOCIALES E IGUALDAD: Violencia de g&eacute;nero y trata de mujeres</a>. Datos, informes y publicaciones.</li>
	<li><a href="http://www.observatorioviolencia.org/informes.php&#63;id=10">FUNDACI&Oacute;N MUJERES:&nbsp;Observatorio de la violencia de G&eacute;nero</a>. Datos e informes sobre la violencia contra las mujeres en Espa&ntilde;a y Am&eacute;rica Latina.</li>
	<li><a href="http://mys.matriz.net/">REVISTA MUJER Y SALUD</a>: informaci&oacute;n sobre la salud de las mujeres.</li>
	<li><a href="http://www.msssi.gob.es/organizacion/sns/planCalidadSNS/e02.htm">OBSERVATORIO DE SALUD DE LAS MUJERES</a>. Ministerio de Sanidad, Servicios Sociales e Igualdad. Informes y estudios relacionados con salud y g&eacute;nero.</li>
</ul>
	',	'Estad&iacute;sticas'),

(148, 'Comunidades Aut&oacute;nomas', '',	'Estad&iacute;sticas');
Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(144, 145),(144, 146),(144, 147),(144, 148);


Insert into PAGINAS_ESTATICAS (ID,TITULO,CONTENIDO,CATEGORIA) values
(149, 'Andaluc&iacute;a', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUTO ANDALUZ DE LA MUJER</h2>
<ul>
	<li><a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/estadisticas">Aproximaci&oacute;n a la realidad de mujeres y hombres en Andaluc&iacute;a</a>: incluye datos sobre poblaci&oacute;n, educaci&oacute;n, empleo, conciliaci&oacute;n y corresponsabilidad, salud, bienestar social, participaci&oacute;n e imagen y medios de comunicaci&oacute;n.</li>
	<li><a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/estadisticas/enlaces-con-estadisticas-de-genero-del-instituto-de-estadistica-de-andalucia/mujeres-andaluzas-datos-basicos">Mujeres andaluzas. Datos b&aacute;sicos</a>:&nbsp;incluye informaci&oacute;n de 2010 y 2009 sobre mujeres y hombres, chicos y chicas en relaci&oacute;n con la educaci&oacute;n, poblaci&oacute;n y migraciones, familia y hogares, mercado de trabajo, salud y sanidad, protecci&oacute;n social, participaci&oacute;n, marginaci&oacute;n y violencia de g&eacute;nero.</li>
	<li><a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/estadisticas/enlaces-con-estadisticas-de-genero-del-instituto-de-estadistica-de-andalucia/anuario-andaluz-mujeres-perspectivas-genero">Anuarios estad&iacute;sticos de Andaluc&iacute;a con perspectiva de g&eacute;nero</a>:&nbsp;incluye informaci&oacute;n desagregada por sexo sobre educaci&oacute;n, poblaci&oacute;n y migraciones, familia y hogares, mercado de trabajo, salud y sanidad, protecci&oacute;n social, participaci&oacute;n, marginaci&oacute;n y violencia dom&eacute;stica.</li>
	<li><a href="http://www.juntadeandalucia.es/institutodelamujer/index.php/estadisticas/estadisticas-sobre-violencia-contra-las-mujeres">Estad&iacute;sticas sobre violencia contra las mujeres</a></li>
</ul>

<h2>CONSEJER&Iacute;A DE EDUCACI&Oacute;N, CULTURA Y DEPORTE</h2>
<ul>
	<li><a href="http://www.juntadeandalucia.es/educacion/nav/contenido.jsp&#63;pag=/Contenidos/Viceconsejeria/estadisticas&amp;vismenu=0,0,1,1,1,1,0,0,0&amp;&amp;&amp;&amp;&amp;">Estad&iacute;sticas educativas</a> sobre recursos, alumnado, profesorado y sistema educativo en Andaluc&iacute;a; resultados acad&eacute;micos; sociedad de la informaci&oacute;n y comunicaci&oacute;n en los centros docentes, gasto p&uacute;blico y becas y ayudas.</li>
	<li><a href="http://www.juntadeandalucia.es/educacion/agaeve/">Agencia Andaluza de Evaluaci&oacute;n Educativa (AGAEVE)</a>: incluye informes y publicaciones sobre el sistema educativo andaluz, como los resultados del <a href="http://www.juntadeandalucia.es/educacion/agaeve/docs/Presentacion_PISA_2012.pdf">Estudio Pisa 2012</a>.</li>
</ul>

<h2>INSTITUTO DE ESTAD&Iacute;STICA Y CARTOGRAF&Iacute;A DE ANDALUC&Iacute;A</h2>
<ul>
	<li><a href="http://www.juntadeandalucia.es/institutodeestadistica/temas/subtema0301.html">Estad&iacute;sticas sobre educaci&oacute;n</a>: informaci&oacute;n sobre el sistema educativo, la sociedad de la informaci&oacute;n y la comunicaci&oacute;n en centros docentes y la Encuesta Social de Educaci&oacute;n y Hogares en Andaluc&iacute;a.</li>
</ul>

	',	'Estad&iacute;sticas,Andaluc&iacute;a'),

(150, 'Arag&oacute;n', '
<h1>Estad&iacute;sticas</h1>
<h2>DEPARTAMENTO DE EDUCACI&Oacute;N, UNIVERSIDAD, CULTURA Y DEPORTE</h2>
<ul>
	<li><a href="http://www.educaragon.org/arboles/arbol.asp&#63;strseccion=PPI12&amp;sepRuta=Sistema%#37;20Educativo/">Educarag&oacute;n - Estad&iacute;sticas:</a> datos sobre estad&iacute;stica educativa obtenidos del Instituto Aragon&eacute;s de Estad&iacute;stica (Gobierno de Arag&oacute;n) y del Ministerio de Educaci&oacute;n, Universidad, Cultura y Deporte.</li>
	<li><a href="http://www.educaragon.org/arboles/arbol.asp&#63;sepRuta=Sistema+Educativo%#37;2F&amp;guiaeducativa=&amp;strSeccion=PPI07&amp;titpadre=Consejo+escolar&amp;arrpadres=$Publicaciones+del+Consejo+Escolar+de+Arag%#37;F3n&amp;arrides=$1776&amp;arridesvin=$&amp;lngArbol=1777&amp;lngArbolvinculado=">Consejo Escolar de Arag&oacute;n</a>: informes sobre la situaci&oacute;n del sistema educativo en Arag&oacute;n, con datos desagregados por sexo.&nbsp;&nbsp;</li>
</ul>

<h2>INSTITUTO ARAGON&Eacute;S DE ESTAD&Iacute;STICA (IAEST)</h2>
<ul>
	<li><a href="http://www.aragon.es/DepartamentosOrganismosPublicos/Organismos/InstitutoAragonesEstadistica/AreasTematicas/06_Analisis_Sociales_Justicia_Cultura_Y_Deporte/06_Estadisticas_Genero/01_DatosBasicosMujeres">Datos b&aacute;sicos sobre las mujeres en Arag&oacute;n (DBMA)</a>. Producto de difusi&oacute;n de informaci&oacute;n estad&iacute;stica p&uacute;blica de car&aacute;cter sint&eacute;tico, que recoge los indicadores m&aacute;s relevantes disponibles por sexo, posibilitando as&iacute; un mejor conocimiento de las diferencias en la situaci&oacute;n de las mujeres y hombres en la sociedad aragonesa.</li>
	<li><a href="http://www.aragon.es/DepartamentosOrganismosPublicos/Organismos/InstitutoAragonesEstadistica/AreasTematicas/03_Educacion_Y_Formacion&#63;channelSelected=e1aca856c66de310VgnVCM2000002f551bacRCRD">Educaci&oacute;n y Formaci&oacute;n.</a> Incluye datos desagregados por sexo en relaci&oacute;n a la educaci&oacute;n universitaria, no universitaria, nivel educativo de la poblaci&oacute;n, transici&oacute;n educativa-laboral y Encuesta sobre la participaci&oacute;n de la poblaci&oacute;n adulta en las actividades de aprendizaje (EADA). Asimismo, ofrece informaci&oacute;n sobre gasto p&uacute;blico en educaci&oacute;n, becas y ayudas.</li>
</ul>

<h2>INSTITUTO ARAGON&Eacute;S DE LA MUJER</h2>
<ul>
	<li><a href="http://www.aragon.es/DepartamentosOrganismosPublicos/Organismos/InstitutoAragonesMujer/AreasTematicas/ci.OBSERVATORIO_VIOLENCIA_CONTRA_MUJER.detalleDepartamento&#63;channelSelected=0#section4">Observatorio Aragon&eacute;s de violencia sobre la mujer</a>. Estudios, investigaciones e Informes.</li>
	<li><a href="http://www.aragon.es/DepartamentosOrganismosPublicos/Organismos/InstitutoAragonesMujer/AreasGenericas/ci.03_estadisticas.detalleDepartamento">Estad&iacute;sticas sobre las consultas realizadas en las asesor&iacute;as</a> social, jur&iacute;dica, laboral y psicol&oacute;gica, as&iacute; como en el tel&eacute;fono de consulta gratuito L&iacute;nea 900.</li>
</ul>

	',	'Estad&iacute;sticas,Arag&oacute;n'),

(151, 'Asturias', '
<h1>Estad&iacute;sticas</h1>
<h2>CONSEJER&Iacute;A DE EDUCACI&Oacute;N, CULTURA Y DEPORTE</h2>
<ul>
	<li><a href="http://www.educastur.es/index.php&#63;option=com_content&amp;task=category&amp;sectionid=11&amp;id=42&amp;Itemid=54">Informes</a> y estudios elaborados por distintos organismos de la Consejer&iacute;a de Educaci&oacute;n,&nbsp;Cultura y Deporte en relaci&oacute;n con la oferta educativa y la organizaci&oacute;n, funcionamiento y resultados acad&eacute;micos en los diferentes niveles y etapas que configuran la educaci&oacute;n no universitaria del Principado de Asturias. Con informaci&oacute;n desagregada por sexos.</li>
</ul>

<h2>INSTITUTO ASTURIANO DE LA MUJER</h2>
<ul>
	<li><a href="http://www.asturestad.es/es/portal.do&#63;IDM=33&amp;NM=2"></a></li>
	<li><a href="http://institutoasturianodelamujer.com/iam/observatorio-de-igualdad-de-oportunidades/">Mujeres y Hombres en Asturias</a>: informes sobre la situaci&oacute;n de&nbsp;hombres y mujeres en Asturias desde 2002 hasta la actualidad: poblaci&oacute;n, educaci&oacute;n, trabajo (&aacute;mbito privado y mercado laboral, salud, participaci&oacute;n social y pol&iacute;tica.</li>
	<li><a href="http://institutoasturianodelamujer.com/iam/observatorio-de-igualdad-de-oportunidades/">Observatorio de Igualdad de Oportunidades</a>: su objetivo es la recogida sistem&aacute;tica de datos por medio de estad&iacute;sticas desagregadas por sexo, con el fin de conocer la realidad espec&iacute;fica de la igualdad de oportunidades entre mujeres y hombres en la Comunidad Aut&oacute;noma del Principado de Asturias.</li>
</ul>

<h2>SADEI: SOCIEDAD ASTURIANA DE ESTUDIOS ECON&Oacute;MICOS E INDUSTRIALES</h2>
<ul>
	<li><a href="http://www.sadei.es/es/portal.do;jsessionid=7DD59B1EC06E09609F6B04E432C44DFD ">Estad&iacute;sticas</a>: informaci&oacute;n desagregada por sexo sobre educaci&oacute;n, investigaci&oacute;n, cultura y deportes (entre otros aspectos) en Asturias.</li>
	<li><a href="http://www.sadei.es/es/cargarAplicacionCatalogo.do">Publicaciones</a>: incluye informes y estudios sobre la educaci&oacute;n, como la <a href="http://www.sadei.es/es/cargarFichaEdicion.do&#63;identificador=352#ed">Estad&iacute;stica de la Ense&ntilde;anza en Asturias</a>, as&iacute; como publiaciones de s&iacute;ntesis como el <a href="http://www.sadei.es/es/cargarAplicacionCatalogo.do&#63;identificador=203">Anuario Estad&iacute;stico</a>.</li>
</ul>

<h2>CONSEJO ESCOLAR DEL PRINCIPADO DE ASTURIAS</h2>
<ul>
	<li><a href="http://consejoescolar.educastur.es/">Publicaciones, estudios e informes</a> en relaci&oacute;n con el sistema educativo asturiano, con datos desagregados por sexo.</li>
</ul>

<h2>ASTURSALUD</h2>
<ul>
	<li><a href="http://www.asturias.es/portal/site/astursalud/menuitem.2d7ff2df00b62567dbdfb51020688a0c/&#63;vgnextoid=1c6d2c4d2c754210VgnVCM10000097030a0aRCRD&amp;vgnextchannel=1608f05fb1a16110VgnVCM1000008614e40aRCRD">G&eacute;nero y salud de las mujeres en Asturias</a>. Informaci&oacute;n sobre las diferencias y desigualdades entre hombres y mujeres en relaci&oacute;n a la salud, tanto en Asturias como en otros lugares del mundo.</li>
</ul>
	',	'Estad&iacute;sticas,Asturias'),

(152, 'Canarias', '
<h1>Estad&iacute;sticas</h1>
<h2>VICECONSEJER&Iacute;A DE EDUCACI&Oacute;N, UNIVERSIDADES Y SOSTENIBILIDAD</h2>
<ul>
	<li><a href="http://www.gobiernodecanarias.org/educacion/ViceConsejeria/EstaVice/scripts/Principal.asp">Oficina de Planificaci&oacute;n y Estad&iacute;stica</a>: permite consultar estad&iacute;sticas, series estad&iacute;sticas, publicaciones, gr&aacute;ficos y consultas din&aacute;micas, con datos desagregados por sexo en relaci&oacute;n a la educaci&oacute;n reglada.</li>
	<li><a href="http://www.mecd.gob.es/inee/comunidades.html&#63;ccaaSearch=can">Instituto Canario de Evaluaci&oacute;n y Calidad Educativa (ICEC)</a>: ofrece datos, informes de evaluaci&oacute;n y publicaciones sobre el sistema educativo canario.&nbsp;&nbsp;</li>
</ul>

<h2>INSTITUTO CANARIO DE IGUALDAD</h2>
<ul>
	<li><a href="http://www.gobiernodecanarias.org/icigualdad/inicio/informacion_servicios/estadisticas_normativa/estadisticas.html">Estad&iacute;sticas</a>: incluye estudios diversos y enlaces con informaci&oacute;n general desagregada por sexo, as&iacute; como la relacionada con violencia contra las mujeres y con empleo.</li>
	<li><a href="http://www.gobiernodecanarias.org/istac/temas_estadisticos/sintesis/operacion_C00055A.html">Mujeres y hombres en Canarias</a>. An&aacute;lisis con datos, tablas y  gr&aacute;ficos que permiten visibilizar las diferentes situaciones y  condiciones de vida de mujeres y hombres en Canarias. Realizado a partir de la colaboraci&oacute;n con el  Instituto Canario de Estad&iacute;stica.</li>
</ul>

<h2>INSTITUTO CANARIO DE ESTAD&Iacute;STICAS (ISTAC)</h2>
<ul>
	<li><a href="http://www.gobiernodecanarias.org/istac/temas_estadisticos/sociedad/educacion/">Estad&iacute;sticas sobre educaci&oacute;n</a> no universitaria, universitaria, no reglada y formaci&oacute;n profesional para el empleo, con datos desagregados por sexo.</li>
	<li><a href="http://www.gobiernodecanarias.org/istac/temas_estadisticos/sintesis/operacion_C00052A.html">Anuario estad&iacute;stico</a>: ofrece amplia informaci&oacute;n sobre distintos aspectos de la sociedad canaria a lo largo de distintos a&ntilde;os procedente de diversas fuentes (ISTAC, INE), con datos desagregados por sexo. Incluye un apartado dedicado a la educaci&oacute;n.</li>
	<li><a href="http://www.gobiernodecanarias.org/istac/temas_estadisticos/sociedad/culturadeporteocio/">Cultura, deportes y ocio</a>. Con informaci&oacute;n desagregada por sexo.</li>
</ul>
	',	'Estad&iacute;sticas,Canarias'),

(153, 'Cantabria', '
<h1>Estad&iacute;sticas</h1>
<h2><a href="http://www.icane.es/">ICANE- INSTITUTO C&Aacute;NTABRO DE ESTAD&Iacute;STICA</a></h2>
<ul>
	<li><a href="http://www.icane.es/c/document_library/get_file&#63;uuid=6de12e9e-230d-431a-ac3f-764d71aa5516&amp;groupId=10138">Mujeres y Hombres desde la Perspectiva de G&eacute;nero 2012</a>. Estudio sobre su situaci&oacute;n en relaci&oacute;n a &aacute;mbitos como el laboral, el familiar, la demograf&iacute;a, la salud, la educaci&oacute;n, la participaci&oacute;n en la esfera p&uacute;blica y la violencia sexista.</li>
	<li><a href="http://www.icane.es/publications/synthesis">Publicaciones de s&iacute;ntesis</a>:  incluye informaci&oacute;n desagregada por sexo procedente de distintas  fuentes, en publicaciones como Mujeres y Hombres desde la Perspectiva de G&eacute;nero correspondiente a diferentes a&ntilde;os,&nbsp; Anuario  Estad&iacute;stico y Estad&iacute;sticas Hist&oacute;ricas (con datos desde 1830).</li>
	<li><a href="http://www.icane.es/c/document_library/get_file&#63;uuid=a7a082f1-54b9-4f08-8ca9-26c16e212fa9&amp;groupId=10138">Anuario Estad&iacute;stico 2013</a>: incluye informaci&oacute;n desagregada por sexo en relaci&oacute;n a la educaci&oacute;n, desigualdades de g&eacute;nero, sanidad, poblaci&oacute;n, justicia, mercado laboral, elecciones, sociedad de la informaci&oacute;n y otros &iacute;tems. Asimismo, se incluyen los <a href="http://www.icane.es/publications/synthesis">Anuarios</a> correspondientes a otros a&ntilde;os.</li>
	<li><a href="http://www.icane.es/society/education">Datos hist&oacute;ricos sobre educaci&oacute;n</a>:  informaci&oacute;n a partir del a&ntilde;o 1830 desagregada por sexo sobre alumnado,  profesorado y centros de la educaci&oacute;n reglada desde la etapa infantil  hasta la universitaria, as&iacute; como la tasa de alfabetizaci&oacute;n.</li>
	<li><a href="http://www.icane.es/publications">Indicadores sociales</a>: publicaci&oacute;n con informaci&oacute;n sobre educaci&oacute;n, ocio y tiempo libre, cultura,poblaci&oacute;n, familia, protecci&oacute;n social, cohesi&oacute;n, renta, empleo, salud y entorno. Con algunos datos desagregados por sexo, se puede acceder a ella en el ep&iacute;grafe &quot;Publicaciones Demogr&aacute;ficas&quot;.</li>
</ul>

<h2>CONSEJER&Iacute;A DE EDUCACI&Oacute;N, CULTURA Y DEPORTE</h2>
<ul>
	<li><a href="http://www.educantabria.es/estadisticas/administracion/paginas-especiales/estadisticas">Estad&iacute;sticas</a>: incluye algunos datos estad&iacute;sticos sobre la participaci&oacute;n del alumnado (sin desglosar por sexo) en diferentes centros, niveles educativos, ciclos, m&oacute;dulos y programas.&nbsp;&nbsp;&nbsp;&nbsp;</li>
</ul>

	',	'Estad&iacute;sticas,Cantabria'),

(154, 'Castilla la Mancha', '
<h1>Estad&iacute;sticas</h1>
<h2>CONSEJER&Iacute;A DE EDUCACI&Oacute;N, CULTURA Y DEPORTES</h2>
<ul>
	<li><a href="http://www.educa.jccm.es/educa-jccm/cm/educa_jccm/tkContent&#63;idContent=1409&amp;locale=es_ES&amp;textOnly=false">Estad&iacute;sticas</a> y datos de inter&eacute;s sobre la comunidad educativa en Castilla-La Mancha, con datos desagregados por sexo.</li>
</ul>

<h2>SERVICIO DE ESTAD&Iacute;STICA</h2>
<ul>
	<li><a href="http://www.ies.jccm.es/estadisticas/por-tema/sociedad/estadisticas-de-genero/">Estad&iacute;sticas sobre educaci&oacute;n reglada</a>, con datos desagregados por sexo, dentro del apartado &ldquo;Estad&iacute;sticas de g&eacute;nero&rdquo;: informaci&oacute;n sobre alumnado, profesorado y centros de ense&ntilde;anza universitaria y no universitaria.</li>
	<li><a href="http://www.ies.jccm.es/estadisticas/por-tema/sociedad/estadisticas-de-genero/">Estad&iacute;sticas de g&eacute;nero</a>: informaci&oacute;n sobre poblaci&oacute;n, trabajo, educaci&oacute;n, sanidad, usos del tiempo, estad&iacute;sticas judiciales y participaci&oacute;n pol&iacute;tica.</li>
	<li><a href="http://www.ies.jccm.es/estadisticas/por-tema/sociedad/ensenanza/">Ense&ntilde;anza</a>: incluye datos desagregados por sexo sobre alumnado y personal docente de la ense&ntilde;anza universitaria y no universitaria, adem&aacute;s de informaci&oacute;n relacionada con la sociedad de la informaci&oacute;n.</li>
	<li><a href="http://www.ies.jccm.es/documentos/publicaciones/doc-tag/anuario/">Anuario Estad&iacute;stico</a>: informaci&oacute;n actualizada procedente de distintas fuentes sobre la poblaci&oacute;n y la sociedad castellano-manchega, con datos desagregados por sexo. Incluye el apartado &quot;Ense&ntilde;anza&quot;.</li>
	<li><a href="http://www.educa.jccm.es/es/sistema-educativo/evaluacion-educativa">Evaluaci&oacute;n educativa</a>: ofrece informaci&oacute;n sobre los resultados acad&eacute;micos del alumnado, como los recogidos en el Informe Pisa.</li>
</ul>

<h2>INSTITTUTO DE LA MUJER DE CASTILLA-LA MANCHA</h2>
<ul>
	<li><a href="http://www.institutomujer.jccm.es/fileadmin/user_upload/WEB_2011/CENTRO_DE_DOCUMENTACION/PUBLICACIONES/Adolescencia_y_Violencia.pdf">Adolescentes y j&oacute;venes en Castilla-La Mancha ante la violencia de g&eacute;nero en las relaciones de pareja</a></li>
</ul>
	',	'Estad&iacute;sticas,Castilla la Mancha'),

(155, 'Castilla y Le&oacute;n', '
<h1>Estad&iacute;sticas</h1>
	<h2>CONSEJER&Iacute;A DE EDUCACI&Oacute;N: EDUCACYL, PORTAL DE LA COMUNIDAD EDUCATIVA</h2>
<ul>
	<li><a href="http://www.educa.jcyl.es/es/informacion/estadistica-ensenanza-universitaria">Estad&iacute;sticas de la ense&ntilde;anza no universitaria</a>: tablas b&aacute;sicas de las ense&ntilde;anzas de r&eacute;gimen general, de r&eacute;gimen especial y de educaci&oacute;n de personas adultas, con informaci&oacute;n sobre hombres y mujeres.</li>
	<li><a href="http://www.educa.jcyl.es/es/temas/calidad-evaluacion">Calidad y evaluaci&oacute;n</a>: estudios y art&iacute;culos relacionados sobre el rendimiento acad&eacute;mico y la motivaci&oacute;n del alumnado, como el <a href="http://www.educa.jcyl.es/es/temas/calidad-evaluacion/pisa-castilla-leon">Informe Pisa</a>.</li>
</ul>

<h2>JUNTA DE CASTILLA Y LE&Oacute;N: DIRECCI&Oacute;N GENERAL DE ESTAD&Iacute;STICA</h2>
<ul>
	<li><a href="http://www.jcyl.es/web/jcyl/Estadistica/es/Plantilla100/1284180021365/_/_/_">Anuario estad&iacute;stico</a>: con informaci&oacute;n actualizada sobre mujeres y hombres de la sociedad castellano-leonesa en relaci&oacute;n a la educaci&oacute;n reglada, cultura y deportes, la econom&iacute;a, el empleo, la sanidad y la justicia.</li>
	<li><a href="http://www.jcyl.es/web/jcyl/Estadistica/es/Plantilla100/1284159001617/_/_/_">La Mujer en Castilla y Le&oacute;n.&nbsp; Datos B&aacute;sicos.</a> Incluye informaci&oacute;n estad&iacute;stica desde el a&ntilde;o 2002 hasta el 2009, con datos espec&iacute;ficos sobre Educaci&oacute;n.</li>
	<li><a href="http://www.jcyl.es/web/jcyl/Estadistica/es/Plantilla100/1284159001637/_/_/_">La mujer en el medio rural</a>.  Editada por primera vez en 2007, esta publicaci&oacute;n ofrece datos b&aacute;sicos  sobre la  poblaci&oacute;n femenina que reside en municipios de menos de 5.000  habitantes  de Castilla y Le&oacute;n. El apartado 3 recoge informaci&oacute;n sobre  la formaci&oacute;n y situaci&oacute;n laboral de las mujeres que residen en el medio  rural.</li>
	<li><a href="http://www.jcyl.es/web/jcyl/Estadistica/es/Plantilla100/1284159002078/_/_/_">Situaci&oacute;n econ&oacute;mica y social de la mujer</a>. Refleja  la situaci&oacute;n de la mujer de Castilla y Le&oacute;n en relaci&oacute;n a aspectos como el mercado de trabajo, el nivel educativo o la participaci&oacute;n  en la vida  p&uacute;blica. Incluye datos desde el a&ntilde;o 2002 hasta 2009.</li>
</ul>

<h2>OBSERVATORIO DE G&Eacute;NERO</h2>
<ul>
	<li><a href="http://www.jcyl.es/web/jcyl/Familia/es/Plantilla100/1158761514045/_/_/_">Estudios desarrollados desde el Observatorio de G&eacute;nero</a> sobre la violencia de g&eacute;nero, la percepci&oacute;n de la igualdad en el medio rural, las desigualdades en el acceso de las mujeres al mercado laboral y las asociaciones de mujeres.</li>
</ul>

<h2>CONSEJER&Iacute;A DE FAMILIA E IGUALDAD DE OPORTUNIDADES</h2>
<ul>
	<li><a href="http://www.jcyl.es/web/jcyl/Familia/es/Plantilla100/1173962226513/_/_/_">La violencia de g&eacute;nero en cifras</a>. Partiendo de la estad&iacute;stica publicada por el Observatorio contra la Violencia Dom&eacute;stica y de G&eacute;nero del Consejo General del Poder Judicial, recoge los datos correspondientes a Castilla y Le&oacute;n.</li>
</ul>
	',	'Estad&iacute;sticas,Castilla y Le&oacute;n'),

(156, 'Catalu&ntilde;a', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUT CATAL&Agrave; DE LES DONES</h2>
<ul>
	<li><a href="http://www20.gencat.cat/portal/site/icdones/menuitem.cd59b061552b62b439a72641b0c0e1a0/&#63;vgnextoid=2e60c868d4b8b210VgnVCM1000008d0c1e0aRCRD&amp;vgnextchannel=2e60c868d4b8b210VgnVCM1000008d0c1e0aRCRD&amp;vgnextfmt=default#Bloca07c572f0623d210VgnVCM2000009b0c1e0a____">Datos sobre Educaci&oacute;n</a>: incluye informaci&oacute;n desagregada por sexos sobre numerosos &iacute;tems en relaci&oacute;n con la situaci&oacute;n de chicas y chicos, hombres y mujeres ante la educaci&oacute;n reglada y no reglada, as&iacute; como en la investigaci&oacute;n.</li>
	<li><a href="http://www20.gencat.cat/portal/site/icdones/menuitem.cd59b061552b62b439a72641b0c0e1a0/&#63;vgnextoid=2e60c868d4b8b210VgnVCM1000008d0c1e0aRCRD&amp;vgnextchannel=2e60c868d4b8b210VgnVCM1000008d0c1e0aRCRD&amp;vgnextfmt=default">Estad&iacute;sticas sobre la situaci&oacute;n de las mujeres y desagregadas por sexo</a>: en este enlace, se puede acceder a estad&iacute;sticas en relaci&oacute;n a la cultura y las TIC, la educaci&oacute;n, demograf&iacute;a, deportes, familia, poder y toma de decisiones, trabajo y violencia machista.</li>
</ul>

<h2>IDESCAT, INSTITUTO DE ESTAD&Iacute;STICA DE CATALU&Ntilde;A</h2>
<ul>
	<li><a href="http://www.idescat.cat/es/societat/soceduc.html">Estad&iacute;sticas sobre educaci&oacute;n</a>: informaci&oacute;n sobre mujeres y hombres en relaci&oacute;n a los distintos niveles de escolarizaci&oacute;n, ense&ntilde;anza obligatoria y no obligatoria, abandono escolar prematuro y financiaci&oacute;n y gasto de la ense&ntilde;anza. Incluye una comparativa de datos de Catalu&ntilde;a en relaci&oacute;n a Espa&ntilde;a y a la Uni&oacute;n Europea.</li>
	<li><a href="http://www.idescat.cat/pub/&#63;id=aec&amp;lang=es">Anuario Estad&iacute;stico de Catalu&ntilde;a</a>: incluye datos desagregados por sexo sobre los diferentes niveles de la educaci&oacute;n reglada, educaci&oacute;n para personas adultas, formaci&oacute;n de la poblaci&oacute;n, cultura y deportes.</li>
</ul>
	',	'Estad&iacute;sticas,Catalu&ntilde;a'),

(157, 'Ceuta', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUTO NACIONAL DE ESTAD&Iacute;STICA (INE)</h2>
<ul>
	<li><a href="http://www.ine.es/inebmenu/mnu_educa.htm">Estad&iacute;sticas sobre educaci&oacute;n</a>: con informaci&oacute;n desagregada por CCAA y por sexo en relaci&oacute;n a la ense&ntilde;anza universitaria, no universitaria, educaci&oacute;n de personas adultas, transici&oacute;n educativo-formativa e inserci&oacute;n laboral, gasto y financiaci&oacute;n de centros privados y gasto de los hogares en educaci&oacute;n.</li>
</ul>

<h2>MINISTERIO DE EDUCACI&Oacute;N CULTURA Y DEPORTE</h2>
<ul>
	<li><a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/dms/mecd/servicios-al-ciudadano-mecd/estadisticas/educacion/indicadores-publicaciones-sintesis/datos-cifras/datos-y-cifras-2012-2013-web-pdf.pdf">Datos y cifras. Curso escolar 2012-2013</a>. Con informaci&oacute;n relativa a la situaci&oacute;n del alumnado, profesorado, resultados y nivel educativo de la poblaci&oacute;n, ense&ntilde;anza, TIC, inversi&oacute;n en educaci&oacute;n y aprendizaje de lenguas extranjeras en diferentes CCAA, incluyendo Ceuta y Melilla.</li>
	<li><a href="http://www.mecd.gob.es/dctm/cee/informe2012/i2012cee.pdf&#63;documentId=0901e72b8145b4f2">Informe 2013 sobre el estado del sistema educativo</a>. Informaci&oacute;n comparativa de las diferentes CCAA, incluyendo Ceuta, as&iacute; como de car&aacute;cter estatal. Incluye datos sobre&nbsp; nivel de estudios de la poblaci&oacute;n adulta, nivel socioecon&oacute;mico y cultural de las familias,&nbsp; inmigraci&oacute;n en los centros educativos, financiaci&oacute;n p&uacute;blica de la educaci&oacute;n, ordenaci&oacute;n de las ense&ntilde;anzas, pol&iacute;ticas para la igualdad de oportunidades, pol&iacute;ticas para la calidad educativa, pol&iacute;ticas en el &aacute;mbito de gesti&oacute;n del MECD (Incluye un apartado sobre pol&iacute;ticas en Ceuta y Melilla), resultados del sistema educativo y propuestas de mejora.</li>
	<li><a href="https://sede.educacion.gob.es/publiventa/detalle.action&#63;cod=14574">Informe sobre el estado y situaci&oacute;n del sistema educativo. Ceuta y Melilla. Curso 2009/2010</a></li>
</ul>
	',	'Estad&iacute;sticas,Ceuta'),

(158, 'Comunidad Valenciana', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUTO NACIONAL DE ESTAD&Iacute;STICA</h2>
<ul>
	<li><a href="http://www.ine.es/inebmenu/mnu_educa.htm">Estad&iacute;sticas sobre educaci&oacute;n</a>: con informaci&oacute;n desagregada por CCAA y por sexo en relaci&oacute;n a la ense&ntilde;anza universitaria, no universitaria, educaci&oacute;n de personas adultas, transici&oacute;n educativo-formativa e inserci&oacute;n laboral, gasto y financiaci&oacute;n de centros privados y gasto de los hogares en educaci&oacute;n.</li>
</ul>

<h2>INSTITUTO VALENCIANO DE ESTAD&Iacute;STICA</h2>
<ul>
	<li><a href="http://ive.ive.es/portal/page/portal/IVE_PEGV/CONTENTS/indicadores_sociales/indexcas.htm">Indicadores sociales de la Comunidad Valenciana</a>: En el apartado &quot;G&eacute;nero&quot;, incluye datos desagregados por sexo, as&iacute; como porcentajes de ni&ntilde;as y mujeres en relaci&oacute;n a diferentes &iacute;tems: educaci&oacute;n reglada, demograf&iacute;a, poder y toma de decisiones, empleo, salud y h&aacute;bitos de vida, delincuencia, exclusi&oacute;n social, ciencia y tecnolog&iacute;a y calidad de vida. Otros apartados (exclusi&oacute;n social y participaci&oacute;n social) incluyen algunos datos desagregados por sexo.</li>
	<li><a href="http://www.ive.es/">Estad&iacute;sticas sobre educaci&oacute;n</a>: en el apartado de &quot;Sociedad&quot;, el subapartado &quot;Educaci&oacute;n&quot;&nbsp; incluye informaci&oacute;n estad&iacute;stica por temas, donde se puede encontrar informaci&oacute;n sobre ense&ntilde;anzas universitarias, no universitarias, becas y ayudas y gasto p&uacute;blico en educaci&oacute;n en la Comunidad Valenciana.</li>
</ul>

<h2>MINISTERIO DE EDUCACI&Oacute;N, CULTURA Y DEPORTE&nbsp;(MECD)</h2>
<ul>
	<li><a href="http://www.mecd.gob.es/dctm/cee/informe2012/i2012cee.pdf&#63;documentId=0901e72b8145b4f2">Informe 2013 sobre el estado del sistema educativo</a>. Informaci&oacute;n de car&aacute;cter estatal y auton&oacute;mica sobre el&nbsp; nivel de estudios de la poblaci&oacute;n adulta, nivel socioecon&oacute;mico y cultural de las familias,&nbsp; inmigraci&oacute;n en los centros educativos, financiaci&oacute;n p&uacute;blica de la educaci&oacute;n, ordenaci&oacute;n de las ense&ntilde;anzas, pol&iacute;ticas para la igualdad de oportunidades, pol&iacute;ticas para la calidad educativa, pol&iacute;ticas en el &aacute;mbito de gesti&oacute;n del MECD, resultados del sistema educativo y propuestas de mejora.</li>
	<li><a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/dms/mecd/servicios-al-ciudadano-mecd/estadisticas/educacion/indicadores-publicaciones-sintesis/datos-cifras/datos-y-cifras-2012-2013-web-pdf.pdf">Datos y cifras. Curso escolar 2012-2013</a>. Con informaci&oacute;n relativa a la situaci&oacute;n del alumnado, profesorado, resultados y nivel educativo de la poblaci&oacute;n, ense&ntilde;anza, TIC, inversi&oacute;n en educaci&oacute;n y aprendizaje de lenguas extranjeras en diferentes CCAA.</li>
</ul>

	',	'Estad&iacute;sticas,Comunidad Valenciana'),

(159, 'Extremadura', '
<h1>Estad&iacute;sticas</h1>
<h2>SECCI&Oacute;N DE ESTAD&Iacute;STICA EDUCATIVA, SERVICIO DE COORDINACI&Oacute;N EDUCATIVA DE LA SECRETAR&Iacute;A GENERAL DE EDUCACI&Oacute;N</h2>
<ul>
	<li><a href="http://www.educarex.es/estadistica-educativa/introduccion.html">EDUCAREX- Estad&iacute;stica educativa</a>: Incluye datos estad&iacute;sticos sobre educaci&oacute;n, algunos de ellos desagregados por sexo.</li>
</ul>

<h2>INSTITUTO ESTAD&Iacute;STICO DE EXTREMADURA</h2>
<ul>
	<li><a href="http://estadistica.gobex.es/listadon2.php&#63;id=10">Informaci&oacute;n estad&iacuiacute;stica sobre Educaci&oacute;n, Formaci&oacute;n e Investigaci&oacute;n</a></li>
	<li>El <a href="http://estadistica.gobex.es/contenido.php&#63;seccion=2&amp;pag=3">Anuario estad&iacute;stico</a> y <a href="http://estadistica.gobex.es/contenido.php&#63;pag=12">Extremadura en cifras</a> incluyen algunos datos desagregados por sexo y un apartado dedicado a la educaci&oacute;n.</li>
</ul>

<h2>OBSERVATORIO EXTREME&Ntilde;O DE IGUALDAD Y EMPLEABILIDAD</h2>
<ul>
	<li><a href="http://igualdadenred.gobex.es/index.php/noticias/425-el-observatorio-extremeno-de-igualdad-de-oportunidades-y-empleabilidad-publica-su-informe-personal-docente-y-otros-cargos-de-la-educacion-en-extremadura.html">Informe Personal docente y otros cargos de la Educaci&oacute;n en Extremadura</a>. Analiza datos procedentes de diversas operaciones estad&iacute;sticas para conocer las caracter&iacute;sticas del profesorado de los distintos niveles educativos en Extremadura, as&iacute; como las diferencias entre hombres y mujeres en las distintas ense&ntilde;anzas, en la toma de decisiones o en las retribuciones.</li>
</ul>
	',	'Estad&iacute;sticas,Extremadura'),

(160, 'Galicia', '
<h1>Estad&iacute;sticas</h1>
<h2>XUNTA DE GALICIA. CONSELLER&Iacute;A DE EDUCACI&Oacute;N, CULTURA E ORDENACI&Oacute;N UNIVERSITARIA</h2>
<ul>
	<a href="http://www.edu.xunta.es/web/estatisticas">Datos estad&iacute;sticos</a>: incluye informaci&oacute;n estad&iacute;stica sobre ense&ntilde;anza universitaria y no universitaria, en algunos casos desagregada por sexos.
</ul>

<h2>INSTITUTO GALEGO DE ESTAD&Iacute;STICA</h2>
<ul>
	<a href="http://www.ige.eu/web/mostrar_actividade_estatistica.jsp&#63;idioma=es&amp;codigo=0205011&amp;num_pag=3">Estad&iacute;sticas sobre educaci&oacute;n datos desagregados por sexo</a>, as&iacute; como informaci&oacute;n relacionada con la participaci&oacute;n de las mujeres en el sistema educativo.
	<a href="http://www.ige.eu/web/mostrar_actividade_estatistica.jsp&#63;idioma=es&amp;codigo=0205011">Estad&iacute;sticas</a> sobre la realidad de la mujer gallega en relaci&oacute;n con el medio, poblaci&oacute;n y hogares, educaci&oacute;n, salud, trabajo, renta y protecci&oacute;n social, poder y toma de decisiones, delito y violencia de g&eacute;nero.
	<a href="http://www.ige.eu/web/mostrar_actividade_estatistica.jsp&#63;idioma=es&amp;codigo=0203002">Estad&iacute;sticas sobre educaci&oacute;n</a>: ofrece datos sobre educaci&oacute;n reglada y no reglada, alfabetizaci&oacute;n, formaci&oacute;n e inserci&oacute;n laboral, en algunos casos desagregados por sexo.
</ul>

<h2>UNIDAD MUJER Y CIENCIA</h2>
<ul>
	<a href="http://unidadedamullereciencia.xunta.es/informacion/cadernos">Cadernos</a>: informaci&oacute;n relacionada con la situaci&oacute;n de las mujeres en el &aacute;mbito de la investigaci&oacute;n y la ciencia.
</ul>

<h2>SECRETAR&Iacute;A GENERAL DE IGUALDAD</h2>
<ul>
	<a href="http://igualdade.xunta.es/es/content/datos-de-violencia-de-genero">Datos sobre violencia de g&eacute;nero</a>
</ul>
	',	'Estad&iacute;sticas,Galicia'),

(161, 'Islas Baleares', '
<h1>Estad&iacute;sticas</h1>
<h2>IBESTAT. INSTITUT D&rsquo;ESTAD&Iacute;STICA DE LES ILLES BALEARS</h2>
<ul>
	<a href="http://ibestat.caib.es/ibestat/page&#63;f=default&amp;p=px_publicaciones&amp;nodeId=c7d3c898-fd7f-44cc-9375-81b5c088e069">Datos sobre educaci&oacute;n</a>: incluye informaci&oacute;n sobre ense&ntilde;anza no universitaria, gasto p&uacute;blico en educaci&oacute;n y participaci&oacute;n de personas adultas en educaci&oacute;n formal y no formal.
	<a href="http://www.ibestat.cat/ibestat/page&#63;p=px_tablas&amp;nodeId=31185a38-674c-4f2b-b67a-00edf742bf9b">Caracter&iacute;sticas de la poblaci&oacute;n</a> seg&uacute;n nivel de estudios y sexo, poblaci&oacute;n de m&aacute;s de 16 a&ntilde;os que ha interrumpido sus estudios.
</ul>

<h2>INSTITUTO NACIONAL DE ESTAD&Iacute;STICA</h2>
<ul>
	<a href="http://www.ine.es/inebmenu/mnu_educa.htm">Estad&iacute;sticas sobre educaci&oacute;n</a>: con informaci&oacute;n desagregada por CCAA y por sexo en relaci&oacute;n a la ense&ntilde;anza universitaria, no universitaria, educaci&oacute;n de personas adultas, transici&oacute;n educativo-formativa e inserci&oacute;n laboral, gasto y financiaci&oacute;n de centros privados y gasto de los hogares en educaci&oacute;n.
</ul>

<h2>GOVERN DE LES ILLES BALEARS: DIRECCI&Oacute;N GENERAL DE ECONOM&Iacute;A Y ESTAD&Iacute;STICAS</h2>
<ul>
	<a href="http://www.caib.es/sacmicrofront/contenido.do&#63;mkey=M08100212155817041390&amp;lang=ES&amp;cont=10655">Estudios sobre la situaci&oacute;n de las mujeres</a> y de diferentes colectivos en el mercado laboral en las Islas Baleares, con informaci&oacute;n sobre distintos a&ntilde;os.
</ul>

<h2>INSTITUT D&apos;AVALUACI&Oacute; I QUALITAT DEL SISTEMA EDUCATIU DE LES ILLES BALEARS (IAQSE)</h2>
<ul>
	<a href="http://iaqse.caib.es/indicadors_1.htm">Indicadores del sistema educativo balear</a>: con informaci&oacute;n sobre escolarizaci&oacute;n, gasto p&uacute;blico y resultados del alumnado en la educaci&oacute;n reglada.
	<a href="http://iaqse.caib.es/infopub_1.htm">Informes y publicaciones</a>
</ul>

<h2>OBSERVATORIO MUNICIPAL DE PALMA</h2>
<ul>
	<a href="http://www.observatoripalma.org/publicaciones/index.es.html&#63;tIte=mujer&amp;sqlw_tema=82">Datos relacionados con la igualdad entre mujeres y hombres</a>
</ul>
	',	'Estad&iacute;sticas,Islas Baleares'),

(162, 'La Rioja', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUTO NACIONAL DE ESTAD&Iacute;STICA</h2>
<ul>
	<a href="http://www.ine.es/inebmenu/mnu_educa.htm">Estad&iacute;sticas sobre educaci&oacute;n</a>: con informaci&oacute;n desagregada por sexo, as&iacute; como por ciudades y comunidades aut&oacute;nomas, en relaci&oacute;n a la ense&ntilde;anza universitaria, no universitaria, educaci&oacute;n de personas adultas, transici&oacute;n educativo-formativa e inserci&oacute;n laboral, gasto y financiaci&oacute;n de centros privados y gasto de los hogares en educaci&oacute;n. Permite encontrar informaci&oacute;n actualizada sobre La Rioja en el apartado con datos sobre las diferentes ciudades y comunidades aut&oacute;nomas:
	<a href="http://www.ine.es/jaxi/menu.do&#63;type=pcaxis&amp;path=%#37;2Ft13%#37;2Fp405&amp;file=inebase&amp;L=0">Estad&iacute;stica de ense&ntilde;anza universitaria</a>
	<a href="http://www.ine.es/jaxi/menu.do&#63;type=pcaxis&amp;file=pcaxis&amp;path=%#37;2Ft13%#37;2Fp405%#37;2F%#37;2Fa2010-2011">Pruebas de acceso a la universidad</a>
</ul>

<h2>INSTITUTO ESTAD&Iacute;STICO DE LA RIOJA</h2>
<ul>
	<a href="http://www.larioja.org/npRioja/default/defaultpage.jsp&#63;idtab=783293">Mujeres y Hombres en La Rioja. Estad&iacute;sticas de g&eacute;nero</a>: incluye un apartado dedicado a Educaci&oacute;n y Deporte.
	<a href="http://pentaho.larioja.org/pentaho/ESTADISTICA/nuevo/encuestas/imasd.jsp">Estad&iacute;stica sobre participaci&oacute;n en I + D</a>, con informaci&oacute;n sobre mujeres y hombres en la investigaci&oacute;n.
</ul>

<h2>MINISTERIO DE EDUCACI&Oacute;N, CULTURA Y DEPORTE&nbsp;</h2>
<ul>
	<a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/dms/mecd/servicios-al-ciudadano-mecd/estadisticas/educacion/indicadores-publicaciones-sintesis/datos-cifras/datos-y-cifras-2012-2013-web-pdf.pdf">Datos y cifras. Curso escolar 2012-2013</a>. Con informaci&oacute;n de car&aacute;cter estatal y auton&oacute;mico relativa a la situaci&oacute;n del alumnado, profesorado, resultados y nivel educativo de la poblaci&oacute;n, ense&ntilde;anza, TIC, inversi&oacute;n en educaci&oacute;n y aprendizaje de lenguas extranjeras.
	<a href="http:// http://www.mecd.gob.es/dctm/cee/informe2012/i2012cee.pdf&#63;documentId=0901e72b8145b4f2 ">Informe 2013 sobre el estado del sistema educativo</a>. Informaci&oacute;n de car&aacute;cter estatal y auton&oacute;mico sobre el nivel de estudios de la poblaci&oacute;n adulta, nivel socioecon&oacute;mico y cultural de las familias, inmigraci&oacute;n en los centros educativos, financiaci&oacute;n p&uacute;blica de la educaci&oacute;n, ordenaci&oacute;n de las ense&ntilde;anzas, pol&iacute;ticas para la igualdad de oportunidades, pol&iacute;ticas para la calidad educativa, pol&iacute;ticas en el &aacute;mbito de gesti&oacute;n del MECD, resultados del sistema educativo y propuestas de mejora.
</ul>
	',	'Estad&iacute;sticas,La Rioja'),

(163, 'Madrid', '
<h1>Estad&iacute;sticas</h1>
<h2>CONSEJER&Iacute;A DE EDUCACI&Oacute;N, JUVENTUD Y DEPORTE</h2>
<ul>
	<li><a href="http://www.madrid.org/cs/Satellite&#63;c=CM_InfPractica_FA&amp;cid=1142558405036&amp;idTema=1142598845043&amp;language=es&amp;pagename=ComunidadMadrid%#37;2FEstructura&amp;perfil=1273044216036&amp;pid=1273078188154">Datos y cifras de la educaci&oacute;n</a>: incluye informaci&oacute;n relevante sobre el alumnado, el profesorado y los centros educativos, teniendo en cuenta el nivel de ense&ntilde;anza, zona geogr&aacute;fica o titularidad. Contiene datos desagregados por sexo e informaci&oacute;n sobre el alumnado inmigrante.</li>
	<li><a href="http://www.madrid.org/cs/Satellite&#63;c=CM_InfPractica_FA&amp;cid=1142530228466&amp;idTema=1142598845043&amp;language=es&amp;pagename=ComunidadMadrid%#37;2FEstructura&amp;pid=1273078188154">Estad&iacute;stica de la Ense&ntilde;anza</a>: incluye algunos datos sobre el alumnado y sus resultados acad&eacute;micos desagregados por sexo, adem&aacute;s de datos generales sobre profesorado.</li>
</ul>

<h2>INSTITUTO DE ESTAD&Iacute;STICA DE LA COMUNIDAD DE MADRID</h2>
<ul>
	<li><a href="http://www.madrid.org/iestadis/fijas/estructu/general/anuario/ianucap05.htm">Anuario Estad&iacute;stico de la Comunidad de Madrid 1985-2014</a>. Educaci&oacute;n, formaci&oacute;n e investigaci&oacute;n: ofrece datos sobre mujeres y hombres en relaci&oacute;n a la ense&ntilde;anza universitaria, no universitaria, as&iacute; como formaci&oacute;n dirigida a personas desempleadas, gasto p&uacute;blico en educaci&oacute;n y gastos e ingresos de la ense&ntilde;anza primaria no universitaria...</li>
	<li><a href="http://www.madrid.org/desvan/AccionLlamadaArbolDesvan_dwr.icm&#63;tipoArbol=desvan">Desv&aacute;n. Banco de datos Estructurales</a>: incluye un apartado sobre educaci&oacute;n, formaci&oacute;n e investigaci&oacute;n, con algunos datos desagregados por sexo.</li>
	<li><a href="http://www.madrid.org/iestadis/fijas/estructu/sociales/iindigen.htm">Indicadores de g&eacute;nero 2012</a>:  incluye datos desagregados por sexo en relaci&oacute;n a la educaci&oacute;n, la  poblaci&oacute;n, empleo, justicia y seguridad, protecci&oacute;n social, condiciones  de vida, cultura y ocio y participaci&oacute;n ciudadana. El apartado sobre Educaci&oacute;n  aporta informaci&oacute;n muy detallada sobre alumnado y profesorado de las  diferentes etapas de la educaci&oacute;n, as&iacute; como tasas de escolarizaci&oacute;n e  idoneidad y datos sobre abandono escolar.</li>
</ul>
	',	'Estad&iacute;sticas,Madrid'),

(164, 'Melilla', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUTO NACIONAL DE ESTAD&Iacute;STICA</h2>
<ul>
	<a href="http://www.ine.es/inebmenu/mnu_educa.htm">Estad&iacute;sticas sobre educaci&oacute;n y formaci&oacute;n</a> con informaci&oacute;n desagregada por CCAA y por sexo en relaci&oacute;n a la ense&ntilde;anza universitaria, no universitaria, educaci&oacute;n de personas adultas, transici&oacute;n educativo-formativa e inserci&oacute;n laboral, gasto y financiaci&oacute;n de centros privados y gasto de los hogares en educaci&oacute;n.
</ul>

<h2>MINISTERIO DE EDUCACI&Oacute;N, CULTURA Y DEPORTE</h2>
<ul>
	<a href="http://www.mecd.gob.es/servicios-al-ciudadano-mecd/dms/mecd/servicios-al-ciudadano-mecd/estadisticas/educacion/indicadores-publicaciones-sintesis/datos-cifras/datos-y-cifras-2012-2013-web-pdf.pdf ">Datos y cifras. Curso escolar 2012-2013</a>. Con informaci&oacute;n relativa a la situaci&oacute;n del alumnado, profesorado, resultados y nivel educativo de la poblaci&oacute;n, ense&ntilde;anza, TIC, inversi&oacute;n en educaci&oacute;n y aprendizaje de lenguas extranjeras en diferentes CCAA, incluyendo Ceuta y Melilla.
	<a href="http://www.mecd.gob.es/dctm/cee/informe2012/i2012cee.pdf&#63;documentId=0901e72b8145b4f2">Informe 2013 sobre el estado del sistema educativo</a>. Informaci&oacute;n comparativa de las diferentes CCAA, incluyendo Melilla, as&iacute; como de car&aacute;cter estatal. Incluye datos sobre&nbsp; nivel de estudios de la poblaci&oacute;n adulta, nivel socioecon&oacute;mico y cultural de las familias,&nbsp; inmigraci&oacute;n en los centros educativos, financiaci&oacute;n p&uacute;blica de la educaci&oacute;n, ordenaci&oacute;n de las ense&ntilde;anzas, pol&iacute;ticas para la igualdad de oportunidades, pol&iacute;ticas para la calidad educativa, pol&iacute;ticas en el &aacute;mbito de gesti&oacute;n del MECD (Incluye un apartado sobre pol&iacute;ticas en Ceuta y Melilla), resultados del sistema educativo y propuestas de mejora.
	<a href="https://sede.educacion.gob.es/publiventa/detalle.action&#63;cod=14574">Informe sobre el estado y situaci&oacute;n del sistema educativo. Ceuta y Melilla. Curso 2009/2010</a>
</ul>

<h2>OTRAS ENTIDADES</h2>
<ul>
	<a href="http://www.empleo.gob.es/uafse_2000-2006/es/2007-2013/prog-operativos/Melilla.pdf">Informe del Programa Operativo 2007-2013</a>.
	<a href="http://www.e-igualdad.net/sites/default/files/fichas/melilla_ficha.pdf">Brecha digital en Melilla</a>.
	<a href="http://www.e-igualdad.net/estadisticas-estudios-igualdad">E-IGUALDAD.NET</a>.
</ul>
	',	'Estad&iacute;sticas,Melilla'),

(165, 'Murcia', '
<h1>Estad&iacute;sticas</h1>
<ul>
	<li><a href="http://www.carm.es/econet/ecodata/toda_informacion.html">CENTRO REGIONAL DE ESTAD&Iacute;STICAS DE MURCIA</a></li>
	<li><a href="http://www.carm.es/econet/sicrem/PU25/">Estad&iacute;sticas sobre educaci&oacute;n:</a> contiene informaci&oacute;n desagregada por sexo sobre profesorado y alumnado de diferentes niveles de la educaci&oacute;n reglada,&nbsp; educaci&oacute;n permanente de personas adultas y datos sobre centros p&uacute;blicos y privados.</li>
	<li><a href="http://www.carm.es/econet/sicrem/PU_datosBasicos/Indice14.html">Datos b&aacute;sicos regionales y municipales de Murcia</a>, algunos de ellos desagregados por sexo, en relaci&oacute;n a diversos &aacute;mbitos, como la educaci&oacute;n, demograf&iacute;a, mercado de trabajo, sanidad, cultura y ocio, calidad y condiciones de vida, sociedad de la informaci&oacute;n o la justicia.</li>
	<li><a href="http://www.carm.es/econet/publica/catalogo_est_sintesis1.html">Anuario Estad&iacute;stico</a>: incluye informaci&oacute;n desagregada por sexo en relaci&oacute;n con la educaci&oacute;n, as&iacute; como con otras cuestiones relevantes.</li>
	<li><a href="http://www.carm.es/econet/municipios/municipios_cifras.html">Municipios en cifras</a>: podemos encontrar datos de los distintos municipios de Murcia en relaci&oacute;n a diversos &aacute;mbitos, entre ellos el educativo. Algunos de los datos que figuran reflejan la situaci&oacute;n diferencial de hombres y mujeres, chicas y chicos.</li>
	<li><a href="http://www.carm.es/web/pagina&#63;IDCONTENIDO=23040&amp;IDTIPO=100&amp;RESULTADO_INFERIOR=1&amp;RESULTADO_SUPERIOR=10&amp;RASTRO=c1775$m">PUBLICACIONES RELACIONADAS CON LA MUJER</a>: contiene, entre otros, <a href="http://www.carm.es/web/pagina&#63;IDCONTENIDO=23040&amp;IDTIPO=100&amp;RESULTADO_INFERIOR=11&amp;RESULTADO_SUPERIOR=16&amp;RASTRO=c1775$m">estudios sobre la situaci&oacute;n de las mujeres en la regi&oacute;n</a> desarrollados y publicados en distintos a&ntilde;os, con referencias a la educaci&oacute;n.</li>
</ul>
	',	'Estad&iacute;sticas,Murcia'),

(166, 'Navarra', '
<h1>Estad&iacute;sticas</h1>
<h2>INSTITUTO DE ESTAD&Iacute;STICA DE NAVARRA</h2>
<ul>
	<li><a href="http://www.cfnavarra.es/estadistica/redie.asp&#63;qry=0301">Indicadores de g&eacute;nero</a>: incluye indicadores de g&eacute;nero (por ejemplo, n&uacute;mero de mujeres por cada hombre con estudios secundarios) en relaci&oacute;n a diversos &iacute;tems. Asimismo, ofrece informaci&oacute;n desagregada por sexo sobre &aacute;mbitos como la educaci&oacute;n, demograf&iacute;a,&nbsp; trabajo y salarios, salud, justicia, condiciones de vida, ocio y deporte, TIC, conciliaci&oacute;n de vida laboral y familiar, desarrollo sostenible, empleo del tiempo, protecci&oacute;n social, discapacidad y dependencia.</li>
</ul>

<h2>DEPARTAMENTO DE EDUCACI&Oacute;N. GOBIERNO DE NAVARRA</h2>
<ul>
	<li><a href="http://www.educacion.navarra.es/web/dpto/evaluacion-y-calidad/evaluacion/evaluaciones-internacionales/pisa">Informe Pisa Navarra</a>. Programa internacional de evaluaci&oacute;n del sistema educativo, en el que participan los pa&iacute;ses de la OCDE, as&iacute; como otros pa&iacute;ses asociados. Este estudio se repite cada tres a&ntilde;os, y examina las competencias lectora, matem&aacute;tica y cient&iacute;fica. La Comunidad Foral de Navarra tambi&eacute;n participa con muestra representativa, lo que posibilita su comparaci&oacute;n con los resultados de los pa&iacute;ses evaluados.</li>
</ul>

<h2>DEPARTAMENTO DE POL&Iacute;TICAS SOCIALES. GOBIERNO DE NAVARRA</h2>
<ul>
	<li><a href="http://www.navarra.es/home_es/Gobierno+de+Navarra/Organigrama/Los+departamentos/Asuntos+Sociales+Familia+Juventud+y+Deporte/Publicaciones/Publicaciones+propias/Igualdad+de+Genero/programa.htm">Estudios relacionados con la igualdad entre mujeres y hombres,</a> como el de Situaci&oacute;n de las mujeres en Navarra 2009, que incluye un apartado dedicado a la Educaci&oacute;n, con informaci&oacute;n sobre el nivel educativo, ense&ntilde;anza universitaria y no universitaria, profesorado y TIC.</li>
</ul>
	',	'Estad&iacute;sticas,Navarra'),

(167, 'Pa&iacute;s Vasco', '
<h1>Estad&iacute;sticas</h1>
<h2>EUSTAT</h2>
<ul>
	<li><a href="http://www.eustat.es/estadisticas/tema_279/opt_0/tipo_10/ti_Educacion/temas.html#axzz1RmOq2z5d">Estad&iacute;sticas sobre Educaci&oacute;n sobre mujeres y hombres</a> en diferentes niveles, modalidades y ramas de la educaci&oacute;n reglada.</li>
	<li><a href="http://www.eustat.es/estadisticas/idioma_c/tipo_10/arbol.html#axzz1RmOq2z5d">&ldquo;Igualdad de mujeres y hombres&rdquo;:</a> permite conocer las diferencias entre hombres y mujeres en relaci&oacute;n a diversos &iacute;tems relacionados con el &aacute;mbito demogr&aacute;fico, laboral, sanitario, educativo, cultural, deportivo, la inclusi&oacute;n, los h&aacute;bitos sociales, la justicia y la violencia contra las mujeres, las elecciones y el medio ambiente.</li>
	<li><a href="http://www.eustat.es/estadisticas/opt_0/id_299/ti_Educacion/subarbol.html#axzz1RmOq2z5d">Estad&iacute;sticas sobre Educaci&oacute;n:</a> incluye datos desagregados por sexo sobre el alumnado, el profesorado y los centros p&uacute;blicos y privados del Pa&iacute;s Vasco, as&iacute; como informaci&oacute;n relacionada con el gasto y financiaci&oacute;n de la educaci&oacute;n reglada.</li>
	<li><a href="http://www.eustat.es/estadisticas/opt_0/tipo_2/id_299/ti_Educacion/arbol.html#axzz1RmOq2z5d">Indicadores gr&aacute;ficos sobre educaci&oacute;n, investigaci&oacute;n y otros &aacute;mbitos</a>: ofrece gr&aacute;ficos con informaci&oacute;n desagregada por sexo sobre alumnado, profesorado, centros educativos, nivel de instrucci&oacute;n e investigaci&oacute;n, as&iacute; como en relaci&oacute;n a otras cuestiones de los &aacute;mbitos demogr&aacute;fico, econ&oacute;mico, social, cultural, sanitario y tecnol&oacute;gico.</li>
	<li><a href="http://www.eustat.es/bancopx/spanish/Sociedad/Educaci%#37;C3%#37;B3n/Ense%#37;C3%#37;B1anza/Indicadores%#37;20de%#37;20la%#37;20ense%#37;C3%#37;B1anza/Indicadores%#37;20de%#37;20la%#37;20ense%#37;C3%#37;B1anza.html#axzz1RmOq2z5d">Indicadores de la ense&ntilde;anza</a>: informaci&oacute;n, en muchos casos desagregada por sexo, sobre la ense&ntilde;anza reglada y la actividad escolar (tasas de escolaridad, ratios profesorado/alumnado, tasas de idoneidad, porcentajes de alumnado que aprueba, que repite y que promociona&hellip;).</li>
	<li><a href="http://www.eustat.es/estad/temalista.asp&#63;tema=279&amp;tipo=3&amp;opt=0&amp;mas=&amp;idioma=c&amp;otro=#axzz1yn4AEgib">Informe Mujeres y hombres en Euskadi</a>: informe de la situaci&oacute;n de hombres y mujeres en cuanto a la educaci&oacute;n, la demograf&iacute;a, la salud, cultura y deportes, inclusi&oacute;n social, h&aacute;bitos sociales, elecciones y medio ambiente.</li>
</ul>

<h2>DEPARTAMENTO DE EDUCACI&Oacute;N, POL&Iacute;TICA LING&Uuml;&Iacute;STICA Y CULTURA, GOBIERNO VASCO</h2>
<ul>
	<li><a href="http://www.isei-ivei.net/cast/pub/indexpub.htm">Publicaciones sobre el sistema educativo vasco</a>: este enlace permite acceder a informes con datos desagregados por sexo, como el Informe Pisa, la Evaluaci&oacute;n diagn&oacute;stica, o investigaciones sobre maltrato entre iguales y abandono escolar.</li>
	<li><a href="http://www.hezkuntza.ejgv.euskadi.net/r43-573/es/contenidos/informacion/dia4/es_indice/inicio.html">Informaci&oacute;n general / Estad&iacute;sticas sobre el sistema educativo</a>: incluye algunos datos desagregados por sexo sobre alumnado y profesorado de diferentes centros, niveles y territorios.</li>
</ul>

<h2>EMAKUNDE, INSTITUTO VASCO DE LA MUJER</h2>
<ul>
	<li><a href="http://www.emakunde.euskadi.net/u72-20010/es/contenidos/informacion/pub_informes/es_emakunde/informes_es.html#Informes%#37;20publicados">Publicaciones</a> que ilustran la situaci&oacute;n de las mujeres en Euskadi, con atenci&oacute;n a diversos colectivos y situaciones: desde informes de la situaci&oacute;n de mujeres y hombres hasta estudios sobre adolescentes, desigualdad en el &aacute;mbito laboral, cuidados, mujeres mayores, mujeres en prostituci&oacute;n e informes de evaluaci&oacute;n de diversas pol&iacute;ticas y servicios.</li>
	<li><a href="https://www.euskadi.net/contenidos/informacion/pub_informes/es_emakunde/adjuntos/informe.21.coeducacioncapv.cas.pdf">La Coeducaci&oacute;n en la Comunidad Aut&oacute;noma del Pa&iacute;s Vasco. Evoluci&oacute;n y estrategias de futuro</a>. Informe.</li>
</ul>
	',	'Estad&iacute;sticas,Pa&iacute;s Vasco');

Insert into ENLACES_PAGINAS_ESTATICAS (	ID_PAGINA_PADRE, ID_PAGINA_HIJA) values
(148, 149),(148, 150),(148, 151),(148, 152),(148, 153),(148, 154),(148, 155),(148, 156),(148, 157),(148, 158),
(148, 159),(148, 160),(148, 161),(148, 162),(148, 163),(148, 164),(148, 165),(148, 166),(148, 167);