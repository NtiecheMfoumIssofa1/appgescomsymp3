<?php

namespace AP\StockBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use AP\ProductsBundle\Entity\Product;
use AP\StockBundle\Entity\stockoperation;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;



use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;


class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('APStockBundle:Default:index.html.twig');
    }


    public function prodfetchAction(Request $request,$id)
    {

        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');

        $query = $produit->createQueryBuilder('a')
            ->where('a.designation LIKE :title')
            ->andWhere('a.gerstock = 1')
            ->setParameter('title', '%'.$id.'%')
            ->getQuery()
            ->getResult();



        $output = '<ul class="list-group" id="stock_products_ul" >';
        foreach ($query as $ad) {
            $output .= '<li class="list-group-item">' . $ad->getDesignation() . '</li>';
        }
        $output .= '</ul>';




        return new Response($output);

    }


    public function addrowAction(Request $request,$id,$qt)
    {

        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');



        $prod = $produit->findOneByDesignation($id);

 $total = $prod->getQtestock() + $qt;

        $output = '   <tr class="even pointer">

                                            <td class="code">'. $prod->getCode() .'</td>
                                            <td>'. $prod->getDesignation() .'</td>
                                            <td>'. $prod->getQtestock() .'</td>
                                            <td class="qte">'. $qt .'</td>
                                            <td>'. $total .'</td>
                                            <td class="a-right a-right ">'. $prod->getPrixachat() .'</td>
                                            <td class="a-right a-right ">'. $prod->getPrixvente() .'</td>


                                            <td class=" last">
                                                <a href="#" id="trash" title="supprimer"><i class="fa fa-trash"></i> </a>&nbsp;&nbsp;
                                            </td>
                                        </tr>';








        return new Response($output);

    }


    public function addentryAction(Request $request,$id)
    {

        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');





        $donnes = explode('|',$id);

        $date = new \Datetime();
        $trans = "EN".uniqid();


        foreach ($donnes as $inser){

            $txt = explode('~',$inser);


                $prod = $produit->findOneByCode($txt[0]);

if(!is_null($prod)){

                $newqte = $prod->getQtestock() + $txt[1];
                $entre = new stockoperation();


                $entre->setIdtrans($trans);
                $entre->setDate($date);
                $entre->setIdprod($prod->getId());
                $entre->setQuantiteprec($prod->getQtestock());
                $entre->setQuantite($txt[1]);
                $entre->setType(1);
                $entre->setProd($prod->getDesignation());

                $em->persist($entre);
    $prod->setQtestock($newqte);

                $em->flush();


}


}






        return new Response("Entrée de produit reussie");

    }




    public function sortiAction()
    {
        return $this->render('APStockBundle:Default:sorti.html.twig');
    }




    public function addoutAction(Request $request,$id,$cause)
    {

        $em = $this->getDoctrine()->getManager();
        $produit = $em->getRepository('APProductsBundle:Product');





        $donnes = explode('|',$id);

        $date = new \Datetime();
        $trans = "ST".uniqid();


        foreach ($donnes as $inser){

            $txt = explode('~',$inser);


            $prod = $produit->findOneByCode($txt[0]);

            if(!is_null($prod)){

                $newqte = $prod->getQtestock() + $txt[1];
                $entre = new stockoperation();


                $entre->setIdtrans($trans);
                $entre->setDate($date);
                $entre->setIdprod($prod->getId());
                $entre->setQuantiteprec($prod->getQtestock());
                $entre->setQuantite($txt[1]);
                $entre->setType(2);
                $entre->setCause($cause);
                $entre->setProd($prod->getDesignation());

                $em->persist($entre);
                $prod->setQtestock($newqte);

                $em->flush();


            }


        }






        return new Response("Sortie de produit reussie");

    }

    public function histoAction()
    {

        $em = $this->getDoctrine()->getManager();
        $operation = $em->getRepository('APStockBundle:stockoperation');
        $liste = $operation->findBy(
            array(),
            array('id' => 'desc')
        );



        return $this->render('APStockBundle:Default:histo.html.twig',array('liste'=>$liste));
    }


    public function invAction()
    {

        $em = $this->getDoctrine()->getManager();
        $operation = $em->getRepository('APProductsBundle:Product');
        $liste = $operation->findBy(
            array('gerstock'=>1),
            array()
        );
$total1=0;
foreach ($liste as $l){

    $total1 = $total1 + ($l->getPrixvente()*$l->getQtestock());
}

$total = number_format($total1, '0', '.', ' ');
        return $this->render('APStockBundle:Default:inv.html.twig',array('liste'=>$liste,'total'=>$total));
    }


}
