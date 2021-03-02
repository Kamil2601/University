using System;
using System.Collections.Generic;

namespace Zad3
{
    public abstract class Tree
    {
    }
    public class TreeNode : Tree
    {
        public Tree Left { get; set; }
        public Tree Right { get; set; }
    }
    public class TreeLeaf : Tree
    {
        public int Value { get; set; }
    }

    public abstract class TreeVisitor
    {
        public void Visit(Tree tree)
        {
            if (tree is TreeNode)
                this.VisitNode((TreeNode)tree);
            if (tree is TreeLeaf)
                this.VisitLeaf((TreeLeaf)tree);
        }
        public virtual void VisitNode(TreeNode node)
        {
            if (node != null)
            {
                this.Visit(node.Left);
                this.Visit(node.Right);
            }
        }
        public virtual void VisitLeaf(TreeLeaf leaf)
        {
        }
    }


    public class HeightTreeVisitor : TreeVisitor
    {
        public int Height { get; set; }

        public override void VisitNode(TreeNode node)
        {
            if (node != null)
            {
                this.Visit(node.Left);
                int leftHeight = Height;

                this.Visit(node.Right);
                int rightHeight = Height;

                Height = Math.Max(leftHeight, rightHeight) + 1;
            }
        }

        public override void VisitLeaf(TreeLeaf leaf)
        {
            Height = 1;
        }
    }

    class Program
    {
        public static void Main()
        {
            var tree = new TreeNode(){
                Left = new TreeNode(){
                    Left = new TreeNode()
                    {
                        Left = new TreeLeaf(),
                        Right = new TreeLeaf(),
                    },
                    Right = new TreeLeaf(),
                },
                Right = new TreeLeaf(),
            };

            var visitor = new HeightTreeVisitor();
            visitor.Visit(tree);
            Console.WriteLine("Wysokość drzewa to {0}", visitor.Height);
        }
    }
}