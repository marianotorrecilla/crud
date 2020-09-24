const path = require('path');
const fs = require('fs');
const db = require('../database/models');
const Article = db.Article;

module.exports = {
    index: function(req,res){
        Article.findAll()
        .then(estadios =>{
          res.render(path.resolve(__dirname, '..','views','productos','productos'), {estadios})
        })
        .catch(error => res.send(error))
    },
    detalle: (req,res)=>{
        Article.findByPk(req.params.id)
        .then(miTourDetalle =>{
          res.render(path.resolve(__dirname, '..','views','productos','detalle'), {miTourDetalle})
        })
        .catch(error => res.send(error))
    },
}