#include <iostream>
#include <vector>
#include <type_traits>

#include <set>

using namespace std;

template <typename T>
struct matrixPair : pair<size_t, T> 
{
    size_t columnIndex;
    T value;
    matrixPair(size_t columnIndex, T value) : columnIndex(columnIndex), value(value) { }

};

namespace std 
{
    template<typename T>
    class hash<matrixPair<T>>
    {
    public:
        size_t operator()(const matrixPair<T>& mp) const
        {
            return mp.columnIndex;
        }
    };
}

template <typename T>
struct row : set<matrixPair<T>>
{
private:


    

public:
    row() : set<matrixPair<T>>()
    {
        
    }

    
    void insert(matrixPair<T> in) : this->insert(in) override {  }

    ~row() 
    {
        
    }


    matrixPair<T> operator [] (size_t index)  const
    {
        // matrixPair<T> dummy(index, T);
        // int present = this->count(dummy);

        // if (present)
        // {
        //     return this->operator[dummy];
        // }

        // else
        // {
        //     return nullptr;
        // }
    }

    matrixPair<T>& operator [] (size_t index)
    {
        
    }
};




int main(int argc, char* argv[]) 
{
    matrixPair<int> a(12, 10);

    cout << a.columnIndex << endl;

    hash<matrixPair<int>> hash_fn;
    cout << hash_fn(a) << endl;

    row<int> b;

    

    

    
}