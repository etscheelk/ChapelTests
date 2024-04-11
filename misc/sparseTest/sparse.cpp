#include <iostream>
#include <vector>
// #include <type_traits>
#include <unordered_map>
// #include <set>

// #include <exception>

using namespace std;

// template <typename T>
// struct matrixPair : pair<size_t, T> 
// {
//     size_t columnIndex;
//     T value;
//     matrixPair(size_t columnIndex, T value) : columnIndex(columnIndex), value(value) { }

// };

// namespace std 
// {
//     template<typename T>
//     class hash<matrixPair<T>>
//     {
//     public:
//         size_t operator()(const matrixPair<T>& mp) const
//         {
//             return mp.columnIndex;
//         }
//     };
// }

// template <typename T>
// struct row : set<matrixPair<T>>
// {
// private:


    

// public:
//     row() : set<matrixPair<T>>()
//     {
        
//     }

    
//     void insert(matrixPair<T> in) : this->insert(in) override {  }

//     ~row() 
//     {
        
//     }


//     matrixPair<T> operator [] (size_t index)  const
//     {
//         // matrixPair<T> dummy(index, T);
//         // int present = this->count(dummy);

//         // if (present)
//         // {
//         //     return this->operator[dummy];
//         // }

//         // else
//         // {
//         //     return nullptr;
//         // }
//     }

//     matrixPair<T>& operator [] (size_t index)
//     {
        
//     }
// };

class ListOfList 
{
private:
    vector<unordered_map<size_t, double>> A;

public:
    size_t numRows, numCols;

    /**
     * @brief Construct a new List Of List object. This is a sparse matrix.
     * 
     * Assume it is indexed at 1.
     * 
     * @param numRows 
     * @param numCols 
     */
    ListOfList(size_t numRows, size_t numCols) : A(numRows), numCols(numCols), numRows(numRows)
    {   
    }

    /**
     * @brief Assume indexed at 1. 
     * 
     * @param row 
     * @param col 
     * @param val 
     * @return true
     * @return false 
     */
    void add(size_t row, size_t col, double val)
    {
        if (row > numRows || col > numCols)
        {
            throw invalid_argument("Row or column index outside of A");
        }

        A[row-1].erase(col-1);
        A[row-1][col-1] = val;
    }

    void remove(size_t row, size_t col)
    {
        if (row > numRows || col > numCols)
        {
            throw invalid_argument("Row or column index outside size of A");
        }

        A[row-1].erase(col-1);
    }

    vector<double> vecMult(const vector<double>& x)
    {
        if (numCols != x.size())
        {
            throw invalid_argument("Number of columns of A not matching size of x");
        }

        vector<double> out(numRows);

        for (int outRow = 0; outRow < numRows; ++outRow)
        {
            const unordered_map<size_t, double>& row = A[outRow];
            double place = 0.0;
            for (const pair<size_t, double> p : row)
            {
                place += p.second * x[p.first];
            }
    
            out[outRow] = place;
        }

        return out;
    }
};


int main(int argc, char* argv[]) 
{
    ListOfList A(5, 6);
    A.add(1, 2, 7);
    A.add(1, 5, 2);

    A.add(2, 1, -1);
    A.add(2, 6, 5);
    
    A.add(3, 4, 3);

    A.add(4, 2, 4);
    A.add(4, 5, 2);

    A.add(5, 3, 9);

    vector<double> x = {2, 3, 5, 1, 4, 6};

    vector<double> out = A.vecMult(x);

    for (const auto& o : out)
    {
        cout << o << " ";
    } cout << endl;
    

    // matrixPair<int> a(12, 10);

    // cout << a.columnIndex << endl;

    // hash<matrixPair<int>> hash_fn;
    // cout << hash_fn(a) << endl;

    // row<int> b;

    

    
    // typedef double RealN;
    // size_t Arows = 5;
    // size_t Acols = 6;
    // vector<unordered_map<size_t, RealN>> A(5);
    // A[0][2] = 7;
    // A[0][5] = 2; 

    // A[1][1] = -1; 
    // A[1][6] = 5;

    // A[2][4] = 3;

    // A[3][2] = 4;
    // A[3][5] = 2;

    // A[4][3] = 9;

    // vector<int> x = {2, 3, 5, 1, 4, 6};
    // if (Acols != x.size())
    // {
    //     // sadness   
    // }

    // vector<int> out(Arows);

    // for (int outRow = 0; outRow < Arows; ++outRow)
    // {
    //     unordered_map<size_t, RealN> row = A[outRow];
    //     RealN place = 0;
    //     for (pair<size_t, RealN> p : row)
    //     {
    //         place += p.second * x[p.first-1];
    //     }
 
    //     out[outRow] = place;
    // }

    // for (auto x : out) {
    //     cout << x << " ";
    // } cout << endl;



    
    
}