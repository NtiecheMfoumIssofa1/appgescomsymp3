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
     * @var int
     *
     * @ORM\Column(name="bon", type="integer")
     */
    private $bon;

    /**
     * @var int
     *
     * @ORM\Column(name="produit", type="integer")
     */
    private $produit;

    /**
     * @var int
     *
     * @ORM\Column(name="quantite", type="integer")
     */
    private $quantite;


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
     * Set bon
     *
     * @param integer $bon
     *
     * @return commandeprod
     */
    public function setBon($bon)
    {
        $this->bon = $bon;

        return $this;
    }

    /**
     * Get bon
     *
     * @return int
     */
    public function getBon()
    {
        return $this->bon;
    }

    /**
     * Set produit
     *
     * @param integer $produit
     *
     * @return commandeprod
     */
    public function setProduit($produit)
    {
        $this->produit = $produit;

        return $this;
    }

    /**
     * Get produit
     *
     * @return int
     */
    public function getProduit()
    {
        return $this->produit;
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
}

