// Configuration for a semantic role labeler model based on:
//   He, Luheng et al. “Deep Semantic Role Labeling: What Works and What's Next.” ACL (2017).
{
  "dataset_reader":{"type":"image_srl"},
  "train_data_path": '/home/zijiao/work/multimodel_seq2seq/output/train/',
  "validation_data_path": '/home/zijiao/work/multimodel_seq2seq/output/val/',
  "model": {
    "type": "image_srl",
    "lamb": 0.2,
    "text_field_embedder": {
      "token_embedders": {
        "tokens": {
            "type": "embedding",
            "embedding_dim": 100,
            "pretrained_file": "https://allennlp.s3.amazonaws.com/datasets/glove/glove.6B.100d.txt.gz",
            "trainable": true
        }
      }
    },
    "initializer": [
      [
        "tag_projection_layer.*weight",
        {
          "type": "orthogonal"
        }
      ]
    ],
    "encoder": {
      "type": "stacked_self_attention",
      "input_dim": 200,
      "hidden_dim": 300,
      "projection_dim": 300,
      "feedforward_hidden_dim": 300,
      "num_attention_heads": 4,
      "num_layers": 8,
    },
    "binary_feature_dim": 100
  },
  "iterator": {
    "type": "bucket",
    "sorting_keys": [["tokens", "num_tokens"]],
    "batch_size" : 80
  },

  "trainer": {
    "num_epochs": 50,
    "grad_clipping": 1.0,
    "patience": 10,
    "validation_metric": "+f1-measure-overall",
    "cuda_device": 0,
    "optimizer": {
      "type": "adadelta",
      "rho": 0.95
    }
  }
}
