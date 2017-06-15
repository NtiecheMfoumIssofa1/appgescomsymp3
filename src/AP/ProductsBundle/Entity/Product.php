<?php

namespace AP\ProductsBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Product
 *
 * @ORM\Table(name="product")
 * @ORM\Entity(repositoryClass="AP\ProductsBundle\Repository\ProductRepository")
 */
class Product
{

    /**
     * @ORM\ManyToOne(targetEntity="AP\ProductsBundle\Entity\Category")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;


    /**
     * @ORM\OneToOne(targetEntity="AP\ProductsBundle\Entity\thumbnail", cascade={"persist"})
     */
    public $thumbnail;

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
     * @ORM\Column(name="code", type="string", length=20)
     */
    private $code;

    /**
     * @var string
     *
     * @ORM\Column(name="designation", type="string", length=100)
     */
    private $designation;

    /**
     * @var int
     *
     * @ORM\Column(name="Prixvente", type="integer")
     */
    private $prixvente;

    /**
     * @var int
     *
     * @ORM\Column(name="prixachat", type="integer")
     */
    private $prixachat;

    /**
     * @var int
     *
     * @ORM\Column(name="qtestock", type="integer", nullable=true)
     */
    private $qtestock;

    /**
     * @var int
     *
     * @ORM\Column(name="qtemin", type="integer", nullable=true)
     */
    private $qtemin;

    /**
     * @var bool
     *
     * @ORM\Column(name="gerstock", type="boolean")
     */
    private $gerstock;

    /**
     * @var int
     *
     * @ORM\Column(name="typeproduit", type="smallint")
     */
    private $typeproduit;

    /**
     * @var int
     *
     * @ORM\Column(name="qtepart", type="smallint", nullable=true)
     */
    private $qtepart;

    /**
     * @var int
     *
     * @ORM\Column(name="nbrediv", type="smallint", nullable=true)
     */
    private $nbrediv;

    /**
     * @var int
     *
     * @ORM\Column(name="divvendu", type="smallint", nullable=true)
     */
    private $divvendu;

    /**
     * @var int
     *
     * @ORM\Column(name="prodparent", type="text", nullable=true)
     */
    private $prodparent;


    /**
     * @ORM\ManyToMany(targetEntity="Product", mappedBy="children")
     */
    protected $parent;

    /**
     * @ORM\ManyToMany(targetEntity="Product", inversedBy="parent")
     */
    protected $children;


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
     * Set code
     *
     * @param string $code
     *
     * @return Product
     */
    public function setCode($code)
    {
        $this->code = $code;

        return $this;
    }


    public function setStock($qte)
    {
        $this->qtestock = $this->getQtestock() - $qte;

        return $this;
    }

    /**
     * Get code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
    }

    /**
     * Set designation
     *
     * @param string $designation
     *
     * @return Product
     */
    public function setDesignation($designation)
    {
        $this->designation = $designation;

        return $this;
    }

    /**
     * Get designation
     *
     * @return string
     */
    public function getDesignation()
    {
        return $this->designation;
    }

    /**
     * Set prixvente
     *
     * @param integer $prixvente
     *
     * @return Product
     */
    public function setPrixvente($prixvente)
    {
        $this->prixvente = $prixvente;

        return $this;
    }

    /**
     * Get prixvente
     *
     * @return int
     */
    public function getPrixvente()
    {
        return $this->prixvente;
    }

    /**
     * Set prixachat
     *
     * @param integer $prixachat
     *
     * @return Product
     */
    public function setPrixachat($prixachat)
    {
        $this->prixachat = $prixachat;

        return $this;
    }

    /**
     * Get prixachat
     *
     * @return int
     */
    public function getPrixachat()
    {
        return $this->prixachat;
    }

    /**
     * Set qtestock
     *
     * @param integer $qtestock
     *
     * @return Product
     */
    public function setQtestock($qtestock)
    {
        $this->qtestock = $qtestock;

        return $this;
    }

    /**
     * Get qtestock
     *
     * @return int
     */
    public function getQtestock()
    {
        return $this->qtestock;
    }

    /**
     * Set qtemin
     *
     * @param integer $qtemin
     *
     * @return Product
     */
    public function setQtemin($qtemin)
    {
        $this->qtemin = $qtemin;

        return $this;
    }

    /**
     * Get qtemin
     *
     * @return int
     */
    public function getQtemin()
    {
        return $this->qtemin;
    }

    /**
     * Set gerstock
     *
     * @param boolean $gerstock
     *
     * @return Product
     */
    public function setGerstock($gerstock)
    {
        $this->gerstock = $gerstock;

        return $this;
    }

    /**
     * Get gerstock
     *
     * @return bool
     */
    public function getGerstock()
    {
        return $this->gerstock;
    }

    /**
     * Set typeproduit
     *
     * @param integer $typeproduit
     *
     * @return Product
     */
    public function setTypeproduit($typeproduit)
    {
        $this->typeproduit = $typeproduit;

        return $this;
    }

    /**
     * Get typeproduit
     *
     * @return int
     */
    public function getTypeproduit()
    {
        return $this->typeproduit;
    }

    /**
     * Set qtepart
     *
     * @param integer $qtepart
     *
     * @return Product
     */
    public function setQtepart($qtepart)
    {
        $this->qtepart = $qtepart;

        return $this;
    }

    /**
     * Get qtepart
     *
     * @return int
     */
    public function getQtepart()
    {
        return $this->qtepart;
    }

    /**
     * Set nbrediv
     *
     * @param integer $nbrediv
     *
     * @return Product
     */
    public function setNbrediv($nbrediv)
    {
        $this->nbrediv = $nbrediv;

        return $this;
    }

    /**
     * Get nbrediv
     *
     * @return int
     */
    public function getNbrediv()
    {
        return $this->nbrediv;
    }

    /**
     * Set divvendu
     *
     * @param integer $divvendu
     *
     * @return Product
     */
    public function setDivvendu($divvendu)
    {
        $this->divvendu = $divvendu;

        return $this;
    }

    /**
     * Get divvendu
     *
     * @return int
     */
    public function getDivvendu()
    {
        return $this->divvendu;
    }

    /**
     * Set prodparent
     *
     * @param integer $prodparent
     *
     * @return Product
     */
    public function setProdparent($prodparent)
    {
        $this->prodparent = $prodparent;

        return $this;
    }

    /**
     * Get prodparent
     *
     * @return int
     */
    public function getProdparent()
    {
        return $this->prodparent;
    }

    /**
     * Set category
     *
     * @param \AP\ProductsBundle\Entity\Category $category
     *
     * @return Product
     */
    public function setCategory(\AP\ProductsBundle\Entity\Category $category)
    {
        $this->category = $category;

        return $this;
    }

    /**
     * Get category
     *
     * @return \AP\ProductsBundle\Entity\Category
     */
    public function getCategory()
    {
        return $this->category;
    }
    public function __toString() {
        $no = $this->getCode();
        return $no ;
    }

    /**
     * Set thumbnail
     *
     * @param \AP\ProductsBundle\Entity\thumbnail $thumbnail
     *
     * @return Product
     */
    public function setThumbnail(\AP\ProductsBundle\Entity\thumbnail $thumbnail = null)
    {
        $this->thumbnail = $thumbnail;

        return $this;
    }

    /**
     * Get thumbnail
     *
     * @return \AP\ProductsBundle\Entity\thumbnail
     */
    public function getThumbnail()
    {
        return $this->thumbnail;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->parent = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add parent
     *
     * @param \AP\ProductsBundle\Entity\Product $parent
     *
     * @return Product
     */
    public function addParent(\AP\ProductsBundle\Entity\Product $parent)
    {
        $this->parent[] = $parent;

        return $this;
    }

    /**
     * Remove parent
     *
     * @param \AP\ProductsBundle\Entity\Product $parent
     */
    public function removeParent(\AP\ProductsBundle\Entity\Product $parent)
    {
        $this->parent->removeElement($parent);
    }

    /**
     * Get parent
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getParent()
    {
        return $this->parent;
    }

    /**
     * Set children
     *
     * @param \AP\ProductsBundle\Entity\Product $children
     *
     * @return Product
     */
    public function setChildren(\AP\ProductsBundle\Entity\Product $children = null)
    {
        $this->children = $children;

        return $this;
    }

    /**
     * Get children
     *
     * @return \AP\ProductsBundle\Entity\Product
     */
    public function getChildren()
    {
        return $this->children;
    }

    /**
     * Add child
     *
     * @param \AP\ProductsBundle\Entity\Product $child
     *
     * @return Product
     */
    public function addChild(\AP\ProductsBundle\Entity\Product $child)
    {
        $this->children[] = $child;

        return $this;
    }

    /**
     * Remove child
     *
     * @param \AP\ProductsBundle\Entity\Product $child
     */
    public function removeChild(\AP\ProductsBundle\Entity\Product $child)
    {
        $this->children->removeElement($child);
    }
}
