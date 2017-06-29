<?php

namespace AP\DossiersBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;


class DefaultController extends Controller
{
    public function indexAction()
    {

        $from = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d"), date("Y")));
        $to = date("Y-m-d H:i:s",mktime(date("H"), date("i"), 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();



        $details = $em->getRepository('APCaisseBundle:commandeprod');

        $data = $details->getByDate($from,$to);
$total = 0;
$marge = 0 ;

foreach ($data as $prix){

    $vente = $prix->getQuantite()*$prix->getProduit()->getPrixvente();
    $margep = $prix->getQuantite()*$prix->getProduit()->getPrixachat();
    $total = $total + $vente ;
    $marge = $marge + ($vente - $margep);



}



$margetotale = number_format($marge, '0', '.', ' ');


$totalvente = number_format($total, '0', '.', ' ');


        return $this->render('APDossiersBundle:Default:index.html.twig',array('details'=>$data,'totalvente'=>$totalvente,'margetotale'=>$margetotale,'from'=>$from,'to'=>$to));



    }




    public function fetchdetailsAction($start,$end)
    {


        $em = $this->getDoctrine()->getManager();



        $details = $em->getRepository('APCaisseBundle:commandeprod');

        $data = $details->getByDate($start,$end);
        $total = 0;
        $marge = 0 ;
        $output=' <table class="table table-striped jambo_table bulk_action" id="product1">
                                        <thead>
                                        <tr class="headings">
                                            <th class="column-title">article </th>
                                            <th class="column-title">Date et heure </th>
                                            <th class="column-title">Vendeur </th>

                                            <th class="column-title">qte </th>
                                            <th class="column-title">prix unit </th>
                                            <th class="column-title">prix vte tot </th>

                                            <th class="column-title">Marge </th>
                                            </th>

                                        </tr>
                                        </thead>

                                        <tbody >';
        foreach ($data as $prix){

            $vente = $prix->getQuantite()*$prix->getProduit()->getPrixvente();
            $margep = $prix->getQuantite()*$prix->getProduit()->getPrixachat();
            $total = $total + $vente ;
            $marge = $marge + ($vente - $margep);

            $output .= '<tr class="even pointer"><td>'.$prix->getProduit()->getDesignation().'</td> <td >'.$prix->getDate()->format('d-m-Y H:i').'</td><td>'.$prix->getBon()->getTicket()->getEmployes()->getUsername().' </td><td>'.$prix->getQuantite().'</td><td>'.number_format($prix->getProduit()->getPrixvente(), '0', '.', ' ').'</td> <td>'.number_format($prix->getQuantite()*$prix->getProduit()->getPrixvente(), '0', '.', ' ').'</td> <td>'.number_format($prix->getQuantite()*$prix->getProduit()->getPrixvente()-$prix->getQuantite()*$prix->getProduit()->getPrixachat(), '0', '.', ' ').'</td> </tr>';


        }
        $margetotale = number_format($marge, '0', '.', ' ');


        $totalvente = number_format($total, '0', '.', ' ');

       $output .='</tbody> </table> <div id="total" style="opacity: 0">'.$totalvente.'</div> <div id="marge" style="opacity: 0">'.$margetotale.'</div>';










        return new Response($output);


    }




    public function vendeurAction()
    {



        $yesterday = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d"), date("Y")));
        $day = date("Y-m-d H:i:s",mktime(date("H")+1, 0, 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.employes) AS serveur,SUM(e.prix) AS balance,e.etat FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$yesterday}' AND '{$day}' AND e.etat = 0 GROUP BY serveur " ;
        $balance = $em->createQuery($dql)
            ->getScalarResult();

        $total=0;
        $users = [];
        foreach ($balance as $b){

            $tmp = [];

            $nom = $em->getRepository('APUsersBundle:employes')->find($b['serveur']);


            $u = $nom->getId();




            $connection = $em->getConnection();
            $statement = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='especes' AND ticket.date BETWEEN '$yesterday' AND '$day'");
            $statement->execute();
            $cmd = $statement->fetchAll();

            foreach ($cmd as $cmdx) {
                $tmp['espece'] = $cmdx['paiemode'];

            }




            $statement1 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='carte' AND ticket.date BETWEEN '$yesterday' AND '$day'");
            $statement1->execute();
            $cmd1 = $statement1->fetchAll();

            foreach ($cmd1 as $cmdx) {
                $tmp['carte'] = $cmdx['paiemode'];
            }


            $statement2 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='Orange Money' AND ticket.date BETWEEN '$yesterday' AND '$day'");
            $statement2->execute();
            $cmd2 = $statement2->fetchAll();

            foreach ($cmd2 as $cmdx) {
                $tmp['orange'] = $cmdx['paiemode'];
            }


            $statement3 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='credit' AND ticket.date BETWEEN '$yesterday' AND '$day'");
            $statement3->execute();
            $cmd3 = $statement3->fetchAll();

            foreach ($cmd3 as $cmdx) {
                $tmp['credit'] = $cmdx['paiemode'];
            }



            $tmp['serveur'] = $nom->getUsername();
            $tmp['id'] = $nom->getId();

                $tmp['balance'] = number_format($b['balance'], '0', '.', ' ');


                $users[] = $tmp;

                $total = $total + $b['balance'];



        }


        $totals  =  number_format($total, '0', '.', ' ');

        return $this->render('APDossiersBundle:Default:vendeur.html.twig',array('vendeur'=>$users,'from'=>$yesterday,'to'=>$day,'total'=>$totals));



    }






    public function fetchvendeurAction($start,$end)
    {





        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.employes) AS serveur,SUM(e.prix) AS balance FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY serveur " ;

        $balance = $em->createQuery($dql)
            ->getScalarResult();

$total = 0 ;
$users = [];
        foreach ($balance as $b){
            $tmp = [];
            $nom = $em->getRepository('APUsersBundle:employes')->find($b['serveur']);
            $u = $nom->getId();






            $connection = $em->getConnection();
            $statement = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='especes' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement->execute();
            $cmd = $statement->fetchAll();

            foreach ($cmd as $cmdx) {
                $tmp['espece'] = $cmdx['paiemode'];

            }




            $statement1 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='carte' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement1->execute();
            $cmd1 = $statement1->fetchAll();

            foreach ($cmd1 as $cmdx) {
                $tmp['carte'] = $cmdx['paiemode'];
            }


            $statement2 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='Orange Money' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement2->execute();
            $cmd2 = $statement2->fetchAll();

            foreach ($cmd2 as $cmdx) {
                $tmp['orange'] = $cmdx['paiemode'];
            }


            $statement3 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='credit' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement3->execute();
            $cmd3 = $statement3->fetchAll();

            foreach ($cmd3 as $cmdx) {
                $tmp['credit'] = $cmdx['paiemode'];
            }



            $tmp['serveur'] = $nom->getUsername();
            $tmp['id'] = $nom->getId();
            $tmp['balance'] = number_format($b['balance'], '0', '.', ' ');


            $users[] = $tmp;
 $total=$total + $b['balance'];



        }



$totals  =  number_format($total, '0', '.', ' ');




$output='';
$totalespece = 0 ;
$totalorange = 0 ;
$totalcarte = 0 ;
$totalcredit = 0 ;

        foreach ($users as $u) {
            $cartebon = number_format($u['carte'], '0', '.', ' ');
			$orangebon = number_format($u['orange'], '0', '.', ' ');
			$especebon = number_format($u['espece'], '0', '.', ' ');
            $creditbon = number_format($u['credit'], '0', '.', ' ');

            $route = $this->generateUrl('ap_caisse_detail_vendeur',array('id'=>$u['id'],'total'=>$u['balance'],'from'=>$start,'to'=>$end,'espece'=>$especebon,'orange'=>$orangebon,'carte'=>$cartebon,'credit'=>$creditbon) );
            if($u['balance']!=0){
            $output .= '<tr class="even pointer"><td class=" ">'.$u['serveur'].'</td> <td class=" ">'.number_format($u['espece'], '0', '.', ' ').'</td> <td class=" ">'.number_format($u['orange'], '0', '.', ' ').'</td><td class=" ">'.number_format($u['carte'], '0', '.', ' ').'</td><td class=" ">'.number_format($u['credit'], '0', '.', ' ').'</td><td class=" ">'.$u['balance'].'
            <td  align="center"><a href="'.$route.'" data-toggle="modal" data-target=".bs-example-modal-sm"  ><i class="fa fa-plus-circle" style="font-size:14px;"></i> </a>


</td></tr>';
$totalespece= $totalespece + $u['espece'];
$totalorange= $totalorange + $u['orange'];
$totalcarte= $totalcarte + $u['carte'];
$totalcredit= $totalcredit + $u['credit'];

            }
        }

        $output .='<tr class="headings" style="background-color: rgba(173, 230, 173, 0.23);"><td> <strong>GRAND TOTAL</strong></td> <td>'.number_format($totalespece, '0', '.', ' ').' Fcfa</td>
                                            <td class=" ">'.number_format($totalorange, '0', '.', ' ').' Fcfa</td>
                                            <td class=" ">'.number_format($totalcarte, '0', '.', ' ').' Fcfa</td><td class=" ">'.number_format($totalcredit, '0', '.', ' ').' Fcfa</td><td colspan="2" id="total" >'.$totals.' Fcfa</td></tr>
                                            
                                            
                                            ';


        return new Response($output);


    }







    public function printvendeurAction($start,$end)
    {





        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.employes) AS serveur,SUM(e.prix) AS balance,e.etat FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$start}' AND '{$end}' AND e.etat = 0 GROUP BY serveur " ;
        $balance = $em->createQuery($dql)
            ->getScalarResult();

        $total=0;
        $users = [];
        foreach ($balance as $b){

            $tmp = [];

            $nom = $em->getRepository('APUsersBundle:employes')->find($b['serveur']);


            $u = $nom->getId();




            $connection = $em->getConnection();
            $statement = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='especes' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement->execute();
            $cmd = $statement->fetchAll();

            foreach ($cmd as $cmdx) {
                $tmp['espece'] = $cmdx['paiemode'];

            }




            $statement1 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='carte' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement1->execute();
            $cmd1 = $statement1->fetchAll();

            foreach ($cmd1 as $cmdx) {
                $tmp['carte'] = $cmdx['paiemode'];
            }


            $statement2 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='Orange Money' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement2->execute();
            $cmd2 = $statement2->fetchAll();

            foreach ($cmd2 as $cmdx) {
                $tmp['orange'] = $cmdx['paiemode'];
            }

            $statement3 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='credit' AND ticket.date BETWEEN '$start' AND '$end'");
            $statement3->execute();
            $cmd3 = $statement3->fetchAll();

            foreach ($cmd3 as $cmdx) {
                $tmp['credit'] = $cmdx['paiemode'];
            }


            $tmp['serveur'] = $nom->getUsername();
            $tmp['id'] = $nom->getId();

            $tmp['balance'] = number_format($b['balance'], '0', '.', ' ');


            $users[] = $tmp;

            $total = $total + $b['balance'];



        }


        $totals  =  number_format($total, '0', '.', ' ');





        //on stocke la vue à convertir en PDF, en n'oubliant pas les paramètres twig si la vue comporte des données dynamiques
        $html = $this->renderView('APDossiersBundle:Default:printvendeur.html.twig',array('vendeur'=>$users,'yes'=>$start,'day'=>$end,'total'=>$totals));

        //on instancie la classe Html2Pdf_Html2Pdf en lui passant en paramètre
        //le sens de la page "portrait" => p ou "paysage" => l
        //le format A4,A5...
        //la langue du document fr,en,it...
        $html2pdf = new \Html2Pdf_Html2Pdf('P','A4','fr');

        //SetDisplayMode définit la manière dont le document PDF va être affiché par l’utilisateur
        //fullpage : affiche la page entière sur l'écran
        //fullwidth : utilise la largeur maximum de la fenêtre
        //real : utilise la taille réelle
        $html2pdf->pdf->SetDisplayMode('real');

        //writeHTML va tout simplement prendre la vue stocker dans la variable $html pour la convertir en format PDF
        $html2pdf->writeHTML($html);

        //Output envoit le document PDF au navigateur internet avec un nom spécifique qui aura un rapport avec le contenu à convertir (exemple : Facture, Règlement…)
        $html2pdf->Output('statsvendeur.pdf');


        return new Response();

    }






    public function printdetailsAction($start,$end)
    {


        $em = $this->getDoctrine()->getManager();



        $details = $em->getRepository('APCaisseBundle:commandeprod');

        $data = $details->getByDate($start,$end);
        $total = 0;
        $marge = 0 ;

        foreach ($data as $prix){

            $vente = $prix->getQuantite()*$prix->getProduit()->getPrixvente();
            $margep = $prix->getQuantite()*$prix->getProduit()->getPrixachat();
            $total = $total + $vente ;
            $marge = $marge + ($vente - $margep);



        }



        $margetotale = number_format($marge, '0', '.', ' ');


        $totalvente = number_format($total, '0', '.', ' ');











        //on stocke la vue à convertir en PDF, en n'oubliant pas les paramètres twig si la vue comporte des données dynamiques
        $html = $this->renderView('APDossiersBundle:Default:printdetails.html.twig',array('details'=>$data,'totalvente'=>$totalvente,'margetotale'=>$margetotale,'from'=>$start,'to'=>$end));

        //on instancie la classe Html2Pdf_Html2Pdf en lui passant en paramètre
        //le sens de la page "portrait" => p ou "paysage" => l
        //le format A4,A5...
        //la langue du document fr,en,it...
        $html2pdf = new \Html2Pdf_Html2Pdf('P','A4','fr');

        //SetDisplayMode définit la manière dont le document PDF va être affiché par l’utilisateur
        //fullpage : affiche la page entière sur l'écran
        //fullwidth : utilise la largeur maximum de la fenêtre
        //real : utilise la taille réelle
        $html2pdf->pdf->SetDisplayMode('fullwidth');

        //writeHTML va tout simplement prendre la vue stocker dans la variable $html pour la convertir en format PDF
        $html2pdf->writeHTML($html);

        //Output envoit le document PDF au navigateur internet avec un nom spécifique qui aura un rapport avec le contenu à convertir (exemple : Facture, Règlement…)
        $html2pdf->Output('statsdetailsvente.pdf');


        return new Response();

    }



    public function produitAction()
    {

        $from = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d"), date("Y")));
        $to = date("Y-m-d H:i:s",mktime(date("H"), date("i"), 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$from}' AND '{$to}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        $total = 0;
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();

            $tot = $b['qte']*$nom->getPrixvente();

            $produit[] = $tmp;

            $total = $total + $tot;

        }






        return $this->render('APDossiersBundle:Default:produit.html.twig',array('produit'=>$produit,'total'=>$total,'from'=>$from,'to'=>$to));



    }





    public function fetchproduitAction($start,$end)
    {

        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();
        $total = 0;
        $produit = [];
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();


            $produit[] = $tmp;

            $tot = $b['qte']*$nom->getPrixvente();


            $total = $total + $tot;
        }









        $output=' <table class="table table-striped jambo_table bulk_action" id="product1">
                                        <thead>
                                        <tr class="headings">
                                            <th class="column-title">article </th>

                                            <th class="column-title">qte </th>
                                            <th class="column-title">prix unit </th>
                                            <th class="column-title">prix vte tot </th>

                                        </tr>
                                        </thead>
<span id="total" style="opacity:0">'.number_format($total, '0', '.', ' ').'</span>
                                        <tbody >';
        foreach ($produit as $prod){



            $output .= '<tr class="even pointer"><td>'.$prod['produit'].'</td> <td >'.$prod['quantite'].'</td><td>'.$prod['prix'].' </td><td>'.number_format($prod['quantite']*$prod['prix'], '0', '.', ' ').'</td>  </tr>';


        }

        $output .='</tbody> </table>';










        return new Response($output);





    }



    public function printproduitAction($start,$end)
    {


        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        $total = 0 ;
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();


            $produit[] = $tmp;

            $tot = $b['qte']*$nom->getPrixvente();


            $total = $total + $tot;


        }










        //on stocke la vue à convertir en PDF, en n'oubliant pas les paramètres twig si la vue comporte des données dynamiques
        $html = $this->renderView('APDossiersBundle:Default:printproduit.html.twig',array('produit'=>$produit,'from'=>$start,'to'=>$end,'total'=>$total));

        //on instancie la classe Html2Pdf_Html2Pdf en lui passant en paramètre
        //le sens de la page "portrait" => p ou "paysage" => l
        //le format A4,A5...
        //la langue du document fr,en,it...
        $html2pdf = new \Html2Pdf_Html2Pdf('P','A4','fr');

        //SetDisplayMode définit la manière dont le document PDF va être affiché par l’utilisateur
        //fullpage : affiche la page entière sur l'écran
        //fullwidth : utilise la largeur maximum de la fenêtre
        //real : utilise la taille réelle
        $html2pdf->pdf->SetDisplayMode('fullwidth');

        //writeHTML va tout simplement prendre la vue stocker dans la variable $html pour la convertir en format PDF
        $html2pdf->writeHTML($html);

        //Output envoit le document PDF au navigateur internet avec un nom spécifique qui aura un rapport avec le contenu à convertir (exemple : Facture, Règlement…)
        $html2pdf->Output('statsdetailsventeproduit.pdf');


        return new Response();

    }



    public function categorieAction()
    {

        $from = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d"), date("Y")));
        $to = date("Y-m-d H:i:s",mktime(date("H"), date("i"), 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();

        $cat = $em->getRepository('APProductsBundle:Category')->findAll();

        $dql = "SELECT   IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$from}' AND '{$to}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        $total = 0 ;
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();

            $tmp['categorie'] = $nom->getCategory()->getNom();


            $produit[] = $tmp;
            $tot = $b['qte']*$nom->getPrixvente();


            $total = $total + $tot;

        }


        $categ = [];
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);


            $tmp['nom'] = $nom->getCategory()->getNom();


            $categ[] = $tmp;


        }




        $catego = array(); // le nouveau tableau dédoublonné
        $arTemp = array(); // contiendra les ids à éviter
        foreach($categ as $ar)
        {
            if(!in_array($ar['nom'], $arTemp)) {
            $catego[] = $ar;
            $arTemp[] = $ar['nom'];
        }
        }






        return $this->render('APDossiersBundle:Default:categorie.html.twig',array('produit'=>$produit,'from'=>$from,'to'=>$to,'cat'=>$catego,'total'=>$total));



    }



    public function fetchcategorieAction($start,$end)
    {

        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY prod ORDER BY qte DESC ";


        $resultat = $em->createQuery($dql)
            ->getScalarResult();
        $total = 0;
        $produit = [];
        foreach ($resultat as $b) {

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();
            $tmp['categorie'] = $nom->getCategory()->getNom();


            $produit[] = $tmp;

            $tot = $b['qte']*$nom->getPrixvente();


            $total = $total + $tot;
        }


        $categ = [];
        foreach ($resultat as $b) {

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);


            $tmp['nom'] = $nom->getCategory()->getNom();


            $categ[] = $tmp;


        }


        $catego = array(); // le nouveau tableau dédoublonné
        $arTemp = array(); // contiendra les ids à éviter
        foreach ($categ as $ar) {
            if (!in_array($ar['nom'], $arTemp)) {
                $catego[] = $ar;
                $arTemp[] = $ar['nom'];
            }
        }


        $output = '';

        foreach ($catego as $categorie) {


            $output .= ' 
<h4 style="background-color: #eae9e9;
    padding: 5px 10px;">'.$categorie['nom'].'</h4>';
            $output .= '  <table class="table table-striped jambo_table bulk_action" >
                                            <thead>
                                            <tr class="headings">
                                                <th class="column-title" style="width:65%;">article </th>

                                                <th class="column-title">qte </th>
                                                <th class="column-title">prix unit </th>
                                                <th class="column-title">prix vte tot </th>


                                            </tr>
                                            </thead>

                                            <tbody >';
            $toto = 0;
            foreach ($produit as $det) {

                if ($det['categorie'] == $categorie['nom']) {

                    $tot = $det['quantite'] * $det['prix'];
                    $output .= '<tr class="even pointer"><td class=" " style="width:65%;">' . $det['produit'] . '</td>
                    <td class=" ">' . $det['quantite'] . '</td>
                                                                <td class=" ">' . $det['prix'] . '</td>
                                                                <td class=" ">' . number_format($tot, '0', '.', ' ') . ' </td>

</tr>';
                    $toto = $toto + $tot;

                }


            }

            $output .='<tr class="headings" style="background-color: rgba(173, 230, 173, 0.13);">
                                            <th class="column-title" colspan="3">TOTAL VENTE '.$categorie['nom'].' </th>

                                            <th class="column-title">' . number_format($toto, '0', '.', ' ') .' Fcfa</th>

                                        </tr></tbody>
                                        </table> <span id="total" style="opacity:0 ">'.number_format($total, '0', '.', ' ').'</span>';
        }


                return new Response($output);


            }




    public function printcategorieAction($start,$end)
    {


        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY prod ORDER BY qte DESC ";


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        $total = 0 ;
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();

            $tmp['categorie'] = $nom->getCategory()->getNom();


            $produit[] = $tmp;

            $tot = $b['qte']*$nom->getPrixvente();


            $total = $total + $tot;
        }


        $categ = [];
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);


            $tmp['nom'] = $nom->getCategory()->getNom();


            $categ[] = $tmp;


        }




        $catego = array(); // le nouveau tableau dédoublonné
        $arTemp = array(); // contiendra les ids à éviter
        foreach($categ as $ar)
        {
            if(!in_array($ar['nom'], $arTemp)) {
                $catego[] = $ar;
                $arTemp[] = $ar['nom'];
            }
        }











        //on stocke la vue à convertir en PDF, en n'oubliant pas les paramètres twig si la vue comporte des données dynamiques
        $html = $this->renderView('APDossiersBundle:Default:printcategorie.html.twig',array('produit'=>$produit,'from'=>$start,'to'=>$end,'cat'=>$catego,'total'=>$total));

        //on instancie la classe Html2Pdf_Html2Pdf en lui passant en paramètre
        //le sens de la page "portrait" => p ou "paysage" => l
        //le format A4,A5...
        //la langue du document fr,en,it...
        $html2pdf = new \Html2Pdf_Html2Pdf('P','A4','fr');

        //SetDisplayMode définit la manière dont le document PDF va être affiché par l’utilisateur
        //fullpage : affiche la page entière sur l'écran
        //fullwidth : utilise la largeur maximum de la fenêtre
        //real : utilise la taille réelle
        $html2pdf->pdf->SetDisplayMode('fullwidth');

        //writeHTML va tout simplement prendre la vue stocker dans la variable $html pour la convertir en format PDF
        $html2pdf->writeHTML($html);

        //Output envoit le document PDF au navigateur internet avec un nom spécifique qui aura un rapport avec le contenu à convertir (exemple : Facture, Règlement…)
        $html2pdf->Output('statsventecategorie.pdf');


        return new Response();

    }





    public function ticketAction()
    {

        $from = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d"), date("Y")));
        $to = date("Y-m-d H:i:s",mktime(date("H"), date("i"), 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();



        $dql = "SELECT SUM(e.prix) AS total FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$from}' AND '{$to}'  ";


        $total = $em->createQuery($dql)
            ->getSingleScalarResult();




        $details = $em->getRepository('APCaisseBundle:ticket');

        $data = $details->getByDate($from,$to);







        $totalvente = number_format($total, '0', '.', ' ');


        return $this->render('APDossiersBundle:Default:ticket.html.twig',array('details'=>$data,'totalvente'=>$totalvente,'from'=>$from,'to'=>$to));



    }




    public function fetchticketAction($start,$end)
    {


        $em = $this->getDoctrine()->getManager();



        $details = $em->getRepository('APCaisseBundle:ticket');

        $data = $details->getByDate($start,$end);
        $dql = "SELECT SUM(e.prix) AS total FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$start}' AND '{$end}'  ";


        $total = $em->createQuery($dql)
            ->getSingleScalarResult();


        $output=' <table class="table table-striped jambo_table bulk_action" id="product1">
                                        <thead>
                                      <tr class="headings">
                                            <th class="column-title">N° </th>
                                            <th class="column-title">Date</th>
                                            <th class="column-title">heure </th>

                                            <th class="column-title">Montant </th>
                                            <th class="column-title">paiement </th>
                                            <th class="column-title">Vendeur </th>
                                            <th class="column-title"></th>



                                        </tr>
                                        </thead>

                                        <tbody >';
        foreach ($data as $prix){


            $route = $this->generateUrl('ap_caisse_detail_ticket',array('id'=>$prix->getId()) );


            if($prix->getMode() == null){

                $mode = '--';

            }else{

                $mode = $prix->getMode();
            }


            if($prix->getPrix() == null){

                $prixtotal = '--';

            }else{

                $prixtotal = number_format($prix->getPrix(), '0', '.', ' ');
            }





            $output .= '<tr class="even pointer"><td>'.$prix->getId().'</td> <td >'.$prix->getDate()->format('d-m-Y').'</td><td>'.$prix->getDate()->format('H:i').' </td><td>'.$prixtotal.'</td><td>'.$mode.'</td> <td>'.$prix->getEmployes()->getUsername().'

 <td  align="center"><a href="'.$route.'" data-toggle="modal" data-target=".bs-example-modal-sm"  ><i class="fa fa-plus-circle" style="font-size:14px;"></i> </a>


                                            </td>
</td>  </tr>';


        }


        $totalvente = number_format($total, '0', '.', ' ');

        $output .='</tbody> </table> <div id="total" style="opacity: 0">'.$totalvente.'</div> ';










        return new Response($output);


    }




}


