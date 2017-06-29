<?php

namespace AP\ProductsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $from = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d"), date("Y")));
        $to = date("Y-m-d H:i:s",mktime(date("H")+1, 0, 0, date("m"),date("d"), date("Y")));


        $em = $this->getDoctrine()->getManager();



            $tmp = [];



            $u = $this->getUser()->getId();


        $connection = $em->getConnection();
            $statement = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='especes' AND ticket.date BETWEEN '$from' AND '$to'");
            $statement->execute();
            $cmd = $statement->fetchAll();

            foreach ($cmd as $cmdx) {
                $tmp['espece'] = $cmdx['paiemode'];

            }




            $statement1 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='carte' AND ticket.date BETWEEN '$from' AND '$to'");
            $statement1->execute();
            $cmd1 = $statement1->fetchAll();

            foreach ($cmd1 as $cmdx) {
                $tmp['carte'] = $cmdx['paiemode'];
            }


            $statement2 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='Orange Money' AND ticket.date BETWEEN '$from' AND '$to'");
            $statement2->execute();
            $cmd2 = $statement2->fetchAll();

            foreach ($cmd2 as $cmdx) {
                $tmp['orange'] = $cmdx['paiemode'];
            }

        $statement3 = $connection->prepare("SELECT SUM(prix) AS paiemode,employes_id,mode FROM ticket WHERE employes_id='$u' AND mode ='credit' AND ticket.date BETWEEN '$from' AND '$to'");
        $statement3->execute();
        $cmd3 = $statement3->fetchAll();

        foreach ($cmd3 as $cmdx) {
            $tmp['credit'] = $cmdx['paiemode'];
        }

        $table = $em
            ->getRepository('APCaisseBundle:ticket')
            ->findBy(array('etat' => 1))
        ;


        return $this->render('APProductsBundle:Default:index.html.twig',array('table'=>ceil(count($table)),'from'=>$from,'to'=>$to,'clos'=>$tmp));
    }
}
