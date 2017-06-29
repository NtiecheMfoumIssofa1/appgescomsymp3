<?php

namespace AP\CaisseBundle\Controller;

use AP\CaisseBundle\Entity\boncommande;
use AP\CaisseBundle\Entity\commandeprod;
use AP\CaisseBundle\Entity\tables;
use AP\CaisseBundle\Entity\ticket;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Doctrine\ORM\Query\Expr\Join;
use Mike42\Escpos\Printer;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Doctrine\ORM\Query\ResultSetMapping;


class DefaultController extends Controller
{
    public function indexAction()
    {

        $em = $this->getDoctrine()->getManager();


        $query = $em->createQuery('SELECT a FROM APUsersBundle:employes a JOIN APCaisseBundle:ticket c WHERE a.id=c.employes and c.etat = 1');
        $serveurs = $query->getResult();



        $interieur = $em->getRepository('APCaisseBundle:tables')->findBy(array('lieu'=>"Interieur"),array('id' =>'asc'));
        $couloir = $em->getRepository('APCaisseBundle:tables')->findBy(array('lieu'=>"Couloir"));
        $terasse = $em->getRepository('APCaisseBundle:tables')->findBy(array('lieu'=>"Terasse"));

 	
        return $this->render('APCaisseBundle:Default:index.html.twig',array('serve'=>$serveurs,'interieur'=>$interieur,'couloir'=>$couloir,'terasse'=>$terasse));






    }


    public function tableAction($id)
    {


        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');
        $category = $em->getRepository('APProductsBundle:Category');
        $table = $em->getRepository('APCaisseBundle:tables');
        $ticket = $em->getRepository('APCaisseBundle:ticket');


        $prod = $produit->findAll();
        $cat = $category->findAll();
        $tab = $table->find($id);
        $ticke = $ticket->findOneBy(array('tables'=>$id,'etat'=>1));

        if($ticke === null) {
            $ticketid = 0;
        } else {
            $ticketid = $ticke->getId();


        }



        return $this->render('APCaisseBundle:Default:table.html.twig',array('produits'=>$prod,'categories'=>$cat,'tab'=>$tab,'ticketid'=>$ticketid));
    }



    public function commandeAction(Request $request,$prod,$id)
    {

        $em = $this->getDoctrine()->getManager();




        // recuperation de l'objet employe
        $user = $this->getUser();
        $iduser =$user->getId();
        $employe = $em->getRepository('APUsersBundle:employes')->find($iduser);



        // recuperation de l'id de la table

        $table = $em->getRepository('APCaisseBundle:tables')->find($id);



        // objet ticket

        $tick = $em
            ->getRepository('APCaisseBundle:ticket')
            ->findOneBy(array('tables' => $table,'etat'=>1))
        ;



        if($tick === null) {




            $ticket = new ticket();

            $ticket->setEmployes($employe);
            $ticket->setEtat(1);
            $ticket->setTables($table);
            $table->setOccupe(1);
            $em->persist($table);
            $em->persist($ticket);

        }else{

            $ticket = $tick;

        }



        $bon = new boncommande();
        $bon->setTicket($ticket);
        $bon->setAnnule(1);
        $em->persist($bon);

        $produ = json_decode($prod);

		
	$bar = new WindowsPrintConnector("EPSON TM-T20II Receipt5");
	$cuisine = new WindowsPrintConnector("EPSON TM-T20II Receipt5 cuisine");
	$chicha = new WindowsPrintConnector("EPSON TM-T20II Receipt5 chicha");

    /* Print a "Hello world" receipt" */
    $printer = new Printer($bar);
	$printer -> feed();
	$printer -> setJustification(Printer::JUSTIFY_CENTER);
	    
        $printer -> text("Carrefour Bastos\n");
         $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("2626 Yaoundé\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(1);
	
	
	
	 $printer -> setJustification(Printer::JUSTIFY_CENTER);
	 $printer -> text(date('d/m/Y  H:i ')."\n");
	$printer -> feed(1);
	
	$printer -> setJustification(Printer::JUSTIFY_CENTER);
	$printer -> setTextSize(3, 2);
	 $printer -> text($bon->getId()."\n");
	 $printer -> setJustification(Printer::JUSTIFY_CENTER);
	$printer -> setTextSize(3, 2);
	$printer ->setReverseColors(true);
	 $printer -> text("COMMANDE BAR\n");
	 $printer -> feed(1);
	 $printer -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer ->setReverseColors(false);
	 $printer -> setTextSize(1, 1);
	$printer -> text("Serveur:".$employe->getUsername()."\n");
	
	
	 $printer -> feed(1);
	 $printer -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer ->setReverseColors(false);
	 $printer -> setTextSize(2, 1);
	$printer -> text("Table:".$table->getNom()."     Ticket:".$ticket->getId()."\n");
	$printer -> text("------------------------\n");
	 $printer -> setTextSize(1, 1);
	$printer -> text("QTE   ARTICLE\n");
	$printer -> text("---------------------------------------\n");
		
		
		
	


	// cuisine
	
	   /* Print a "Hello world" receipt" */
    $printer1 = new Printer($cuisine);
	
	
      $printer1 -> feed();
	$printer1 -> setJustification(Printer::JUSTIFY_CENTER);
	    
        $printer1 -> text("Carrefour Bastos\n");
         $printer1 -> setJustification(Printer::JUSTIFY_CENTER);
        $printer1 -> text("2626 Yaoundé\n");
        $printer1 -> setJustification(Printer::JUSTIFY_CENTER);
        $printer1 -> text("Tel: 655 55 55 55 \n");
        $printer1 -> feed(1);
	
	
	
	 $printer1 -> setJustification(Printer::JUSTIFY_CENTER);
	 $printer1 -> text(date('d/m/Y  H:i ')."\n");
	
	$printer1 -> feed(1);
	
	$printer1 -> setJustification(Printer::JUSTIFY_CENTER);
	$printer1 -> setTextSize(3, 2);
	 $printer1 -> text($bon->getId()."\n");
	 $printer1 -> setJustification(Printer::JUSTIFY_CENTER);
	$printer1 -> setTextSize(3, 2);
	$printer1 ->setReverseColors(true);
	 $printer1 -> text("COMMANDE CUISINE\n");
	 $printer1 -> feed(1);
	 $printer1 -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer1 ->setReverseColors(false);
	 $printer1 -> setTextSize(1, 1);
	$printer1 -> text("Serveur:".$employe->getUsername()."\n");
	
	
	 $printer1 -> feed(1);
	 $printer1 -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer1 ->setReverseColors(false);
	 $printer1 -> setTextSize(2, 1);
	$printer1 -> text("Table: ".$table->getNom()."     Ticket:".$ticket->getId()."\n");
	$printer1 -> text("--------------------\n");
	 $printer1 -> setTextSize(1, 1);
	$printer1 -> text("QTE  ARTICLE\n");
	$printer1 -> text("----------------------------------\n");
	
	
	



	
	
	
	
	// cuisine
	
	   /* Print a "Hello world" receipt" */
    $printer2 = new Printer($chicha);
	
	
      $printer2 -> feed();
	$printer2 -> setJustification(Printer::JUSTIFY_CENTER);
	    
        $printer2 -> text("Carrefour Bastos\n");
         $printer2 -> setJustification(Printer::JUSTIFY_CENTER);
        $printer2 -> text("2626 Yaoundé\n");
        $printer2 -> setJustification(Printer::JUSTIFY_CENTER);
        $printer2 -> text("Tel: 655 55 55 55 \n");
        $printer2 -> feed(1);
	
	
	
	 $printer2 -> setJustification(Printer::JUSTIFY_CENTER);
	 $printer2 -> text(date('d/m/Y  H:i ')."\n");
	
	$printer2 -> feed(1);
	
	$printer2 -> setJustification(Printer::JUSTIFY_CENTER);
	$printer2 -> setTextSize(3, 2);
	 $printer2 -> text($bon->getId()."\n");
	 $printer2 -> setJustification(Printer::JUSTIFY_CENTER);
	$printer2 -> setTextSize(3, 2);
	$printer2 ->setReverseColors(true);
	 $printer2 -> text("COMMANDE CHICHA\n");
	 $printer2 -> feed(1);
	 $printer2 -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer2 ->setReverseColors(false);
	 $printer2 -> setTextSize(1, 1);
	$printer2 -> text("Serveur:".$employe->getUsername()."\n");
	
	
	 $printer2 -> feed(1);
	 $printer2 -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer2 ->setReverseColors(false);
	 $printer2 -> setTextSize(2, 1);
	$printer2 -> text("Table: ".$table->getNom()."     Ticket:".$ticket->getId()."\n");
	$printer2 -> text("--------------------\n");
	 $printer2 -> setTextSize(1, 1);
	$printer2 -> text("QTE  ARTICLE\n");
	$printer2 -> text("----------------------------------\n");





	
		
        foreach($produ as $p) {
            $pr = $em->getRepository('APProductsBundle:Product')->find($p->product_id);




            if($pr->getTypeproduit() == 3 AND $pr->getNbrediv() == 1  ){

                $parent = $em
                    ->getRepository('APProductsBundle:Product')->findOneByCode($pr->getProdparent());


if($parent->getDivvendu()+$p->product_quantity == $parent->getQtepart()){

    $parent->setStock(1);
    $parent->setDivvendu(0);
}elseif ($parent->getDivvendu()+$p->product_quantity > $parent->getQtepart()){

 $newven =   ($parent->getDivvendu()+$p->product_quantity) - $parent->getQtepart();

    $parent->setStock(1);
    $parent->setDivvendu($newven);

}else{
    $parent->setDivvendu($parent->getDivvendu()+$p->product_quantity);
}
                $em->persist($parent);





            }elseif($pr->getTypeproduit() == 3 AND $pr->getNbrediv() == 2  ){

                $parent = $em
                    ->getRepository('APProductsBundle:Product')->findOneByCode($pr->getProdparent());

                $demiprod = ($parent->getQtepart() / 2) * $p->product_quantity;

                if($parent->getDivvendu()+$demiprod == $parent->getQtepart()){

                    $parent->setStock(1);
                    $parent->setDivvendu(0);
                }elseif ($parent->getDivvendu()+$demiprod > $parent->getQtepart()){

                    $newven =   ($parent->getDivvendu()+$demiprod) - $parent->getQtepart();

                    $parent->setStock(1);
                    $parent->setDivvendu($newven);

                }else{
                    $parent->setDivvendu($parent->getDivvendu()+$demiprod);
                }
                $em->persist($parent);





            }else
            {
            $pr->setstock($p->product_quantity);
            }






            $cmdprod =new commandeprod();
            $cmdprod->setBon($bon);
            $cmdprod->setProduit($pr);
            $cmdprod->setQuantite($p->product_quantity);

            $em->persist($cmdprod);
            $em->persist($pr);


			
		if($pr->getCategory()->getImpression() == "Cuisine"){
			$cui = "on";
			$printer1 -> setTextSize(1, 2);
	$printer1 -> text($p->product_quantity." ".$pr->getDesignation()."\n");
	$printer1 -> feed(1);
			}elseif($pr->getCategory()->getImpression() == "Chicha")
  {
	$chi= "chi";
$printer2 -> setTextSize(1, 2);
	$printer2 -> text($p->product_quantity." ".$pr->getDesignation()."\n");
	$printer2 -> feed(1);

}else{
	
  $baron = "on";
	 $printer -> setTextSize(1, 2);
	$printer -> text($p->product_quantity."  ".$pr->getDesignation()."\n");
	$printer -> feed(1);	
}



        }

//		if(isset($cui)){
//
//	$printer1 -> setJustification();
//     $printer1 -> cut();
////
//   /* Close printer */
//   $printer1 -> close();	}
//
//   if(isset($chi)){
//
//	$printer2 -> setJustification();
//     $printer2 -> cut();
////
//   /* Close printer */
//   $printer2 -> close();	}
//
//if(isset($baron)){
//$printer -> setJustification();
//      $printer -> cut();
////
////   /* Close printer */
//   $printer -> close();
//}
        $em->flush();


        $route = $this->generateUrl('ap_caisse_homepage');
		
		


        $output = ' <div class="alert alert-success alert-dismissible fade in" role="alert" style="width: 100%;position: relative;top: 10px;padding:10px;text-align:center;">
           
            <strong>  <i class="fa fa-paper-plane-o" style="display: block;
    font-size: 40px;"> </i> COMMANDE ENVOYEE</strong> 
        </div> <div style="text-align: center;
    margin: 25px;"> <a href="'.$route.'"><i class="fa fa-chevron-circle-left"></i> Retour </a> </div> ';




        return new Response($output);


    }


    public function ticketAction($id,$mode,$total)
    {


        $em = $this->getDoctrine()->getManager();
        $ticket = $em
            ->getRepository('APCaisseBundle:ticket')->find($id);

        $table = $em
            ->getRepository('APCaisseBundle:tables')->find($ticket->getTables());








        $bar = new WindowsPrintConnector("EPSON TM-T20II Receipt5");

        /* Print a "Hello world" receipt" */
        $printer = new Printer($bar);

$printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Carrefour Bastos\n");
         $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("2626 Yaoundé\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(2, 2);
        $printer -> text("TICKET DE CAISSE #".$ticket->getId(). "\n");
        $printer -> feed(1);

        $printer -> selectPrintMode();
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("Table : ".$ticket->getTables()->getNom(). "\n");


        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("Serveur: ".$ticket->getEmployes()->getUsername()."            ".date('d/m/Y  H:i')."\n");
        $printer -> feed(2);


        $printer -> setTextSize(1, 1);
        $printer -> text("QTE ARTICLE                        PRIX   TOTAL\n");
        $printer -> text("------------------------------------------------\n");




        foreach($ticket->getBoncommandes() as $bon) {


            foreach($bon->getCommandeprods() as $cmd) {
 $taille = strlen($cmd->getProduit()->getDesignation());
 $ajout = 32 - $taille  ;
                $printer -> text($cmd->getQuantite()."  ".$cmd->getProduit()->getDesignation().str_repeat(" ", $ajout) .$cmd->getProduit()->getPrixvente()."  ".$cmd->getQuantite()*$cmd->getProduit()->getPrixvente()."\n");
               $printer -> feed();
            }





        }
$printer -> text("------------------------------------------------\n");
        $printer -> feed(1);
        $printer -> setTextSize(1, 1);
        $printer -> text("   règlement : ".$mode. "\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(2, 1);
        $printer -> text("TOTAL:  ".number_format($total, '0', '.', ' ')." Fcfa\n");
        $printer -> feed(2);



        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(1, 1);
        $printer -> text("MERCI DE VOTRE VISITE \n");


//
//        $printer -> setJustification();
//       $printer -> cut();
////
////        /* Close printer */
//        $printer -> close();







        $ticket->setEtat(0);
        $ticket->setMode($mode);
        $ticket->setPrix($total);
        $table->setOccupe(0);

        $em->persist($ticket);
        $em->persist($table);

        $em->flush();

        $this->addFlash(
            'Ticket',
            ' ticket enregistré !'
        );







        return $this->redirectToRoute('ap_caisse_homepage');


    }





    public function detailAction(Request $request, $id)
    {


        $em = $this->getDoctrine()->getManager();
        $ticket = $em
            ->getRepository('APCaisseBundle:ticket')->find($id);



        if($request->isXmlHttpRequest()){


            return $this->render('APCaisseBundle:Default:ticketdetail.html.twig',array('ticketid'=>$ticket));


         }else{
            return $this->render('APCaisseBundle:Default:ticketdetail.html.twig',array('ticketid'=>$ticket));

        }





    }




    public function detailvendeurAction(Request $request, $id,$total,$from,$to,$espece,$orange,$carte,$credit)
    {

        $em = $this->getDoctrine()->getManager();
        $user = $em
            ->getRepository('APUsersBundle:employes')->find($id);
        $connection = $em->getConnection();
        $statement = $connection->prepare("select commandeprod.produit_id AS produit, ticket.id,boncommande.ticket_id,ticket.date, sum(commandeprod.quantite) AS qte from commandeprod
inner join boncommande on commandeprod.bon_id = boncommande.id
inner join ticket on boncommande.ticket_id = ticket.id
WHERE ticket.employes_id = $id AND ticket.etat=0 AND ticket.date BETWEEN '$from' AND '$to'
group by commandeprod.produit_id");
        $statement->execute();
        $cmd = $statement->fetchAll();
        $data = [];
        foreach ($cmd as $b){

            $tmp = [];


            $produit = $em->getRepository('APProductsBundle:Product')->find($b['produit']);




            $tmp['produit'] = $produit->getDesignation();
            $tmp['vente'] = $produit->getPrixvente();
            $tmp['qte'] = $b['qte'];



            $data[] = $tmp;


        }













        if($request->isXmlHttpRequest()){


            return $this->render('APCaisseBundle:Default:vendeurdetails.html.twig',array('cmd'=>$data,'user'=>$user,'total'=>$total,'from'=>$from,'to'=>$to,'espece'=>$espece,'orange'=>$orange,'carte'=>$carte,'credit'=>$credit));


        }else{
            return $this->render('APCaisseBundle:Default:vendeurdetails.html.twig',array('cmd'=>$data,'user'=>$user,'total'=>$total,'from'=>$from,'to'=>$to,'espece'=>$espece,'orange'=>$orange,'carte'=>$carte,'credit'=>$credit));


        }





    }




    public function detailvendeurprintAction(Request $request, $id,$total,$from,$to,$espece,$orange,$carte,$credit)
    {





        $em = $this->getDoctrine()->getManager();


        $user = $em
            ->getRepository('APUsersBundle:employes')->find($id);




        $connection = $em->getConnection();
        $statement = $connection->prepare("select commandeprod.produit_id AS produit, ticket.id,boncommande.ticket_id,ticket.date, sum(commandeprod.quantite) AS qte from commandeprod
inner join boncommande on commandeprod.bon_id = boncommande.id
inner join ticket on boncommande.ticket_id = ticket.id
WHERE ticket.employes_id = $id AND ticket.etat=0 AND ticket.date BETWEEN '$from' AND '$to'
group by commandeprod.produit_id");
        $statement->execute();
        $cmd = $statement->fetchAll();




        $data = [];
        foreach ($cmd as $b){

            $tmp = [];


            $produit = $em->getRepository('APProductsBundle:Product')->find($b['produit']);




            $tmp['produit'] = $produit->getDesignation();
            $tmp['vente'] = $produit->getPrixvente();
            $tmp['qte'] = $b['qte'];



            $data[] = $tmp;




        }













        $bar = new WindowsPrintConnector("EPSON TM-T20II Receipt5");

        /* Print a "Hello world" receipt" */
        $printer = new Printer($bar);


		
		$printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Carrefour Bastos\n");
         $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("2626 Yaoundé\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(2, 2);
        $printer -> text("CLOTURE DE CAISSE # \n");
        $printer -> feed(1);

        $printer -> selectPrintMode();
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("debut : ".$from. "\n");


        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("fin: ".$to."\n");
		
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(2, 1);
        $printer -> text("serveur:".strtoupper($user->getUsername())."\n");
        $printer -> feed(2);
		
		
		
		



        $printer -> setTextSize(1, 1);
        $printer -> text("PRODUIT                            QTE   TOTAL\n");
        $printer -> text("------------------------------------------------\n");






            foreach ( $data as $prod){




            $taille = strlen($prod['produit']);
            $ajout = 37 - $taille  ;
            $printer -> text($prod['produit']." ".str_repeat(" ", $ajout) .$prod['qte']."  ".$prod['qte']*$prod['vente']."\n");


    }


        $printer -> text("------------------------------------------------\n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("TOTAL ESPECES:       ".$espece." Fcfa\n");
        $printer -> text("TOTAL ORANGE MONEY:  ".$orange." Fcfa\n");
        $printer -> text("TOTAL CARTE:         ".$carte." Fcfa\n");
        $printer -> text("TOTAL CREDIT:         ".$credit." Fcfa\n");
        $printer -> feed(1);
        $printer -> text("TOTAL GLOBAL:        ".$total." Fcfa\n");
        $printer -> feed(1);







        $printer -> setJustification();
        $printer -> cut();

//        /* Close printer */
        $printer -> close();



        return $this->redirectToRoute('ap_dossiers_vendeur');







    }






    public function clotureAction(Request $request,$id,$total,$from,$to,$espece,$orange,$carte,$credit)
    {





        $em = $this->getDoctrine()->getManager();
        $user = $em
            ->getRepository('APUsersBundle:employes')->find($id);
        $connection = $em->getConnection();
        $statement = $connection->prepare("select commandeprod.produit_id AS produit, ticket.id,boncommande.ticket_id,ticket.date, sum(commandeprod.quantite) AS qte from commandeprod
inner join boncommande on commandeprod.bon_id = boncommande.id
inner join ticket on boncommande.ticket_id = ticket.id
WHERE ticket.employes_id = $id AND ticket.etat=0 AND ticket.date BETWEEN '$from' AND '$to'
group by commandeprod.produit_id");
        $statement->execute();
        $cmd = $statement->fetchAll();



        $data = [];
        foreach ($cmd as $b){

            $tmp = [];


            $produit = $em->getRepository('APProductsBundle:Product')->find($b['produit']);




            $tmp['produit'] = $produit->getDesignation();
            $tmp['vente'] = $produit->getPrixvente();
            $tmp['qte'] = $b['qte'];



            $data[] = $tmp;


        }


        if($request->isXmlHttpRequest()){


            return $this->render('APCaisseBundle:Default:cloture.html.twig',array('cmd'=>$data,'user'=>$user,'total'=>$total,'from'=>$from,'to'=>$to,'espece'=>$espece,'orange'=>$orange,'carte'=>$carte,'credit'=>$credit));


        }else{
            return $this->render('APCaisseBundle:Default:cloture.html.twig',array('cmd'=>$data,'user'=>$user,'total'=>$total,'from'=>$from,'to'=>$to,'espece'=>$espece,'orange'=>$orange,'carte'=>$carte,'credit'=>$credit));


        }





    }


	
	
	
	   public function cloturevendeurprintAction(Request $request, $id,$total,$from,$to,$espece,$orange,$carte,$credit)
    {





        $em = $this->getDoctrine()->getManager();


        $user = $em
            ->getRepository('APUsersBundle:employes')->find($id);




        $connection = $em->getConnection();
        $statement = $connection->prepare("select commandeprod.produit_id AS produit, ticket.id,boncommande.ticket_id,ticket.date, sum(commandeprod.quantite) AS qte from commandeprod
inner join boncommande on commandeprod.bon_id = boncommande.id
inner join ticket on boncommande.ticket_id = ticket.id
WHERE ticket.employes_id = $id AND ticket.etat=0 AND ticket.date BETWEEN '$from' AND '$to'
group by commandeprod.produit_id");
        $statement->execute();
        $cmd = $statement->fetchAll();




        $data = [];
        foreach ($cmd as $b){

            $tmp = [];


            $produit = $em->getRepository('APProductsBundle:Product')->find($b['produit']);




            $tmp['produit'] = $produit->getDesignation();
            $tmp['vente'] = $produit->getPrixvente();
            $tmp['qte'] = $b['qte'];



            $data[] = $tmp;




        }













        $bar = new WindowsPrintConnector("EPSON TM-T20II Receipt5");

        /* Print a "Hello world" receipt" */
        $printer = new Printer($bar);


		
		$printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Carrefour Bastos\n");
         $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("2626 Yaoundé\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(2, 2);
        $printer -> text("CLOTURE DE CAISSE # \n");
        $printer -> feed(1);

        $printer -> selectPrintMode();
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("debut : ".$from. "\n");


        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("fin: ".$to."\n");
		
		
		  $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(2, 1);
        $printer -> text("serveur:".strtoupper($user->getUsername())."\n");
        $printer -> feed(2);
		
		
		
		
		
		
		
		
		
		
		
		
		
		



        $printer -> setTextSize(1, 1);
        $printer -> text("PRODUIT                            QTE   TOTAL\n");
        $printer -> text("------------------------------------------------\n");






            foreach ( $data as $prod){




            $taille = strlen($prod['produit']);
            $ajout = 37 - $taille  ;
            $printer -> text($prod['produit']." ".str_repeat(" ", $ajout) .$prod['qte']."  ".$prod['qte']*$prod['vente']."\n");


    }


        $printer -> text("------------------------------------------------\n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("TOTAL ESPECES:       ".$espece." Fcfa\n");
        $printer -> text("TOTAL ORANGE MONEY:  ".$orange." Fcfa\n");
        $printer -> text("TOTAL CARTE:         ".$carte." Fcfa\n");
        $printer -> text("TOTAL CREDIT:         ".$credit." Fcfa\n");
        $printer -> feed(1);
        $printer -> text("TOTAL GLOBAL:        ".$total." Fcfa\n");
        $printer -> feed(1);







        $printer -> setJustification();
        $printer -> cut();

//        /* Close printer */
        $printer -> close();



        return $this->redirectToRoute('ap_dossiers_vendeur');







    }






    public function detailclotureprintAction(Request $request, $id,$total,$from,$to,$espece,$orange,$carte,$credit)
    {





        $em = $this->getDoctrine()->getManager();


        $user = $em
            ->getRepository('APUsersBundle:employes')->find($id);




        $connection = $em->getConnection();
        $statement = $connection->prepare("select commandeprod.produit_id AS produit, ticket.id,boncommande.ticket_id,ticket.date, sum(commandeprod.quantite) AS qte from commandeprod
inner join boncommande on commandeprod.bon_id = boncommande.id
inner join ticket on boncommande.ticket_id = ticket.id
WHERE ticket.employes_id = $id AND ticket.etat=0 AND ticket.date BETWEEN '$from' AND '$to'
group by commandeprod.produit_id");
        $statement->execute();
        $cmd = $statement->fetchAll();




        $data = [];
        foreach ($cmd as $b){

            $tmp = [];


            $produit = $em->getRepository('APProductsBundle:Product')->find($b['produit']);




            $tmp['produit'] = $produit->getDesignation();
            $tmp['vente'] = $produit->getPrixvente();
            $tmp['qte'] = $b['qte'];



            $data[] = $tmp;




        }













        $bar = new WindowsPrintConnector("EPSON TM-T20II Receipt5");

        /* Print a "Hello world" receipt" */
        $printer = new Printer($bar);



        $printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Carrefour Bastos\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("2626 Yaoundé\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(2, 2);
        $printer -> text("CLOTURE DE CAISSE # \n");
        $printer -> feed(1);

        $printer -> selectPrintMode();
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("debut : ".$from. "\n");


        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("fin: ".$to."\n");

        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(2, 1);
        $printer -> text("serveur:".strtoupper($user->getUsername())."\n");
        $printer -> feed(2);







        $printer -> setTextSize(1, 1);
        $printer -> text("PRODUIT                            QTE   TOTAL\n");
        $printer -> text("------------------------------------------------\n");






        foreach ( $data as $prod){




            $taille = strlen($prod['produit']);
            $ajout = 37 - $taille  ;
            $printer -> text($prod['produit']." ".str_repeat(" ", $ajout) .$prod['qte']."  ".$prod['qte']*$prod['vente']."\n");


        }


        $printer -> text("------------------------------------------------\n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("TOTAL ESPECES:       ".$espece." Fcfa\n");
        $printer -> text("TOTAL ORANGE MONEY:  ".$orange." Fcfa\n");
        $printer -> text("TOTAL CARTE:         ".$carte." Fcfa\n");
        $printer -> text("TOTAL CREDIT:         ".$credit." Fcfa\n");

        $printer -> feed(1);
        $printer -> text("TOTAL GLOBAL:        ".$total." Fcfa\n");
        $printer -> feed(1);







        $printer -> setJustification();
        $printer -> cut();

//        /* Close printer */
        $printer -> close();



        return $this->redirectToRoute('ap_products_homepage');







    }








    public function annulationAction(Request $request,$id,$table,$user)
    {





        $em = $this->getDoctrine()->getManager();
        $cmd = $em
            ->getRepository('APCaisseBundle:commandeprod')->find($id);






        if($request->isXmlHttpRequest()){


            return $this->render('APCaisseBundle:Default:annulation.html.twig',array('cmd'=>$cmd,'user'=>$user,'table'=>$table));


        }else{
            return $this->render('APCaisseBundle:Default:annulation.html.twig',array('cmd'=>$cmd,'user'=>$user,'table'=>$table));


        }





    }






    public function annulationprintAction(Request $request, $id,$table,$user)
    {





        $em = $this->getDoctrine()->getManager();


        $cmd = $em
            ->getRepository('APCaisseBundle:commandeprod')->find($id);

        $prod = $em
            ->getRepository('APProductsBundle:Product')->find($cmd->getProduit()->getId());


        $bon = $em
            ->getRepository('APCaisseBundle:boncommande')->find($cmd->getBon()->getId());


       $num = count($bon->getCommandeprods());


        $tab = $em
            ->getRepository('APCaisseBundle:tables')->find($table);


        if($prod->getTypeproduit() == 1){

        if($prod->getGerstock()){
        $newqte = $prod->getQtestock() + $cmd->getQuantite();

        $prod->setQtestock($newqte);
        $em->persist($prod);



        $em->flush();

        }

        }elseif ( $prod->getTypeproduit() == 2 ) {


            if($prod->getGerstock()){
                $newqte = $prod->getQtestock() + $cmd->getQuantite();

                $prod->setQtestock($newqte);
                $em->persist($prod);



                $em->flush();

            }


        }elseif ($prod->getTypeproduit() == 3 AND $prod->getNbrediv() == 1 ){


            $parent = $em
                ->getRepository('APProductsBundle:Product')->findOneBy(array('code'=>$prod->getProdparent()) );











                if($parent->getDivvendu() - $cmd->getQuantite() < 0  AND $parent->getDivvendu() == 0 ){

                   $newqte = $parent->getQtestock()+1;
                   $newdiv =  $parent->getQtepart() - $cmd->getQuantite();
                    $parent->setQtestock($newqte);
                    $parent->setDivvendu($newdiv);

                    $em->persist($parent);

                    $em->flush();


                }elseif ($parent->getDivvendu() - $cmd->getQuantite() < 0  AND $parent->getDivvendu() > 0 ){



                    $newqte = $parent->getQtestock()+1;

                    $newdi =  $parent->getDivvendu() - $cmd->getQuantite();

                    $newdiv =  $parent->getQtepart() - $newdi;

                    $parent->setQtestock($newqte);
                    $parent->setDivvendu($newdiv);

                    $em->persist($parent);

                    $em->flush();


                }else{



                    $newdiv =  $parent->getDivvendu() - $cmd->getQuantite();
                    $parent->setDivvendu($newdiv);

                    $em->persist($parent);

                    $em->flush();



                }





            }elseif($prod->getTypeproduit() == 3 AND $prod->getNbrediv() == 2  ){

                $parent = $em
                    ->getRepository('APProductsBundle:Product')->findOneByCode($prod->getProdparent());

                $demiprod = ($parent->getQtepart() / 2) * $cmd->getQuantite();






            if($parent->getDivvendu() - $cmd->getQuantite() < 0  AND $parent->getDivvendu() == 0 ){

                $newqte = $parent->getQtestock()+1;
                $newdiv =  $parent->getQtepart() - $cmd->getQuantite();
                $parent->setQtestock($newqte);
                $parent->setDivvendu($newdiv);

                $em->persist($parent);

                $em->flush();


            }elseif ($parent->getDivvendu() - $cmd->getQuantite() < 0  AND $parent->getDivvendu() > 0 ){



                $newqte = $parent->getQtestock()+1;

                $newdi =  $parent->getDivvendu() - $cmd->getQuantite();

                $newdiv =  $parent->getQtepart() - $newdi;

                $parent->setQtestock($newqte);
                $parent->setDivvendu($newdiv);

                $em->persist($parent);

                $em->flush();


            }else{



                $newdiv =  $parent->getDivvendu() - $cmd->getQuantite();
                $parent->setDivvendu($newdiv);

                $em->persist($parent);

                $em->flush();



            }



















        }





        if($prod->getCategory()->getImpression() == "Cuisine"){

            $pri = new WindowsPrintConnector("EPSON TM-T20II Receipt5 cuisine");


        }elseif($prod->getCategory()->getImpression() == "Chicha")
        {
            $pri = new WindowsPrintConnector("EPSON TM-T20II Receipt5 chicha");


        }else{

            $pri = new WindowsPrintConnector("EPSON TM-T20II Receipt5");

        }





        /* Print a "Hello world" receipt" */
        $printer = new Printer($pri);




        $printer -> feed();
        $printer -> setJustification(Printer::JUSTIFY_CENTER);

        $printer -> text("Carrefour Bastos\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("2626 Yaoundé\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(1);



        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text(date('d/m/Y  H:i ')."\n");
        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(3, 2);
        $printer -> text("\n");
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(3, 2);
        $printer ->setReverseColors(true);
        $printer -> text("ANNULATION\n");
        $printer -> feed(1);
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer ->setReverseColors(false);
        $printer -> setTextSize(1, 1);
        $printer -> text("Serveur:".$user."\n");


        $printer -> feed(1);
        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer ->setReverseColors(false);
        $printer -> setTextSize(2, 1);
        $printer -> text("Table:".$tab->getNom()."\n");
        $printer -> text("------------------------\n");
        $printer -> setTextSize(1, 1);
        $printer -> text("ARTICLE                        QTE\n");
        $printer -> text("---------------------------------------\n");







            $taille = strlen($prod->getDesignation());
            $ajout = 37 - $taille  ;
            $printer -> text($prod->getDesignation()." ".str_repeat(" ", $ajout) .$cmd->getQuantite()."\n");









//        $printer -> setJustification();
//        $printer -> cut();
//
////        /* Close printer */
//        $printer -> close();



        if($num == 1){

            $tab->setOccupe(0);
            $ticket = $em
                ->getRepository('APCaisseBundle:ticket')->find($bon->getTicket()->getId());
            $em->persist($tab);
            $em->remove($ticket);
            $em->flush();

        }else{
        $em->remove($cmd);
        $em->flush();
        }
        return $this->redirectToRoute('ap_caisse_table',array('id'=>$tab->getId()));







    }














}
