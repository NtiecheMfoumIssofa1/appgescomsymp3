<?php

namespace AP\StockBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * stockoperation
 *
 * @ORM\Table(name="stockoperation")
 * @ORM\Entity(repositoryClass="AP\StockBundle\Repository\stockoperationRepository")
 */
class stockoperation
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
     * @var string
     *
     * @ORM\Column(name="idtrans", type="string", length=100)
     */
    private $idtrans;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="date")
     */
    private $date;

    /**
     * @var int
     *
     * @ORM\Column(name="idprod", type="integer")
     */
    private $idprod;

    /**
     * @var int
     *
     * @ORM\Column(name="quantite", type="integer")
     */
    private $quantite;

    /**
     * @var int
     *
     * @ORM\Column(name="quantiteprec", type="integer")
     */
    private $quantiteprec;

    /**
     * @var string
     *
     * @ORM\Column(name="cause", type="string", length=255, nullable=true)
     */
    private $cause;

    /**
     * @var string
     *
     * @ORM\Column(name="prod", type="string", length=255, nullable=true)
     */
    private $prod;

    /**
     * @var int
     *
     * @ORM\Column(name="type", type="smallint")
     */
    private $type;


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
     * Set idtrans
     *
     * @param string $idtrans
     *
     * @return stockoperation
     */
    public function setIdtrans($idtrans)
    {
        $this->idtrans = $idtrans;

        return $this;
    }

    /**
     * Get idtrans
     *
     * @return string
     */
    public function getIdtrans()
    {
        return $this->idtrans;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return stockoperation
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

    /**
     * Set idprod
     *
     * @param integer $idprod
     *
     * @return stockoperation
     */
    public function setIdprod($idprod)
    {
        $this->idprod = $idprod;

        return $this;
    }

    /**
     * Get idprod
     *
     * @return int
     */
    public function getIdprod()
    {
        return $this->idprod;
    }

    /**
     * Set quantite
     *
     * @param integer $quantite
     *
     * @return stockoperation
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
     * Set quantiteprec
     *
     * @param integer $quantiteprec
     *
     * @return stockoperation
     */
    public function setQuantiteprec($quantiteprec)
    {
        $this->quantiteprec = $quantiteprec;

        return $this;
    }

    /**
     * Get quantiteprec
     *
     * @return int
     */
    public function getQuantiteprec()
    {
        return $this->quantiteprec;
    }

    /**
     * Set cause
     *
     * @param string $cause
     *
     * @return stockoperation
     */
    public function setCause($cause)
    {
        $this->cause = $cause;

        return $this;
    }

    /**
     * Get cause
     *
     * @return string
     */
    public function getCause()
    {
        return $this->cause;
    }

    /**
     * Set type
     *
     * @param integer $type
     *
     * @return stockoperation
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Get type
     *
     * @return int
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set prod
     *
     * @param string $prod
     *
     * @return stockoperation
     */
    public function setProd($prod)
    {
        $this->prod = $prod;

        return $this;
    }

    /**
     * Get prod
     *
     * @return string
     */
    public function getProd()
    {
        return $this->prod;
    }
}
