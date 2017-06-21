<?php

namespace AP\ProductsBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        $from = date("Y-m-d H:i:s",mktime(6, 0, 0, date("m"),date("d")-100, date("Y")));
        $to = date("Y-m-d H:i:s",mktime(date("H"), date("i"), 0, date("m"),date("d"), date("Y")));

        $em = $this->getDoctrine()->getManager();



        $table = $em
            ->getRepository('APCaisseBundle:ticket')
            ->findBy(array('etat' => 1))
        ;


        return $this->render('APProductsBundle:Default:index.html.twig',array('table'=>ceil(count($table)),'from'=>$from,'to'=>$to));
    }
}
