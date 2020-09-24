const path = require('path');
const fs = require('fs');
const db = require('../database/models');
const Article = db.Article;
const Style = db.Style;
const {check,validationResult,body} = require('express-validator');

const Op = db.Sequelize.Op;

module.exports = {
    
    admin : function(req, res){
        const estadios = Article.findAll();
        
        Promise.all([estadios]) 
        .then(([estadios]) =>{
            res.render(path.resolve(__dirname, '..','views','administrador','listadoProductos'),{estadios});
        })
    },
    create: function (req, res){
        res.render(path.resolve(__dirname, '..','views','administrador','create'));
    },
    save: (req,res)=>{
        let errors = validationResult(req);
       
        if (errors.isEmpty()) {
            let nuevoTour = {
                footballTeam: req.body.equipo,
                stadiumName: req.body.estadio,
                description: req.body.descripcion,
                price: req.body.precio,
                image: req.file ? req.file.filename : '',
            };
            Article.create(nuevoTour)
            .then( cancha =>{
                res.redirect('/administrador');
            })
        }else{
            return res.render(path.resolve(__dirname, '../views/administrador/create'), {
                errors: errors.mapped(),  old: req.body
              });
        }        
    },
    show: (req,res)=>{
        Article.findByPk(req.params.id)  
        .then(miTour =>{
            res.render(path.resolve(__dirname, '..','views','administrador','detalleAdmin'), {miTour:miTour})
        })  
        .catch(error => res.send(error))
    
    },
    edit: (req,res) => { //! Listo
        Article.findByPk(req.params.id)
        .then(tourEditar => {
            res.render(path.resolve(__dirname, '..','views','administrador','edit'), {tourEditar});
        })
    },
    update: (req,res) =>{

        let errors = validationResult(req);

        if(errors.isEmpty()){

        
        const _body = req.body;
        //return res.send(_body);
        _body.footballTeam = req.body.equipo,
        _body.stadiumName = req.body.estadio,
        _body.description = req.body.descripcion,
        _body.price =  req.body.precio,
        _body.image = req.file ? req.file.filename : req.body.oldImagen    // if ternario       

        Article.update(_body ,{
            where : {
                id : req.params.id
            }
        })
        .then(estadios =>{
            res.redirect('/administrador')
        })
        .catch(error => res.send(error));     //error de Base de Datos
        
    }else{
        Article.findByPk(req.params.id)
        .then(tourEditar=>{
            return res.render(path.resolve(__dirname, '..','views','administrador','edit'), {errors: errors.errors, tourEditar})
        })        
    }
    },
    destroy: (req,res) => {
        Article.destroy({
                where : {
                   id:  req.params.id
                },
                force : true 
        })
        .then(confirm =>{
                res.redirect('/administrador');
        })
    },
    search: ( req, res) =>{
        Article.findAll({
            where:{
                stadiumName: {[Op.like]: `%${req.query.search}%`}
            }
        })
        .then(resultado => { res.render(path.resolve(__dirname, '..', 'views', 'administrador', 'listadoProductos'),{estadios: resultado});})
        .catch(error => res.send(error))
    },
    
}