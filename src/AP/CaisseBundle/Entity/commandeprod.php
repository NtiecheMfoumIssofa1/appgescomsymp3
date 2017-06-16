<?php

namespace AP\CaisseBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * commandeprod
 *
 * @ORM\Table(name="commandeprod")
 * @ORM\Entity(repositoryClass="AP\CaisseBundle\Repository\commandeprodRepository")
 */
class commandeprod

{






    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;


    /**
     * @ORM\ManyToOne(targetEntity="AP\CaisseBundle\Entity\boncommande",cascade={"persist"},inversedBy="commandeprods")
     * @ORM\JoinColumn(nullable=false)
     */

    private $bon;


    /**
     * @ORM\ManyToOne(targetEntity="AP\ProductsBundle\Entity\Product",cascade={"persist"})
     * @ORM\JoinColumn(nullable=false)
     */
    private $produit;

    /**
     * @var int
     *
     * @ORM\Column(name="quantite", type="integer")
     */
    private $quantite;


    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;

    public function __construct()
    {
        $this->date       = new \Datetime();
    }


    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }




    /**
     * Set quantite
     *
     * @param integer $quantite
     *
     * @return commandeprod
     */
    public function setQuantite($quantite)
    {
        $this->quantite = $quantite;

        return $this;
    }

    /**
     * Get quantite
     *
     * @return int
     */
    public function getQuantite()
    {
        return $this->quantite;
    }

    /**
     * Set bon
     *
     * @param \AP\CaisseBundle\Entity\boncommande $bon
     *
     * @return commandeprod
     */
    public function setBon(\AP\CaisseBundle\Entity\boncommande $bon)
    {
        $this->bon = $bon;

        return $this;
    }

    /**
     * Get bon
     *
     * @return \AP\CaisseBundle\Entity\boncommande
     */
    public function getBon()
    {
        return $this->bon;
    }

    /**
     * Set produit
     *
     * @param \AP\ProductsBundle\Entity\Product $produit
     *
     * @return commandeprod
     */
    public function setProduit(\AP\ProductsBundle\Entity\Product $produit)
    {
        $this->produit = $produit;

        return $this;
    }

    /**
     * Get produit
     *
     * @return \AP\ProductsBundle\Entity\Product
     */
    public function getProduit()
    {
        return $this->produit;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return commandeprod
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {

        return $this->date;
    }
}
