#Combien y a-t-il de journalistes dans ce tableau ?
def cpt_nb_handle(list)
	return list.length
end

#Test d'inclusion d'une sous-string(sous_str) dans une string (handle)
def cherche_sous_str(handle,sous_str)
	sous_str = sous_str.to_s
	return handle.include? sous_str
end

#Test d'inclusion d'un chiffre dans une string (handle)
def test_handle_chiffre(handle)
	test = false
	for i in 0..9
		#puts "Valeur cherchée : #{i}"
		test = test || cherche_sous_str(handle,i)
		break if test
	end
	#puts "Boucle arrêtée pour i = #{i}"
	return test
end

#Retourne le nombre de handle qui possède au moins 1 chiffre
def test_list_chiffre(base)
	nb_handle_ok = 0
	for i in 0...base.length
		if test_handle_chiffre(base[i])
			nb_handle_ok += 1
		end
	end
	return nb_handle_ok
end

def test_list_sous_str(base, ss_str)
	nb_handle_ok = 0
	for i in 0...base.length
		handle_downcase = base[i].downcase
		if cherche_sous_str(handle_downcase,ss_str)
			nb_handle_ok += 1
		end
	end
	return nb_handle_ok
end

def nb_handle_begin_avec_maj(base)
	nb_handle_ok = 0
	for i in 0...base.length
		if base[i][1] >= "A" && base[i][1] <="Z"
			nb_handle_ok += 1
		end
	end
	return nb_handle_ok	
end

def nb_handle_avec_maj(base)
	nb_handle_ok = 0
	for i in 0...base.length
		#puts "Handle : #{base[i]}"
		#puts ".. sa longueur : #{base[i].length}"
		for j in 1...base[i].length
			#test = base[i][j] =~ /[A-Z]/
			#puts "Lettre : #{base[i][j]}"
			#puts "Lettre supérieur à 'A' : #{base[i][j] >= "A"}"
			#puts "Lettre inférieure à 'Z' : #{base[i][j] <= "Z"}"
			condition = (base[i][j] >= "A" && base[i][j] <= "Z")
            if condition
            	nb_handle_ok += 1
            	break if condition
        	end
        end
    end
    return nb_handle_ok
end

def nb_underscore(base)
	nb_handle_ok = 0
	for i in 0...base.length
		for j in 1...base[i].length
			if base[i][j] == "_"
            	nb_handle_ok += 1
        	end
        end
    end
    return nb_handle_ok
end

def affiche_n_premiers_elmt(base,n)
	for i in 0...n
		print "[#{base[i]}]"
	end
	puts ""
end

def tri_liste(base)
	puts "========== Tri de la liste =========="
	puts "Liste initiale - Affichage des 6 premiers éléments :"
	puts "#{affiche_n_premiers_elmt(base,6)} ..."
	base = base.sort
	puts "Nouvelle liste - Affichage des 6 nouveaux premiers éléments :"
	puts "#{affiche_n_premiers_elmt(base,6)} ..."
end

def longueur_max_handle(base)
	longueur = 0
	for i in 0...base.length
		if base[i].length > longueur
			longueur = base[i].length
		end
    end
    #puts "Le handle le plus long fait #{longueur} caractères"
    return longueur
end

def n_premiers_elements(base,n)
	list_premiers = []
	nb_elmt_ajoutes = 0
	for i in 1...longueur_max_handle(base)
		for j in 0...base.length
			if base[j].length == i
				list_premiers << base[j]
				nb_elmt_ajoutes += 1
				#puts "Ajout du handle #{base[j]} dans la nouvelle liste"
				break if nb_elmt_ajoutes == n
			end
		end
		break if nb_elmt_ajoutes == n
    end
    puts "Listes des #{n} handles les plus courts :"
    puts "#{list_premiers}"
    return list_premiers
end

def position_nom(base,nom)
	position = 0
	for i in 0...base.length
		if base[i] == nom
			position = i+1
			puts "Le nom #{nom} est en position #{position} de la base"
			break if position > 0
		end
    end
    if position == 0
    	puts "Le nom n'a pas été trouvé dans la base"
    end
end

def entete
	puts ""
	puts "===== Réponse ====="
end

def pied_page
	puts "==================="
	puts "" * 2
end

def perform
	puts "" * 3
	begin
		journalists = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau","@gaellombart","@bendarag","@AurelieLebelle","@julienduffe","@thomaspoupeau","@LilyRossignol","@ClairGuedon","@stephanieauguy","@claw_prolongeau","@_JulieMenard","@LColcomb","@Zlauwereys","@MeLonguet","@DorotheeLN","@NolwennCosson","@ADaboval","@Remibaldy","@bderveaux","@amandechap","@ELODIESOULIE","@nbongarcon","@HeloAb","@Panamorama","@gregplou","@BenoitBerthe","@LauraBruneau89","@Anthony_Lieures","@Sharonwaj","@mcsonkin","@pverduzier","@emiliel3","@Julien_MARION","@SophiFay","@bdelombre","@annalecerf","@AdriaBudry","@DejNikolic","@iJaffre","@CyrusleVirus","@GPardigon","@e_vallerey","@IsabelleSouquet","@AudeDavidRossi","@Yoann_Pa","@CeliaPenavaire","@perraultvincent","@cboulate","@JustineWeyl","@Paulinejacot","@juliechab","@aslechevallier","@phnou","@Seb_Pommier","@Alex_Bensaid","@GuillaumeGaven","@annelaurechouin","@Oliviader","@guerricp","@JMMarchaut","@cyceron","@gregory_raymond","@vhunsinger","@l_peillon","@fannyguinochet","@EAssayag","@KibweAdom","@YvonHerry","@JohanGarciajg","@saidlabidi","@lauranneprov","@LeaDavy","@francois_remy","@CGuicheteau","@FloMaillet","@m_perroud","@oBrunet_TSMF","@MoonVdc","@jc2taille","@NellyMoussu","@VirginK","@b_misa","@FabriceCouste","@barbara_prose","@lelia2m","@brunoaskenazi","@laurenechamp","@ysisbox","@juliengagliardi","@PierreLel","@kdeniau","@_TerraInc","@DominicArpin","@antoinfonteneau","@nanotousch","@jb_roch","@YaniKhezzar","@Anne_Bechet","@NCapart","@SamyBenNaceur","@Joumany","@Julietteraynal","@TGiraudet","@SaraTanit","@HappeFrederic","@antoinellorca","@michelpicot","@Sev_Ryne","@bobdobolino","@murdever","@YGrandmontagne","@Mnyo","@EdKOSCIANSKI","@tnoisette","@jankari","@delbello_rom","@rflechaux","@NadiaSorelli","@IT_Digital","@abarbaux","@PhilippeLeroy","@schaptal","@marionspee","@lisavignoli","@ChloeAeberhardt","@MartineJacot","@JuliaPascualita","@curieusedetout","@sgraveleau","@bif_o","@ElisaPineau","@zinebdryef","@apiquard","@pierrehaski","@StephanieDelmas","@Blandine_Garot","@vergara_i","@evan_lebastard","@SophieVclt","@OlivierLevrault","@alicedorgeval","@LouiseMalnoy","@alix_fx","@pierre_baudis","@LucMagoutier","@AgatheMuller","@SGianninelli","@PaulineBoyer33","@NaomiHalll","@romaindlx","@marionbr","@Burtschy","@JacobEtienne","@as_lizzani","@marie_simon","@LaureDaussy","@FabriceAmedeo","@LoubnaChlaikhy","@PlummerWilliam","@OlivierMarin1","@alaurefremont","@mwesfreid","@ChBaDe","@pmathon","@theobaldmarie","@Lnpagesy","@marclandre","@paoliniesther","@Feertchak","@JBLitzler","@GuillaumeErrard","@quentinperinel","@TristanQM","@mlbo","@constancejamet","@LoraTerrazas","@emiliegeffray","@Mathilde_Sd","@CaroPiquet","@DCanivez","@TIM_7375","@blandinelc","@ivanrioufol","@arthurberdah","@SarahLecoeuvre","@guillaume_gui","@DamienMercereau","@W_Chloe","@Assma_MD","@EugenieBastie","@HiTech_lexpress","@bcondominas","@Laurie_Z_","@jeanfrancgerard","@MathieuPagura","@BGUYF","@AlainPiffaretti","@AudreyKucinskas","@julienhory","@Pierrefalga","@TiphThuillier","@cdaniez","@LigerBaptiste","@D_Peras","@julie_dlb","@Fatiha_Temmouri","@julian2lamancha","@GaetaneDeljurie","@JulianMattei","@M_Vicuna","@DeBruynOlivier","@Nehed_Jendoubi","@antoine_grenapi","@ColonnaGen","@VictoriaGairin","@Clement_Lacombe","@TVigoureux","@MargauxObriot","@solinedelos","@RocheSabine","@dangerkens","@EdouardDutour","@MDondeyne","@DupuisNathalie1","@bouscarel","@Mathieu2jean","@Sophie_T_J","@laurentcalixte","@patrockwilliams","@PascaleKremer","@AlexJaquin","@LauraIsaaz","@cath_robin","@Del_Gautherin","@Isaduriez","@lucietuile","@AugeyBastien","@mcastagnet","@AminaKalache","@mvaudano","@CParrot","@ombelinetips","@_JoinLion","@BarbolosiRose","@ToiBruno1","@FloraClodic","@xjbdx","@AlexiaEy","@Emjy_STARK","@elcoco01","@rabilebon","@pflovens_","@FabriceFrossard","@MorganeSERRES","@MarjolaineKoch","@edgarsnow","@SRNLF","@CChassigneux","@KerinecMoran","@NassiraELM","@NewsRicard","@Sandreene","@Emilezrt","@Pierre_Do","@Micode","@CColumelli","@DavidAbiker","@ClementBergantz","@benjaminrabier","@celinekallmann","@edwyplenel","@C_Barbier","@JJBourdin_RMC","@LaurenceFerrari","@aslapix","@IsaMillet","@MaximeSwitek","@tomjoubert","@jszanchi","@roqueeva","@XavierBiseul","@florencesantrot","@AntoineCrochet","@freeman59","@MaudeML","@philippe_gulpi","@mathieum76","@kiouari","@imanemoustakir","@BenedicteMallet","@Emilie_Brouze","@antoinebarret","@_nicolasbocquet","@remibuhagiar","@CourretB","@AymericRobert","@miraelmartins","@pmaniere","@jesuisraphk","@David_Ingram","@pcelerier","@technomedia","@Geraldinedauver","@ThierryLabro","@Newsdusud","@nrauline","@gbregeras","@SCouasnonBFM","@actualites_nrv","@dimitrimoulins","@oli_aura","@FabieChiche","@Vincent_Raimblt","@ChristophGreuet","@PAlbuchay","@MarrauddesGrot","@vtalmon","@cedric","@olivierfrigara","@Julien_Jay","@LydiaBerroyer","@Shuua","@datisdaz","@Steuph","@ameliecharnay","@Bruno_LesNums","@LelloucheNico","@CciliaDiQuinzio","@Elodie_C","@SylvRolland","@Kocobe","@FL_Debes","@jdupontcalbo","@GarciaVictor_","@NicoRichaud","@RHoueix","@simottel","@DamienLicata","@annabelle_L","@Lea_Lejeune","@axel_deb","@marin_eben","@ptiberry","@MatthieuDelach","@sandrinecassini","@benjaminferran","@ppgarcia75","@NotPatrick","@ivalerio","@FabienneSchmitt","@alexgoude","@JeromeColombain","@manhack","@Capucine_Cousin","@Fsorel","@oliviertesquet","@marjoriepaillon","@ginades","@PierreTran","@DelphineCuny","@reesmarc","@lauratenoudji","@ldupin","@carolinedescham","@Lucile_Quillet","@cgabizon","@Allocab","@epenser","@JAGventeprivee","@frwrds","@Laure__Bourdon","@Xavier75","@maximeverner","@s_jourdain","@LoriHelloc"]
		journalists_test = ["@jcunniet","@PaulLampon","@Aziliz31","@ssoumier","@marionsouzeau"]
		
		puts "================== Bonjour et bienvenu sur l'exercice sur le hashage ! =================="
		puts "===> Taper 1 pour compter le nombre de journalistes dans le tableau"
		puts "===> Taper 2 pour compter le nombre de handle avec un numéro"
		puts "===> Taper 3 pour compter le nombre de handle contenant 'aude' (ou ses variantes)"
		puts "===> Taper 4 pour compter le nombre de handle commençant par une majuscule (après le @)"
		puts "===> Taper 5 pour compter le nombre de handle contenant au moins 1 majuscule"
		puts "===> Taper 6 pour compter le nombre de '_' dans tous les pseudos"
		puts "===> Taper 7 pour trier la liste des handle dans le sens alphanumérique"
		puts "===> Taper 8 pour identifier les 50 handle les plus courts"
		puts "===> Taper 9 pour identifier la position de @epenser dans le tableau"
		puts "===> Taper 0 pour quitter"
		begin
			print "> "
			choix = gets.chomp.to_i
			if (choix < 0 || choix > 9)
				puts "Saisir non valide. Nouvel essai :"
			end	
		end while (choix < 0 || choix > 9)
		case choix
			when 1
				entete
				puts "Notre base contient #{cpt_nb_handle(journalists)}"
				pied_page
			when 2
				entete
				#puts "Est-ce que @jcunniet contient 'n' : #{cherche_sous_str("@jcunniet","n")}"
				#puts "Est-ce que @jcunniet contient un chiffre : #{test_handle_chiffre("@jcunniet")}"
				#puts "Est-ce que @Aziliz31 contient un chiffre : #{test_handle_chiffre("@Aziliz31")}"
				puts "Notre base contient #{test_list_chiffre(journalists)} handle avec un chiffre"
				pied_page
			when 3
				entete
				puts "Notre base contient #{test_list_sous_str(journalists,"aude")} handle avec la sous chaine 'aude'"
				pied_page
			when 4
				entete
				#puts "test Upcase! de 'T' : #{"_" == "_".upcase}"
				puts "Notre base contient #{nb_handle_begin_avec_maj(journalists)} handle commençant par une majuscule"
				pied_page
			when 5
				entete
				puts "Notre base contient #{nb_handle_avec_maj(journalists)} handle avec au moins une majuscule"
				pied_page
			when 6
				entete
				#puts "Notre base contient #{nb_handle_avec_maj(journalists_test)} handle avec au moins une majuscule"
				puts "Notre base contient #{nb_underscore(journalists)} underscores"
				pied_page
			when 7
				entete
				tri_liste(journalists)
				pied_page
			when 8
				entete
				n_premiers_elements(journalists,50)
				pied_page
			when 9
				entete	
				position_nom(journalists,"@epenser")
				#position_nom(journalists_test,"@ssoumier")
				#longueur_max_handle(journalists)
				pied_page
			when 0
				break if choix == 0
		end		
	end while choix != 0
end

perform
