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

    /* Print a "Hello world" receipt" */
    $printer = new Printer($bar);
	 $printer -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer -> text(date('d/m/Y '));
	$printer -> setJustification(Printer::JUSTIFY_RIGHT);
	 $printer -> text(date('H:i')."\n");
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
	$printer -> text("Table: ".$table->getNom()."     Ticket:".$ticket->getId()."\n");
	$printer -> text("--------------------\n");
	 $printer -> setTextSize(1, 1);
	$printer -> text("QTE   ARTICLE\n");
	$printer -> text("-------------------------------\n");
		
		
		
	


	// cuisine
	
	   /* Print a "Hello world" receipt" */
    $printer1 = new Printer($cuisine);
	 $printer1 -> setJustification(Printer::JUSTIFY_LEFT);
	 $printer1 -> text(date('d/m/Y '));
	$printer1 -> setJustification(Printer::JUSTIFY_RIGHT);
	 $printer1 -> text(date('H:i')."\n");
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
			$printer1 -> setTextSize(2, 1);
	$printer1 -> text($p->product_quantity." ".$pr->getDesignation()."\n");
	$printer1 -> feed(1);
			}else
  {
	 $printer -> setTextSize(2, 1);
	$printer -> text($p->product_quantity."  ".$pr->getDesignation()."\n");
	$printer -> feed(1);


}



        }

//		if(isset($cui)){
//
//	$printer1 -> setJustification();
//      $printer1 -> cut();
//
//    /* Close printer */
//    $printer1 -> close();
//	}
//$printer -> setJustification();
//      $printer -> cut();
//
//    /* Close printer */
//    $printer -> close();

        $em->flush();
		
		
	
		
		


        $output = ' <div class="alert alert-success alert-dismissible fade in" role="alert" style="width: 100%;position: relative;top: 10px;padding:5px 20px;">
           
            <strong>  <i class="fa fa-paper-plane-o"> </i> COMMANDE ENVOYEE</strong> 
        </div>';




        return new Response($output);


    }


    public function ticketAction($id,$mode,$total)
    {


        $em = $this->getDoctrine()->getManager();
        $ticket = $em
            ->getRepository('APCaisseBundle:ticket')->find($id);

        $table = $em
            ->getRepository('APCaisseBundle:tables')->find($ticket->getTables());

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






        $bar = new WindowsPrintConnector("EPSON TM-T20II Receipt5");

        /* Print a "Hello world" receipt" */
        $printer = new Printer($bar);


        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Bastos \n");
        $printer -> feed(1);
        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> text("Tel: 655 55 55 55 \n");
        $printer -> feed(2);

        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(3, 1);
        $printer -> text("TICKET DE CAISSE  # ".$ticket->getId(). "\n");
        $printer -> feed(1);


        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("Table : ".$ticket->getTables()->getNom(). "\n");
        $printer -> feed(1);


        $printer -> setJustification(Printer::JUSTIFY_LEFT);
        $printer -> setTextSize(1, 1);
        $printer -> text("Serveur : ".$ticket->getEmployes()->getUsername()."                 ".date('d/m/Y  H:i')."\n");
        $printer -> feed(2);


        $printer -> setTextSize(1, 1);
        $printer -> text("QTE   ARTICLE            PRIX   TOT\n");
        $printer -> text("-------------------------------\n");




        foreach($ticket->getBoncommandes() as $bon) {


            foreach($bon as $cmd) {

                $printer -> text($cmd->getCommandeprods()->getQuantite()."  ".$cmd->getCommandeprods()->getProduit()->getDesignation()."      ".$cmd->getCommandeprods()->getProduit()->getPrixvente()."  ".$cmd->getCommandeprods()->getQuantite()*$cmd->getCommandeprods()->getProduit()->getPrixvente()."\n");
                $printer -> feed(1);
            }





        }

        $printer -> feed(1);

        $printer -> setJustification(Printer::JUSTIFY_RIGHT);
        $printer -> setTextSize(2, 1);
        $printer -> text("TOTAL:  ".number_format($total, '0', '.', ' ')."\n");
        $printer -> feed(3);



        $printer -> setJustification(Printer::JUSTIFY_CENTER);
        $printer -> setTextSize(1, 1);
        $printer -> text("MERCI DE VOTRE VISITE \n");



        $printer -> setJustification();
        $printer -> cut();

        /* Close printer */
        $printer -> close();















        return $this->redirectToRoute('ap_caisse_homepage');


    }






}
