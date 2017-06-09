<?php

namespace AP\CaisseBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ticket
 *
 * @ORM\Table(name="ticket")
 * @ORM\Entity(repositoryClass="AP\CaisseBundle\Repository\ticketRepository")
 */
class ticket
{

    /**
     * @ORM\ManyToOne(targetEntity="AP\UsersBundle\Entity\employes",inversedBy="tickets")
     * @ORM\JoinColumn(nullable=false)
     */

    private $employes;



    /**
     * @ORM\OneToMany(targetEntity="AP\CaisseBundle\Entity\boncommande",mappedBy="ticket")
     * @ORM\JoinColumn(nullable=false)
     */

    private $boncommandes;



    /**
     * @ORM\ManyToOne(targetEntity="AP\CaisseBundle\Entity\tables",inversedBy="tickets")
     * @ORM\JoinColumn(nullable=false)
     */

    private $tables;




    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var bool
     *
     * @ORM\Column(name="etat", type="boolean")
     */
    private $etat;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetime")
     */
    private $date;



    /**
     * @var int
     *
     * @ORM\Column(name="prix", type="integer", nullable=true)
     */
    private $prix;


    /**
     * @var string
     *
     * @ORM\Column(name="mode", type="string", length=50, nullable=true)
     */
    private $mode;


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
     * Set etat
     *
     * @param boolean $etat
     *
     * @return ticket
     */
    public function setEtat($etat)
    {
        $this->etat = $etat;

        return $this;
    }

    /**
     * Get etat
     *
     * @return bool
     */
    public function getEtat()
    {
        return $this->etat;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return ticket
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
     * Set employes
     *
     * @param \AP\UsersBundle\Entity\employes $employes
     *
     * @return ticket
     */
    public function setEmployes(\AP\UsersBundle\Entity\employes $employes)
    {
        $this->employes = $employes;

        return $this;
    }

    /**
     * Get employes
     *
     * @return \AP\UsersBundle\Entity\employes
     */
    public function getEmployes()
    {
        return $this->employes;
    }

    /**
     * Set tables
     *
     * @param \AP\CaisseBundle\Entity\tables $tables
     *
     * @return ticket
     */
    public function setTables(\AP\CaisseBundle\Entity\tables $tables)
    {
        $this->tables = $tables;

        return $this;
    }

    /**
     * Get tables
     *
     * @return \AP\CaisseBundle\Entity\tables
     */
    public function getTables()
    {
        return $this->tables;
    }

    /**
     * Add boncommande
     *
     * @param \AP\CaisseBundle\Entity\boncommande $boncommande
     *
     * @return ticket
     */
    public function addBoncommande(\AP\CaisseBundle\Entity\boncommande $boncommande)
    {
        $this->boncommandes[] = $boncommande;

        return $this;
    }

    /**
     * Remove boncommande
     *
     * @param \AP\CaisseBundle\Entity\boncommande $boncommande
     */
    public function removeBoncommande(\AP\CaisseBundle\Entity\boncommande $boncommande)
    {
        $this->boncommandes->removeElement($boncommande);
    }

    /**
     * Get boncommandes
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getBoncommandes()
    {
        return $this->boncommandes;
    }

    /**
     * Set prix
     *
     * @param integer $prix
     *
     * @return ticket
     */
    public function setPrix($prix)
    {
        $this->prix = $prix;

        return $this;
    }

    /**
     * Get prix
     *
     * @return integer
     */
    public function getPrix()
    {
        return $this->prix;
    }

    /**
     * Set mode
     *
     * @param string $mode
     *
     * @return ticket
     */
    public function setMode($mode)
    {
        $this->mode = $mode;

        return $this;
    }

    /**
     * Get mode
     *
     * @return string
     */
    public function getMode()
    {
        return $this->mode;
    }
}
