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
        $day = date("Y-m-d H:i:s",mktime(date("H"), 0, 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.employes) AS serveur,SUM(e.prix) AS balance,e.etat FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$yesterday}' AND '{$day}' AND e.etat = 0 GROUP BY serveur " ;

        $balance = $em->createQuery($dql)
            ->getScalarResult();

        $total=0;
        $users = [];
        foreach ($balance as $b){

            $tmp = [];


            $nom = $em->getRepository('APUsersBundle:employes')->find($b['serveur']);




                $tmp['serveur'] = $nom->getUsername();

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


            $tmp['serveur'] = $nom->getUsername();

            $tmp['balance'] = number_format($b['balance'], '0', '.', ' ');


            $users[] = $tmp;
 $total=$total + $b['balance'];



        }



$totals  =  number_format($total, '0', '.', ' ');




$output='';
        foreach ($users as $u) {


            if($u['balance']!=0){
            $output .= '<tr class="even pointer"><td class=" ">'.$u['serveur'].'</td> <td class=" ">'.$u['balance'].'</td> <td class=" ">0</td><td class=" ">0</td><td class=" ">0</td><td class=" ">'.$u['balance'].'</td></tr>';

            }
        }

        $output .='<tr class="headings"><td> <strong>GRAND TOTAL</strong></td> <td id="total">'.$totals.' Fcfa</td>
                                            <td class=" ">0</td><td class=" ">0</td>
                                            <td class=" ">0</td><td >'.$totals.' Fcfa</td></tr>';


        return new Response($output);


    }







    public function printvendeurAction($start,$end)
    {





        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.employes) AS serveur,SUM(e.prix) AS balance FROM APCaisseBundle:ticket e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY serveur " ;

        $balance = $em->createQuery($dql)
            ->getScalarResult();


        $total=0;
        $users = [];
        foreach ($balance as $b){

            $tmp = [];


            $nom = $em->getRepository('APUsersBundle:employes')->find($b['serveur']);


            $tmp['serveur'] = $nom->getUsername();

            $tmp['balance'] = number_format($b['balance'], '0', '.', ' ');


            $users[] = $tmp;

            $total=$total+$b['balance'];


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
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();


            $produit[] = $tmp;


        }






        return $this->render('APDossiersBundle:Default:produit.html.twig',array('produit'=>$produit,'from'=>$from,'to'=>$to));



    }





    public function fetchproduitAction($start,$end)
    {

        $em = $this->getDoctrine()->getManager();


        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();


            $produit[] = $tmp;


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

                                        <tbody >';
        foreach ($produit as $prod){



            $output .= '<tr class="even pointer"><td>'.$prod['produit'].'</td> <td >'.$prod['quantite'].'</td><td>'.$prod['prix'].' </td><td>'.$prod['quantite']*$prod['prix'].'</td>  </tr>';


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
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();


            $produit[] = $tmp;


        }










        //on stocke la vue à convertir en PDF, en n'oubliant pas les paramètres twig si la vue comporte des données dynamiques
        $html = $this->renderView('APDossiersBundle:Default:printproduit.html.twig',array('produit'=>$produit,'from'=>$start,'to'=>$end));

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

        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$from}' AND '{$to}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();

            $tmp['categorie'] = $nom->getCategory()->getNom();


            $produit[] = $tmp;


        }






        return $this->render('APDossiersBundle:Default:categorie.html.twig',array('produit'=>$produit,'from'=>$from,'to'=>$to,'cat'=>$cat));



    }



    public function fetchcategorieAction($start,$end)
    {

        $em = $this->getDoctrine()->getManager();

        $cat = $em->getRepository('APProductsBundle:Category')->findAll();

        $dql = "SELECT IDENTITY(e.produit) AS prod,IDENTITY(e.bon) AS bon,SUM(e.quantite) AS qte FROM APCaisseBundle:commandeprod e WHERE e.date BETWEEN '{$start}' AND '{$end}'  GROUP BY prod ORDER BY qte DESC " ;


        $resultat = $em->createQuery($dql)
            ->getScalarResult();

        $produit = [];
        foreach ($resultat as $b){

            $tmp = [];


            $nom = $em->getRepository('APProductsBundle:Product')->find($b['prod']);

            $tmp['produit'] = $nom->getDesignation();

            $tmp['quantite'] = $b['qte'];

            $tmp['prix'] = $nom->getPrixvente();
            $tmp['categorie'] = $nom->getCategory()->getNom();


            $produit[] = $tmp;


        }







foreach ($cat as $cate) {
    echo $cate->getNom();
    foreach ($produit as $prod) {
        if($prod['categorie'] == $cate->getNom()){



        $output = ' <table class="table table-striped jambo_table bulk_action" id="product1">
                                        <thead>
                                        <tr class="headings">
                                            <th class="column-title">article </th>

                                            <th class="column-title">qte </th>
                                            <th class="column-title">prix unit </th>
                                            <th class="column-title">prix vte tot </th>

                                        </tr>
                                        </thead>

                                        <tbody >';

        $output .= '<tr class="even pointer"><td>' . $prod['produit'] . '</td> <td >' . $prod['quantite'] . '</td><td>' . $prod['prix'] . ' </td><td>' . $prod['quantite'] * $prod['prix'] . '</td>  </tr>';







    $output .= '</tbody> </table>';
    }
    }
}








        return new Response($output);





    }



}
