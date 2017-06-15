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

        foreach($produ as $p) {
            $pr = $em->getRepository('APProductsBundle:Product')->find($p->product_id);

            $pr->setstock($p->product_quantity);
            $cmdprod =new commandeprod();
            $cmdprod->setBon($bon);
            $cmdprod->setProduit($pr);
            $cmdprod->setQuantite($p->product_quantity);

            $em->persist($cmdprod);
            $em->persist($pr);




        }



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

        return $this->redirectToRoute('ap_caisse_homepage');


    }






}
